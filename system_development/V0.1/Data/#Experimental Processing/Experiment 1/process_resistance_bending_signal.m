% process_resistance_bending_signal.m
% Process resistance-vs-time bending data from CSV, TXT, LVM, XLSX, or XLS files.
%
% Run this script from the MATLAB command window. The only required input is
% the full path to the data file. Column 1 is treated as time, and column 2
% is treated as resistance.

clear;
clc;

%% User-adjustable processing parameters
medianWindow = 7;              % Samples for initial moving median filter
smoothingWindow = 11;          % Samples for Savitzky-Golay or moving average smoothing
baselineWindow = 101;          % Samples for rolling baseline moving median
peakProminence = [];           % Empty uses robust automatic estimate
troughProminence = [];         % Empty uses robust automatic estimate
minimumPeakTimeDistance = 0.2; % Minimum time between peaks/troughs, in seconds
hysteresisHighThreshold = [];  % Empty uses robust automatic estimate
hysteresisLowThreshold = [];   % Empty uses robust automatic estimate

useSavitzkyGolay = true;       % Falls back to moving average if unavailable
savitzkyGolayOrder = 3;

%% Load data
filePath = strtrim(input('Paste the full path to the data file: ', 's'));
filePath = stripWrappingQuotes(filePath);

if strlength(filePath) == 0
    error('No file path was provided.');
end

if ~isfile(filePath)
    error('File not found: %s', filePath);
end

[inputFolder, inputName, extension] = fileparts(filePath);
extension = lower(extension);

try
    switch extension
        case {'.csv', '.txt', '.lvm'}
            opts = detectImportOptions(filePath, 'FileType', 'text');
            dataTable = readtable(filePath, opts);
        case {'.xlsx', '.xls'}
            opts = detectImportOptions(filePath, 'FileType', 'spreadsheet');
            dataTable = readtable(filePath, opts);
        otherwise
            error('Unsupported file extension "%s". Use .csv, .txt, .lvm, .xlsx, or .xls.', extension);
    end
catch readError
    error('Could not read file "%s". MATLAB reported: %s', filePath, readError.message);
end

if width(dataTable) < 2
    error('The data file must contain at least two columns.');
end

%% Use fixed time and resistance columns
timeColumnIndex = 1;
resistanceColumnIndex = 2;

timeValues = dataTable{:, timeColumnIndex};
resistanceValues = dataTable{:, resistanceColumnIndex};

[timeValues, resistanceValues] = cleanSignalVectors(timeValues, resistanceValues);

if numel(timeValues) < 5
    error('Not enough valid numeric time/resistance rows were found after cleaning.');
end

if numel(unique(timeValues)) < 2
    error('The time column must contain at least two unique values.');
end

[timeValues, sortIndex] = sort(timeValues);
resistanceValues = resistanceValues(sortIndex);

%% Smooth, baseline-correct, and detect events
nSamples = numel(resistanceValues);
medianWindow = clampOddWindow(medianWindow, nSamples);
smoothingWindow = clampOddWindow(smoothingWindow, nSamples);
baselineWindow = clampOddWindow(baselineWindow, nSamples);

filteredResistance = movmedian(resistanceValues, medianWindow, 'omitnan');
smoothedResistance = smoothResistanceSignal(filteredResistance, smoothingWindow, useSavitzkyGolay, savitzkyGolayOrder);
baselineResistance = movmedian(smoothedResistance, baselineWindow, 'omitnan');
baselineCorrectedResistance = smoothedResistance - baselineResistance;

noiseEstimate = robustNoiseEstimate(baselineCorrectedResistance);
signalRange = max(baselineCorrectedResistance) - min(baselineCorrectedResistance);

if isempty(peakProminence)
    peakProminence = max([3 * noiseEstimate, 0.05 * signalRange, eps]);
end

if isempty(troughProminence)
    troughProminence = max([3 * noiseEstimate, 0.05 * signalRange, eps]);
end

positiveTimeSteps = diff(timeValues);
positiveTimeSteps = positiveTimeSteps(isfinite(positiveTimeSteps) & positiveTimeSteps > 0);

if isempty(positiveTimeSteps)
    error('The time column must contain increasing time values to calculate peak spacing.');
end

medianSampleInterval = median(positiveTimeSteps, 'omitnan');
minimumPeakDistance = max(1, round(minimumPeakTimeDistance / medianSampleInterval));

if isempty(hysteresisHighThreshold)
    hysteresisHighThreshold = max([2 * noiseEstimate, 0.04 * signalRange, eps]);
end

if isempty(hysteresisLowThreshold)
    hysteresisLowThreshold = 0.5 * hysteresisHighThreshold;
end

if exist('findpeaks', 'file') ~= 2
    error('findpeaks was not found. Install or enable the Signal Processing Toolbox before running this script.');
end

hysteresisEvents = detectHysteresisEvents( ...
    timeValues, baselineCorrectedResistance, ...
    hysteresisHighThreshold, hysteresisLowThreshold);

[peakValues, peakLocations] = findpeaks( ...
    baselineCorrectedResistance, ...
    'MinPeakProminence', peakProminence, ...
    'MinPeakDistance', minimumPeakDistance);

[invertedTroughValues, troughLocations] = findpeaks( ...
    -baselineCorrectedResistance, ...
    'MinPeakProminence', troughProminence, ...
    'MinPeakDistance', minimumPeakDistance);
troughValues = -invertedTroughValues;

%% Build event table
eventLocations = [peakLocations(:); troughLocations(:)];
eventTypes = [repmat("Peak", numel(peakLocations), 1); repmat("Trough", numel(troughLocations), 1)];
eventCorrectedResistance = [peakValues(:); troughValues(:)];

[eventLocations, order] = sort(eventLocations);
eventTypes = eventTypes(order);
eventCorrectedResistance = eventCorrectedResistance(order);

eventTable = table( ...
    (1:numel(eventLocations)).', ...
    eventTypes, ...
    timeValues(eventLocations), ...
    smoothedResistance(eventLocations), ...
    eventCorrectedResistance, ...
    'VariableNames', {'EventNumber', 'Type', 'Time', 'Resistance', 'BaselineCorrectedResistance'});

%% Plot and save results
eventCsvPath = fullfile(inputFolder, [inputName '_detected_events.csv']);
plotPngPath = fullfile(inputFolder, [inputName '_labeled_plot.png']);
plotPdfPath = fullfile(inputFolder, [inputName '_labeled_plot.pdf']);
plotJpgPath = fullfile(inputFolder, [inputName '_labeled_plot.jpg']);

writetable(eventTable, eventCsvPath);

figureHandle = figure('Color', 'w', 'Name', 'Resistance Bending Signal Processing');
hold on;
grid on;

plot(timeValues, smoothedResistance, 'b-', ...
    'LineWidth', 1.5, ...
    'DisplayName', 'Smoothed resistance');
plot(timeValues, resistanceValues, '-', ...
    'Color', [0.85 0.33 0.10], ...
    'LineWidth', 0.8, ...
    'DisplayName', 'Original resistance');

if ~isempty(peakLocations)
    plot(timeValues(peakLocations), smoothedResistance(peakLocations), 'rv', ...
        'MarkerFaceColor', 'r', ...
        'DisplayName', 'Peaks');
    labelEvents(timeValues, smoothedResistance, peakLocations, "Peak");
end

if ~isempty(troughLocations)
    plot(timeValues(troughLocations), smoothedResistance(troughLocations), 'g^', ...
        'MarkerFaceColor', 'g', ...
        'DisplayName', 'Troughs');
    labelEvents(timeValues, smoothedResistance, troughLocations, "Trough");
end

xlabel('Time');
ylabel('Resistance');
title('Resistance Bending Signal: Raw, Smoothed, Peaks, and Troughs');
legend('Location', 'best');
hold off;

try
    exportgraphics(figureHandle, plotPngPath, 'Resolution', 300);
    exportgraphics(figureHandle, plotPdfPath, 'ContentType', 'vector');
    exportgraphics(figureHandle, plotJpgPath, 'Resolution', 300);
catch
    saveas(figureHandle, plotPngPath);
    saveas(figureHandle, plotPdfPath);
    saveas(figureHandle, plotJpgPath);
end

%% Console summary
fprintf('\nProcessing complete.\n');
fprintf('Detected %d peak(s), %d trough(s), and %d hysteresis transition(s).\n', ...
    numel(peakLocations), numel(troughLocations), height(hysteresisEvents));
fprintf('Event table saved to:\n%s\n', eventCsvPath);
fprintf('Labeled PNG plot saved to:\n%s\n', plotPngPath);
fprintf('Labeled PDF plot saved to:\n%s\n', plotPdfPath);
fprintf('Labeled JPG plot saved to:\n%s\n', plotJpgPath);

if ~isempty(hysteresisEvents)
    fprintf('\nHysteresis transition summary:\n');
    disp(hysteresisEvents);
end

if isempty(eventTable)
    fprintf('\nNo peaks or troughs met the prominence settings. Try lowering peakProminence/troughProminence.\n');
else
    fprintf('\nDetected peak/trough event table:\n');
    disp(eventTable);
end

%% Local functions
function cleanedPath = stripWrappingQuotes(pathText)
    cleanedPath = strtrim(pathText);
    if numel(cleanedPath) >= 2
        if (cleanedPath(1) == '"' && cleanedPath(end) == '"') || ...
                (cleanedPath(1) == '''' && cleanedPath(end) == '''')
            cleanedPath = cleanedPath(2:end - 1);
        end
    end
end

function [timeValues, resistanceValues] = cleanSignalVectors(timeValues, resistanceValues)
    timeValues = convertToNumericVector(timeValues, true);
    resistanceValues = convertToNumericVector(resistanceValues, false);

    validRows = isfinite(timeValues) & isfinite(resistanceValues);
    timeValues = timeValues(validRows);
    resistanceValues = resistanceValues(validRows);

    timeValues = timeValues(:);
    resistanceValues = resistanceValues(:);
end

function values = convertToNumericVector(values, isTimeColumn)
    if isdatetime(values)
        values = seconds(values - values(1));
    elseif isduration(values)
        values = seconds(values);
    elseif iscell(values) || isstring(values) || ischar(values)
        values = str2double(string(values));
    end

    if ~isnumeric(values)
        if isTimeColumn
            error('The selected time column could not be converted to numeric seconds.');
        else
            error('The selected resistance column could not be converted to numeric values.');
        end
    end

    values = double(values);
end

function window = clampOddWindow(window, numberOfSamples)
    if isempty(window) || ~isfinite(window) || window < 1
        window = 1;
    end

    window = round(window);
    window = min(window, numberOfSamples);

    if mod(window, 2) == 0
        window = max(1, window - 1);
    end
end

function smoothed = smoothResistanceSignal(values, window, useSavitzkyGolay, polynomialOrder)
    if useSavitzkyGolay && exist('sgolayfilt', 'file') == 2 && window > polynomialOrder
        smoothed = sgolayfilt(values, polynomialOrder, window);
    else
        smoothed = movmean(values, window, 'omitnan');
    end
end

function noiseEstimate = robustNoiseEstimate(values)
    values = values(:);
    values = values(isfinite(values));

    if numel(values) < 3
        noiseEstimate = eps;
        return;
    end

    firstDifference = diff(values);
    noiseEstimate = median(abs(firstDifference - median(firstDifference, 'omitnan')), 'omitnan') / 0.6745;

    if ~isfinite(noiseEstimate) || noiseEstimate <= 0
        noiseEstimate = median(abs(values - median(values, 'omitnan')), 'omitnan') / 0.6745;
    end

    if ~isfinite(noiseEstimate) || noiseEstimate <= 0
        noiseEstimate = eps;
    end
end

function transitionTable = detectHysteresisEvents(timeValues, correctedValues, highThreshold, lowThreshold)
    state = 0;
    transitionTimes = [];
    transitionValues = [];
    transitionTypes = strings(0, 1);

    for sampleIndex = 1:numel(correctedValues)
        currentValue = correctedValues(sampleIndex);

        if state == 0
            if currentValue >= highThreshold
                state = 1;
                transitionTimes(end + 1, 1) = timeValues(sampleIndex); %#ok<AGROW>
                transitionValues(end + 1, 1) = currentValue; %#ok<AGROW>
                transitionTypes(end + 1, 1) = "Bending"; %#ok<AGROW>
            elseif currentValue <= -highThreshold
                state = -1;
                transitionTimes(end + 1, 1) = timeValues(sampleIndex); %#ok<AGROW>
                transitionValues(end + 1, 1) = currentValue; %#ok<AGROW>
                transitionTypes(end + 1, 1) = "Bending"; %#ok<AGROW>
            end
        elseif state == 1
            if currentValue <= lowThreshold
                state = 0;
                transitionTimes(end + 1, 1) = timeValues(sampleIndex); %#ok<AGROW>
                transitionValues(end + 1, 1) = currentValue; %#ok<AGROW>
                transitionTypes(end + 1, 1) = "Release"; %#ok<AGROW>
            end
        elseif state == -1
            if currentValue >= -lowThreshold
                state = 0;
                transitionTimes(end + 1, 1) = timeValues(sampleIndex); %#ok<AGROW>
                transitionValues(end + 1, 1) = currentValue; %#ok<AGROW>
                transitionTypes(end + 1, 1) = "Release"; %#ok<AGROW>
            end
        end
    end

    transitionTable = table( ...
        (1:numel(transitionTimes)).', ...
        transitionTypes, ...
        transitionTimes, ...
        transitionValues, ...
        'VariableNames', {'TransitionNumber', 'Type', 'Time', 'BaselineCorrectedResistance'});
end

function labelEvents(timeValues, resistanceValues, eventLocations, eventType)
    for eventIndex = 1:numel(eventLocations)
        sampleIndex = eventLocations(eventIndex);
        labelText = sprintf('%s %d', char(eventType), eventIndex);
        text(timeValues(sampleIndex), resistanceValues(sampleIndex), labelText, ...
            'FontSize', 8, ...
            'VerticalAlignment', 'bottom', ...
            'HorizontalAlignment', 'center');
    end
end
