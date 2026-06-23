%% Single Strain LVM Plotter
% STEP 1: COPY THE FULL PATH TO THE .LVM FILE YOU WANT TO PROCESS.
% STEP 2: PASTE THAT PATH INTO lvmFilePath BELOW.
% STEP 3: TYPE THE PLOT TITLE YOU WANT INTO plotTitle BELOW.
% STEP 4: RUN THIS SCRIPT.
% STEP 5: A JPG WILL BE SAVED IN THE SAME FOLDER AS THE .LVM FILE.
%         THE JPG FILE NAME WILL BE BASED ON YOUR PLOT TITLE.

clear; clc; close all;

% USER INPUT 1: FULL PATH TO THE .LVM FILE
lvmFilePath = "C:\Users\dstjohn\Desktop\SAGE-Wing\Data\Silver_0142\Silver_0142_V5\Fast_Bending_3.lvm";

% USER INPUT 2: NAME OF TITLE
plotTitle = 'Fast Bending 3';

% Script settings from the original batch plotter
headerLines = 22;
delimiter = ',';
timeColumn = 1;
resistanceColumn = 2;
jpgResolution = 300;

if ~isfile(lvmFilePath)
    error('File not found: %s', lvmFilePath);
end

data = readmatrix(lvmFilePath, ...
    'NumHeaderLines', headerLines, ...
    'FileType', 'text', ...
    'Delimiter', delimiter);

timeSec = data(:, timeColumn);
resistanceOhms = data(:, resistanceColumn);

% Auto-detect resistance units for the y-axis
maxResistance = max(abs(resistanceOhms(isfinite(resistanceOhms))));
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

f = figure( ...
    'Name', plotTitle, ...
    'Color', 'w', ...
    'Units', 'Normalized', ...
    'OuterPosition', [0 0 1 1]);

plot(timeSec, plotResistance, ...
    'LineWidth', 1.7, ...
    'Color', [0.85, 0.33, 0.10]);

title(plotTitle, 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 12);
ylabel(yLabelText, 'FontSize', 12);
grid on;

[inputFolder, ~, ~] = fileparts(lvmFilePath);
safeTitle = regexprep(strtrim(plotTitle), '[^A-Za-z0-9_-]+', '_');
safeTitle = regexprep(safeTitle, '^_+|_+$', '');

if isempty(safeTitle)
    safeTitle = 'strain_plot';
end

outputPath = fullfile(inputFolder, [safeTitle, '.jpg']);
exportgraphics(f, outputPath, 'Resolution', jpgResolution);

fprintf('Saved JPG: %s\n', outputPath);
