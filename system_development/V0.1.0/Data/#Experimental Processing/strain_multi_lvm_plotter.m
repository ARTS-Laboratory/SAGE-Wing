%% Dual Strain LVM Plotter
% STEP 1: COPY THE FULL PATHS TO THE TWO .LVM FILES YOU WANT TO PROCESS.
% STEP 2: PASTE THOSE PATHS INTO lvmFilePath1 AND lvmFilePath2 BELOW.
% STEP 3: TYPE THE PLOT TITLE YOU WANT INTO plotTitle BELOW.
% STEP 4: TYPE THE LEGEND LABELS YOU WANT FOR EACH DATASET.
% STEP 5: RUN THIS SCRIPT.
% STEP 6: A JPG WILL BE SAVED IN THE SAME FOLDER AS THE FIRST .LVM FILE.
%         THE JPG FILE NAME WILL BE BASED ON YOUR PLOT TITLE.

clear; clc; close all;

% USER INPUT 1: FULL PATHS TO THE TWO .LVM FILES
lvmFilePath1 = "C:\Users\dstjohn\Desktop\SAGE-Wing\system_development\V0.1.0\Data\Silver_0142\Silver_0142 Comparison\Fast Bending\Silver_V4_1_fb.lvm";
lvmFilePath2 = "C:\Users\dstjohn\Desktop\SAGE-Wing\system_development\V0.1.0\Data\Silver_0142\Silver_0142 Comparison\Fast Bending\Silver_V5_fb.lvm";

% USER INPUT 2: NAME OF TITLE
plotTitle = 'Fast Bending Comparison';

% USER INPUT 3: LEGEND LABELS FOR EACH DATASET
legendLabel1 = 'Version 4';
legendLabel2 = 'Version 5';

% USER INPUT 4: TIME WINDOW TO PLOT (in seconds)
% Leave as [] to plot the full time range.
% Example: to plot only the first 40 seconds, set plotStartTime = 0 and plotEndTime = 40.
plotStartTime = 0;
plotEndTime = 35;

% Script settings from the original batch plotter
headerLines = 22;
delimiter = ',';
timeColumn = 1;
resistanceColumn = 2;
jpgResolution = 300;

if ~isfile(lvmFilePath1)
    error('File not found: %s', lvmFilePath1);
end
if ~isfile(lvmFilePath2)
    error('File not found: %s', lvmFilePath2);
end

data1 = readmatrix(lvmFilePath1, ...
    'NumHeaderLines', headerLines, ...
    'FileType', 'text', ...
    'Delimiter', delimiter);

data2 = readmatrix(lvmFilePath2, ...
    'NumHeaderLines', headerLines, ...
    'FileType', 'text', ...
    'Delimiter', delimiter);

timeSec1 = data1(:, timeColumn);
resistanceOhms1 = data1(:, resistanceColumn);

timeSec2 = data2(:, timeColumn);
resistanceOhms2 = data2(:, resistanceColumn);

% Apply time window filter, if specified
if ~isempty(plotStartTime) || ~isempty(plotEndTime)
    if isempty(plotStartTime)
        plotStartTime = -Inf;
    end
    if isempty(plotEndTime)
        plotEndTime = Inf;
    end

    keepIdx1 = timeSec1 >= plotStartTime & timeSec1 <= plotEndTime;
    timeSec1 = timeSec1(keepIdx1);
    resistanceOhms1 = resistanceOhms1(keepIdx1);

    keepIdx2 = timeSec2 >= plotStartTime & timeSec2 <= plotEndTime;
    timeSec2 = timeSec2(keepIdx2);
    resistanceOhms2 = resistanceOhms2(keepIdx2);

    if isempty(timeSec1) || isempty(timeSec2)
        error('No data points fall within the specified time window [%g, %g].', plotStartTime, plotEndTime);
    end
end

% Auto-detect resistance units for the y-axis using the larger of the two datasets
maxResistance1 = max(abs(resistanceOhms1(isfinite(resistanceOhms1))));
maxResistance2 = max(abs(resistanceOhms2(isfinite(resistanceOhms2))));
maxResistance = max(maxResistance1, maxResistance2);

if maxResistance >= 1e6
    scaleFactor = 1e6;
    yLabelText = 'Resistance (M\Omega)';
elseif maxResistance >= 1e3
    scaleFactor = 1e3;
    yLabelText = 'Resistance (k\Omega)';
else
    scaleFactor = 1;
    yLabelText = 'Resistance (\Omega)';
end

plotResistance1 = resistanceOhms1 / scaleFactor;
plotResistance2 = resistanceOhms2 / scaleFactor;

f = figure( ...
    'Name', plotTitle, ...
    'Color', 'w', ...
    'Units', 'Normalized', ...
    'OuterPosition', [0 0 1 1]);

hold on;
plot(timeSec1, plotResistance1, ...
    'LineWidth', 1.7, ...
    'Color', [0.85, 0.33, 0.10]);

plot(timeSec2, plotResistance2, ...
    'LineWidth', 1.7, ...
    'Color', [0.00, 0.45, 0.74]);
hold off;

if ~isinf(plotStartTime) && ~isinf(plotEndTime)
    xlim([plotStartTime, plotEndTime]);
end

title(plotTitle, 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 12);
ylabel(yLabelText, 'FontSize', 12);
legend({legendLabel1, legendLabel2}, 'Location', 'best', 'FontSize', 11);
grid on;

[inputFolder, ~, ~] = fileparts(lvmFilePath1);
safeTitle = regexprep(strtrim(plotTitle), '[^A-Za-z0-9_-]+', '_');
safeTitle = regexprep(safeTitle, '^_+|_+$', '');

if isempty(safeTitle)
    safeTitle = 'strain_plot';
end

outputPath = fullfile(inputFolder, [safeTitle, '.jpg']);
% If a file with this name already exists, append _1, _2, etc.
if isfile(outputPath)
    counter = 1;
    while isfile(fullfile(inputFolder, sprintf('%s_%d.jpg', safeTitle, counter)))
        counter = counter + 1;
    end
    outputPath = fullfile(inputFolder, sprintf('%s_%d.jpg', safeTitle, counter));
end
exportgraphics(f, outputPath, 'Resolution', jpgResolution);

fprintf('Saved JPG: %s\n', outputPath);