%% Interactive Single Strain LVM Plotter
% Run this script to launch the interactive configuration terminal.

clear; clc; close all;

%% 1. LAUNCH INTERACTIVE SETUP UI
setupFig = uifigure('Name', 'LVM Plotter Settings', ...
    'Position', [400, 400, 500, 340], ...
    'Resize', 'off');

% --- File Path Selection ---
uilabel(setupFig, 'Position', [25, 285, 150, 22], ...
    'Text', 'LVM File Path:', 'FontWeight', 'bold');
fileEdit = uieditfield(setupFig, 'text', ...
    'Position', [25, 260, 360, 24], ...
    'Placeholder', 'Paste full path or click Browse...');
uibutton(setupFig, 'push', ...
    'Position', [395, 260, 80, 24], ...
    'Text', 'Browse...', ...
    'ButtonPushedFcn', @(btn,event) browseForFile(fileEdit));

% --- Output File Format ---
uilabel(setupFig, 'Position', [25, 220, 150, 22], ...
    'Text', 'Output File Format:', 'FontWeight', 'bold');
formatDrop = uidropdown(setupFig, ...
    'Position', [25, 195, 150, 24], ...
    'Items', {'png', 'jpg', 'pdf', 'eps', 'tif'}, ...
    'Value', 'png');

% --- Plot Title Selection ---
uilabel(setupFig, 'Position', [25, 155, 150, 22], ...
    'Text', 'Plot Title:', 'FontWeight', 'bold');
titleOptions = {'Starting Static', 'Light Bending', 'Medium Bending', ...
                'Heavy Bending', 'Rapid Bending', 'Final Static', ...
                'Custom...', 'No Title'};
titleDrop = uidropdown(setupFig, ...
    'Position', [25, 130, 200, 24], ...
    'Items', titleOptions, ...
    'Value', 'Starting Static');

customTitleEdit = uieditfield(setupFig, 'text', ...
    'Position', [235, 130, 240, 24], ...
    'Placeholder', 'Type custom title here...', ...
    'Enable', 'off');

% Dropdown callback to toggle custom title input field
titleDrop.ValueChangedFcn = @(dd,event) toggleCustomField(dd.Value, customTitleEdit);

% --- Action Buttons ---
uibutton(setupFig, 'push', ...
    'Position', [140, 40, 110, 38], ...
    'Text', 'Run Plotter', ...
    'FontWeight', 'bold', ...
    'BackgroundColor', [0.2, 0.6, 0.3], ...
    'FontColor', 'w', ...
    'ButtonPushedFcn', @(btn,event) uiresume(setupFig));

uibutton(setupFig, 'push', ...
    'Position', [260, 40, 100, 38], ...
    'Text', 'Cancel', ...
    'ButtonPushedFcn', @(btn,event) close(setupFig));

% Pause script execution until uiresume is called or figure is closed
uiwait(setupFig);

% Check if the figure was closed (cancelled)
if ~isvalid(setupFig)
    disp('Plotter operation cancelled.');
    return;
end

%% 2. EXTRACT USER INPUTS & CLOSE UI
lvmFilePath = strtrim(fileEdit.Value);
fileExtension = formatDrop.Value;
selectedTitle = titleDrop.Value;

% Determine the actual title string
if strcmp(selectedTitle, 'Custom...')
    plotTitle = strtrim(customTitleEdit.Value);
    if isempty(plotTitle)
        plotTitle = 'Custom Strain Plot'; % Fallback if left blank
    end
elseif strcmp(selectedTitle, 'No Title')
    plotTitle = '';
else
    plotTitle = selectedTitle;
end

close(setupFig); % Close the UI terminal

%% 3. LOAD AND VALIDATE DATA
% Script settings
headerLines = 22;
delimiter = ',';
timeColumn = 1;
resistanceColumn = 2;
exportResolution = 300;

if isempty(lvmFilePath) || ~isfile(lvmFilePath)
    error('File not found or invalid path: %s', lvmFilePath);
end

data = readmatrix(lvmFilePath, ...
    'NumHeaderLines', headerLines, ...
    'FileType', 'text', ...
    'Delimiter', delimiter);

timeSec = data(:, timeColumn);
resistanceOhms = data(:, resistanceColumn);

%% 4. PROCESS & PLOT
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

if ~isempty(plotTitle)
    title(plotTitle, 'FontSize', 14);
end

xlabel('Time (s)', 'FontSize', 18);
ylabel(yLabelText, 'FontSize', 18);
set(gca, 'FontSize', 22);
grid on;

%% 5. EXPORT GRAPHICS
[inputFolder, lvmFileName, ~] = fileparts(lvmFilePath);
safeTitle = regexprep(strtrim(plotTitle), '[^A-Za-z0-9_-]+', '_');
safeTitle = regexprep(safeTitle, '^_+|_+$', '');

% If No Title was selected, name the file after the original LVM file
if isempty(safeTitle)
    safeTitle = lvmFileName;
end

fileExtension = lower(strrep(fileExtension, '.', '')); 
outputPath = fullfile(inputFolder, [safeTitle, '.', fileExtension]);

% Smart export: Use vector graphics for PDF/EPS, resolution for raster
if ismember(fileExtension, {'pdf', 'eps'})
    exportgraphics(f, outputPath, 'ContentType', 'vector');
else
    exportgraphics(f, outputPath, 'Resolution', exportResolution);
end

fprintf('Successfully saved %s: %s\n', upper(fileExtension), outputPath);

%% LOCAL HELPER FUNCTIONS
function browseForFile(editField)
    [file, path] = uigetfile('*.lvm', 'Select LVM Data File');
    if ischar(file) || isstring(file)
        editField.Value = fullfile(path, file);
    end
end

function toggleCustomField(selectedVal, editField)
    if strcmp(selectedVal, 'Custom...')
        editField.Enable = 'on';
    else
        editField.Enable = 'off';
    end
end