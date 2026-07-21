%% LVM FFT Electrical Line Noise Analyzer
% Interactive script to load .lvm time-series data, compute FFT, and export spectrum
clear; clc; close all;

%% 1. LAUNCH INTERACTIVE SETUP UI
setupFig = uifigure('Name', 'LVM FFT Noise Analyzer Settings', ...
    'Position', [400, 400, 500, 340], ...
    'Resize', 'off');

% --- File Path Selection ---
uilabel(setupFig, 'Position', [25, 285, 150, 22], ...
    'Text', 'LVM File Path:', 'FontWeight', 'bold');
fileEdit = uieditfield(setupFig, 'text', ...
    'Position', [25, 260, 360, 24], ...
    'Placeholder', 'Paste full path to .lvm file or click Browse...');
uibutton(setupFig, 'push', ...
    'Position', [395, 260, 80, 24], ...
    'Text', 'Browse...', ...
    'ButtonPushedFcn', @(btn,event) browseForLVM(fileEdit));

% --- Output File Format ---
uilabel(setupFig, 'Position', [25, 220, 150, 22], ...
    'Text', 'Output File Format:', 'FontWeight', 'bold');
formatDrop = uidropdown(setupFig, ...
    'Position', [25, 195, 150, 24], ...
    'Items', {'png', 'jpg', 'pdf', 'eps', 'tif'}, ...
    'Value', 'png');

% --- Plot Title Selection (Adapted for FFT / Noise Analysis) ---
uilabel(setupFig, 'Position', [25, 155, 150, 22], ...
    'Text', 'FFT Plot Title:', 'FontWeight', 'bold');
titleOptions = {'Baseline Noise Spectrum', ...
                '50 Hz Line Noise Check', ...
                '60 Hz Line Noise Check', ...
                'Active Shielding Test', ...
                'Unshielded Environment', ...
                'Custom...', 'No Title'};
titleDrop = uidropdown(setupFig, ...
    'Position', [25, 130, 200, 24], ...
    'Items', titleOptions, ...
    'Value', 'Baseline Noise Spectrum');
customTitleEdit = uieditfield(setupFig, 'text', ...
    'Position', [235, 130, 240, 24], ...
    'Placeholder', 'Type custom title here...', ...
    'Enable', 'off');

% Dropdown callback to toggle custom title input field
titleDrop.ValueChangedFcn = @(dd,event) toggleCustomField(dd.Value, customTitleEdit);

% --- Action Buttons ---
uibutton(setupFig, 'push', ...
    'Position', [140, 40, 110, 38], ...
    'Text', 'Run FFT', ...
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
    disp('FFT operation cancelled by user.');
    return;
end

%% 2. RETRIEVE USER INPUTS & CLEAN UP UI
filePath = fileEdit.Value;
outFormat = formatDrop.Value;
selectedTitle = titleDrop.Value;

if strcmp(selectedTitle, 'Custom...')
    plotTitle = customTitleEdit.Value;
elseif strcmp(selectedTitle, 'No Title')
    plotTitle = '';
else
    plotTitle = selectedTitle;
end

% CRITICAL FIX: Delete UI figure immediately to free the graphics thread
delete(setupFig);
drawnow;

% Validate file path
if isempty(filePath) || ~isfile(filePath)
    error('Invalid file path! Please provide a valid .lvm file.');
end

%% 3. LOAD DATA & SIGNAL PROCESSING
disp(['Loading LVM file: ', filePath]);

% importdata natively separates LVM text headers from the numerical data block
rawData = importdata(filePath);

% Extract the numerical data matrix
if isstruct(rawData) && isfield(rawData, 'data')
    dataMatrix = rawData.data;
else
    dataMatrix = rawData; % Fallback if no text header was found
end

% Check columns: Col 1 = Time (0.000, 0.002...), Col 2 = Resistance/Voltage (0.248...)
if size(dataMatrix, 2) >= 2
    signal = dataMatrix(:, 2);
else
    signal = dataMatrix(:, 1);
end

% Remove any accidental NaNs just in case
signal = signal(~isnan(signal));

% --- Sampling Parameters ---
fs = 500;             % Sampling frequency = 500 Hz (2 ms interval)
N = length(signal);   % Total number of samples

% --- Detrend Signal (Remove DC Baseline Offset) ---
% Using 'omitnan' ensures that even if a stray NaN snuck in, it won't blank out your graph!
signal_clean = signal - mean(signal, 'omitnan');

% --- Compute Fast Fourier Transform (FFT) ---
Y = fft(signal_clean);
P2 = abs(Y / N);                  % Two-sided spectrum
P1 = P2(1:floor(N/2)+1);          % Single-sided spectrum
P1(2:end-1) = 2 * P1(2:end-1);    % Double amplitude for positive frequencies

frequencies = fs * (0:(floor(N/2))) / N; % Frequency vector up to Nyquist (250 Hz)

%% 4. PLOT & EXPORT FFT SPECTRUM
disp('Generating FFT Spectrum Plot...');

fig = figure('Name', 'FFT Results', 'Color', 'w', 'OuterPosition', [100, 100, 900, 500]);
set(fig, 'Renderer', 'painters'); % Avoid graphics driver freezes

plot(frequencies, P1, 'b-', 'LineWidth', 1.2);
hold on;

% Add visual reference lines for common electrical noise frequencies
xline(50, 'r--', '50 Hz (EU/Asia)', 'LineWidth', 1.2, 'LabelOrientation', 'horizontal');
xline(60, 'g--', '60 Hz (US/Americas)', 'LineWidth', 1.2, 'LabelOrientation', 'horizontal');
xline(120, 'k:', '120 Hz Harmonic', 'LineWidth', 1.0, 'LabelOrientation', 'horizontal');

grid on;
xlabel('Frequency (Hz)', 'FontWeight', 'bold', 'FontSize', 11);
ylabel('Magnitude (Amplitude)', 'FontWeight', 'bold', 'FontSize', 11);
xlim([0, 250]); % Show full range up to Nyquist frequency

if ~isempty(plotTitle)
    title(plotTitle, 'FontWeight', 'bold', 'FontSize', 14);
end

% Force rendering before export (prevents blank/hanging exports)
drawnow;

% Generate output filename in the same folder as the input LVM file
[fileDir, fileName, ~] = fileparts(filePath);
outputFullPath = fullfile(fileDir, [fileName, '_FFT.', outFormat]);

% Export high-resolution graphic
exportgraphics(fig, outputFullPath, 'Resolution', 300);
disp(['Success! FFT plot exported to: ', outputFullPath]);

%% --- HELPER FUNCTIONS ---
function browseForLVM(editField)
    [file, path] = uigetfile({'*.lvm;*.txt;*.csv', 'LabVIEW Data Files (*.lvm, *.txt, *.csv)'; ...
                              '*.*', 'All Files (*.*)'}, ...
                              'Select LVM Data File');
    if file ~= 0
        editField.Value = fullfile(path, file);
    end
end

function toggleCustomField(selectedVal, editField)
    if strcmp(selectedVal, 'Custom...')
        editField.Enable = 'on';
        uicontrol(editField); % Give focus to custom text field
    else
        editField.Enable = 'off';
        editField.Value = '';
    end
end