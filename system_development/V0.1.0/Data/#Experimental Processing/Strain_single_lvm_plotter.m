%% Single Strain LVM Plotter
% STEP 1: COPY THE FULL PATH TO THE .LVM FILE YOU WANT TO PROCESS.
% STEP 2: PASTE THAT PATH INTO lvmFilePath BELOW.
% STEP 3: TYPE THE PLOT TITLE YOU WANT INTO plotTitle BELOW.
% STEP 4: RUN THIS SCRIPT.
% STEP 5: A JPG WILL BE SAVED IN THE SAME FOLDER AS THE .LVM FILE.
%         THE JPG FILE NAME WILL BE BASED ON YOUR PLOT TITLE.

clear; clc; close all;

% USER INPUT 1: FULL PATH TO THE .LVM FILE
lvmFilePath = ...
"C:\Users\dstjohn\OneDrive - University of South Carolina\Desktop\SAGE-Wing\system_development\V0.1.0\Data\Silver_0142\Silver_0142_V6\lvm\strain_test_1.lvm";


% USER INPUT 2: NAME OF TITLE
plotTitle = '';

% USER INPUT 3: IMAGE FORMAT (Choose either 'png' or 'jpg')
fileExtension = 'png';

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

% Snap the X-axis tightly to the actual data limits
xlim([min(timeSec), max(timeSec)]);

title(plotTitle, 'FontSize', 14);
xlabel('Time (s)', 'FontSize', 18);
ylabel(yLabelText, 'FontSize', 18);
set(gca, 'FontSize', 22);
grid on;

[inputFolder, ~, ~] = fileparts(lvmFilePath);
safeTitle = regexprep(strtrim(plotTitle), '[^A-Za-z0-9_-]+', '_');
safeTitle = regexprep(safeTitle, '^_+|_+$', '');

if isempty(safeTitle)
    safeTitle = 'strain_plot';
end

% Ensure the extension starts with a dot and is lowercase
fileExtension = lower(strrep(fileExtension, '.', '')); 

outputPath = fullfile(inputFolder, [safeTitle, '.', fileExtension]);
exportgraphics(f, outputPath, 'Resolution', jpgResolution);

fprintf('Saved %S: %s\n', upper(fileExtension), outputPath);
