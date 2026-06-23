%% Strain Start/End Clip Plotter
% STEP 1: Run this script.
% STEP 2: Paste the full path to the .LVM file into the pop-up box.
% STEP 3: Review the full-data plot.
% STEP 4: Enter how many seconds from the beginning and ending should be
%         compared in the second pop-up box.

clear; clc; close all;

% Script settings based on the existing strain plotters
headerLines = 22;
delimiter = ',';
timeColumn = 1;
resistanceColumn = 2;
jpgResolution = 300;

% Ask user for the data file
pathAnswer = inputdlg( ...
    {'Paste the full path to the .LVM file:'}, ...
    'Select Strain Data File', ...
    [1 100]);

if isempty(pathAnswer)
    return;
end

lvmFilePath = strtrim(pathAnswer{1});
lvmFilePath = regexprep(lvmFilePath, '^["'']|["'']$', '');

if ~isfile(lvmFilePath)
    errordlg(sprintf('File not found:\n%s', lvmFilePath), 'Missing File');
    error('File not found: %s', lvmFilePath);
end

% Read the .LVM data
data = readmatrix(lvmFilePath, ...
    'NumHeaderLines', headerLines, ...
    'FileType', 'text', ...
    'Delimiter', delimiter);

timeSec = data(:, timeColumn);
resistanceOhms = data(:, resistanceColumn);

validRows = isfinite(timeSec) & isfinite(resistanceOhms);
timeSec = timeSec(validRows);
resistanceOhms = resistanceOhms(validRows);

if numel(timeSec) < 2
    error('Not enough valid data points were found in: %s', lvmFilePath);
end

% Auto-detect resistance units for the y-axis
maxResistance = max(abs(resistanceOhms));
if maxResistance >= 1e6
    plotResistance = resistanceOhms / 1e6;
    yLabelText = 'Resistance (M\Omega)';
elseif maxResistance >= 1e3
    plotResistance = resistanceOhms / 1e3;
    yLabelText = 'Resistance (k\Omega)';
else
    plotResistance = resistanceOhms;
    yLabelText = 'Resistance (\Omega)';
end

[~, fileBaseName, fileExtension] = fileparts(lvmFilePath);
plotTitleBase = [fileBaseName, fileExtension];

% Plot full data first
fullFigure = figure( ...
    'Name', [plotTitleBase, ' - Complete Trace'], ...
    'Color', 'w', ...
    'Units', 'Normalized', ...
    'OuterPosition', [0 0 1 1]);

plot(timeSec, plotResistance, ...
    'LineWidth', 1.7, ...
    'Color', [0.85, 0.33, 0.10]);

title(plotTitleBase, 'FontSize', 14, 'Interpreter', 'none');
xlabel('Time (s)', 'FontSize', 12);
ylabel(yLabelText, 'FontSize', 12);
xticks(floor(timeSec(1) / 5) * 5:5:ceil(timeSec(end) / 5) * 5);
grid on;

% Ask how much data to compare from the start and end
totalDuration = timeSec(end) - timeSec(1);
clipAnswer = inputdlg( ...
    {sprintf('How many seconds from the start and end should be compared? Maximum available duration is %.3g seconds.', totalDuration)}, ...
    'Start/End Comparison Window', ...
    [1 90], ...
    {'5'});

if isempty(clipAnswer)
    return;
end

clipSeconds = str2double(clipAnswer{1});
if ~isfinite(clipSeconds) || clipSeconds <= 0
    errordlg('Clip time must be a positive number of seconds.', 'Invalid Clip Time');
    error('Clip time must be a positive number of seconds.');
end

if clipSeconds > totalDuration
    errordlg(sprintf('Clip time must be less than or equal to %.3g seconds.', totalDuration), 'Invalid Clip Time');
    error('Clip time %.3g exceeds total data duration %.3g.', clipSeconds, totalDuration);
end

startMask = timeSec <= timeSec(1) + clipSeconds;
endMask = timeSec >= timeSec(end) - clipSeconds;

startTime = timeSec(startMask);
startResistance = plotResistance(startMask);
endTime = timeSec(endMask);
endResistance = plotResistance(endMask);

if numel(startTime) < 2 || numel(endTime) < 2
    error('Clip time %.3g seconds is too short for the sampling interval in this file.', clipSeconds);
end

% Reset each segment to begin at 0 seconds so their shapes can be compared.
startTime = startTime - startTime(1);
endTime = endTime - endTime(1);

comparisonFigure = figure( ...
    'Name', [plotTitleBase, ' - Start/End Comparison'], ...
    'Color', 'w', ...
    'Units', 'Normalized', ...
    'OuterPosition', [0 0 1 1]);

plot(startTime, startResistance, ...
    'LineWidth', 1.7, ...
    'Color', [0.00, 0.45, 0.74], ...
    'DisplayName', 'Starting Segment');
hold on;

plot(endTime, endResistance, ...
    'LineWidth', 1.7, ...
    'Color', [0.85, 0.33, 0.10], ...
    'DisplayName', 'Ending Segment');

title(sprintf('%s - First %.3g s vs Last %.3g s', plotTitleBase, clipSeconds, clipSeconds), ...
    'FontSize', 14, ...
    'Interpreter', 'none');
xlabel('Segment Time (s)', 'FontSize', 12);
ylabel(yLabelText, 'FontSize', 12);
legend('Location', 'best', 'FontSize', 12);
grid on;

safeTitle = regexprep(strtrim(plotTitleBase), '[^A-Za-z0-9_-]+', '_');
safeTitle = regexprep(safeTitle, '^_+|_+$', '');

if isempty(safeTitle)
    safeTitle = 'strain_start_end_comparison';
end

outputPath = fullfile(pwd, [safeTitle, '_Start_End_Comparison.jpg']);
exportgraphics(comparisonFigure, outputPath, 'Resolution', jpgResolution);

fprintf('Saved comparison JPG: %s\n', outputPath);
