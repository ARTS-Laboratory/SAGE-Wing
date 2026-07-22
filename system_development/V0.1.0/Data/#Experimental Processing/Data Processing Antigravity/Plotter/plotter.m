function plotter(varargin)
%% Interactive Multi-File Strain LVM Plotter
% Run this function to launch the multi-file interactive configuration window.
% Allows selecting multiple .lvm files (e.g., 5 files at once), assigning custom
% plot titles per file, and saving each output graph in the same location as its source LVM.

clc; close all;

%% 1. LAUNCH INTERACTIVE SETUP UI
fileList = {};        % Cell array of full file paths
titleSelections = {}; % Cell array of selected title dropdown options
customTitles = {};    % Cell array of custom title strings

setupFig = uifigure('Name', 'Multi-File LVM Plotter Settings', ...
    'Position', [350, 180, 720, 580], ...
    'Resize', 'on');

% --- Header / Instructions ---
uilabel(setupFig, 'Position', [20, 540, 400, 28], ...
    'Text', 'Multi-File Strain LVM Plotter', ...
    'FontSize', 16, 'FontWeight', 'bold');

% --- Output Format Selection ---
uilabel(setupFig, 'Position', [450, 543, 120, 22], ...
    'Text', 'Output Format:', 'FontWeight', 'bold', 'HorizontalAlignment', 'right');
formatDrop = uidropdown(setupFig, ...
    'Position', [580, 541, 110, 24], ...
    'Items', {'png', 'jpg', 'pdf', 'eps', 'tif'}, ...
    'Value', 'png');

% --- File Addition Controls ---
uibutton(setupFig, 'push', ...
    'Position', [20, 495, 160, 32], ...
    'Text', '+ Browse LVM Files...', ...
    'FontWeight', 'bold', ...
    'BackgroundColor', [0.15, 0.45, 0.75], ...
    'FontColor', 'w', ...
    'ButtonPushedFcn', @(btn,event) browseForFiles());

uibutton(setupFig, 'push', ...
    'Position', [190, 495, 110, 32], ...
    'Text', 'Clear All', ...
    'ButtonPushedFcn', @(btn,event) clearAllFiles());

uilabel(setupFig, 'Position', [315, 500, 380, 22], ...
    'Text', 'Select multiple files using Ctrl/Shift in the Browse dialog.', ...
    'FontAngle', 'italic', 'FontColor', [0.4 0.4 0.4]);

% --- Scrollable Panel for File Entries ---
scrollPanel = uipanel(setupFig, ...
    'Position', [20, 80, 680, 400], ...
    'Title', 'Loaded Files & Individual Plot Titles', ...
    'FontWeight', 'bold', ...
    'Scrollable', 'on');

% --- Action Buttons ---
uibutton(setupFig, 'push', ...
    'Position', [240, 22, 140, 42], ...
    'Text', 'Run Plotter', ...
    'FontWeight', 'bold', ...
    'FontSize', 14, ...
    'BackgroundColor', [0.2, 0.6, 0.3], ...
    'FontColor', 'w', ...
    'ButtonPushedFcn', @(btn,event) uiresume(setupFig));

uibutton(setupFig, 'push', ...
    'Position', [395, 22, 110, 42], ...
    'Text', 'Cancel', ...
    'FontSize', 14, ...
    'ButtonPushedFcn', @(btn,event) close(setupFig));

% Initial render of empty panel state
renderFileRows();

% Pause script execution until user clicks Run Plotter or closes figure
uiwait(setupFig);

% Check if figure was closed or cancelled
if ~isvalid(setupFig)
    disp('Plotter operation cancelled by user.');
    return;
end

%% 2. EXTRACT USER INPUTS & CLEAN UP UI
outFormat = formatDrop.Value;

numFiles = length(fileList);
plotTitles = cell(1, numFiles);
for i = 1:numFiles
    sel = titleSelections{i};
    if strcmp(sel, 'Custom...')
        customT = strtrim(customTitles{i});
        if isempty(customT)
            [~, fname, ~] = fileparts(fileList{i});
            customT = [fname, ' Custom Plot'];
        end
        plotTitles{i} = customT;
    elseif strcmp(sel, 'No Title')
        plotTitles{i} = '';
    else
        plotTitles{i} = sel;
    end
end

processingFiles = fileList;
delete(setupFig);
drawnow;

if isempty(processingFiles)
    disp('No files selected. Exiting.');
    return;
end

%% 3. BATCH PROCESS & GENERATE PLOTS
fprintf('\n========================================\n');
fprintf('Starting Batch Processing of %d LVM File(s)\n', numFiles);
fprintf('========================================\n\n');

exportResolution = 300;

for i = 1:numFiles
    currentFilePath = processingFiles{i};
    currentTitle = plotTitles{i};
    
    fprintf('[%d/%d] Processing: %s\n', i, numFiles, currentFilePath);
    
    if ~isfile(currentFilePath)
        warning('File not found: %s. Skipping...', currentFilePath);
        continue;
    end
    
    try
        % Load LVM data
        dataMatrix = loadLVMData(currentFilePath);
        if isempty(dataMatrix) || size(dataMatrix, 1) < 2
            warning('Invalid or empty data in %s. Skipping...', currentFilePath);
            continue;
        end
        
        % Extract Time (Col 1) and Resistance (Col 2)
        if size(dataMatrix, 2) >= 2
            timeSec = dataMatrix(:, 1);
            resistanceOhms = dataMatrix(:, 2);
        else
            timeSec = (1:size(dataMatrix, 1))';
            resistanceOhms = dataMatrix(:, 1);
        end
        
        % Clean non-finite data points
        validIdx = isfinite(timeSec) & isfinite(resistanceOhms);
        timeSec = timeSec(validIdx);
        resistanceOhms = resistanceOhms(validIdx);
        
        if isempty(timeSec)
            warning('No valid numerical data in %s after cleanup. Skipping...', currentFilePath);
            continue;
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
        
        % Create plot figure
        figTitle = currentTitle;
        if isempty(figTitle)
            [~, figTitle, ~] = fileparts(currentFilePath);
        end
        
        f = figure('Name', figTitle, 'Color', 'w', 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
        set(f, 'Renderer', 'painters');
        
        plot(timeSec, plotResistance, ...
            'LineWidth', 1.7, ...
            'Color', [0.85, 0.33, 0.10]);
        
        xlim([min(timeSec), max(timeSec)]);
        
        if ~isempty(currentTitle)
            title(currentTitle, 'FontSize', 14);
        end
        
        xlabel('Time (s)', 'FontSize', 18);
        ylabel(yLabelText, 'FontSize', 18);
        set(gca, 'FontSize', 22);
        grid on;
        drawnow;
        
        % Determine output directory (SAME location as the source LVM file)
        [inputFolder, lvmFileName, ~] = fileparts(currentFilePath);
        
        safeTitle = regexprep(strtrim(currentTitle), '[^A-Za-z0-9_-]+', '_');
        safeTitle = regexprep(safeTitle, '^_+|_+$', '');
        
        if isempty(safeTitle)
            outBaseName = lvmFileName;
        else
            outBaseName = safeTitle;
        end
        
        fileExtension = lower(strrep(outFormat, '.', ''));
        outputPath = fullfile(inputFolder, [outBaseName, '.', fileExtension]);
        
        % Prevent overwriting if multiple files share a generic title (e.g. "Starting Static")
        if isfile(outputPath) && ~strcmp(outBaseName, lvmFileName)
            outputPath = fullfile(inputFolder, [lvmFileName, '_', outBaseName, '.', fileExtension]);
        end
        
        % Export graphics
        if ismember(fileExtension, {'pdf', 'eps'})
            exportgraphics(f, outputPath, 'ContentType', 'vector');
        else
            exportgraphics(f, outputPath, 'Resolution', exportResolution);
        end
        
        fprintf('  -> Successfully saved plot to: %s\n\n', outputPath);
        close(f);
        
    catch ME
        warning('Failed to process file %s: %s', currentFilePath, ME.message);
        if exist('f', 'var') && isvalid(f)
            close(f);
        end
    end
end

fprintf('All plots generated and saved successfully.\n');

%% NESTED HELPER FUNCTIONS
    function browseForFiles()
        [files, path] = uigetfile({'*.lvm;*.txt;*.csv', 'LabVIEW Data Files (*.lvm, *.txt, *.csv)'; ...
                                  '*.*', 'All Files (*.*)'}, ...
                                  'Select LVM Data Files', ...
                                  'MultiSelect', 'on');
        if isequal(files, 0)
            return;
        end
        
        if ischar(files) || isstring(files)
            files = {char(files)};
        end
        
        titleOptions = {'Starting Static', 'Light Bending', 'Medium Bending', ...
                        'Heavy Bending', 'Rapid Bending', 'Final Static', ...
                        'Custom...', 'No Title'};
        
        for k = 1:length(files)
            fullP = fullfile(path, files{k});
            if ~ismember(fullP, fileList)
                fileList{end+1} = fullP;
                
                % Smart default title assignment
                defTitle = smartTitleGuess(files{k}, length(fileList), titleOptions);
                titleSelections{end+1} = defTitle;
                customTitles{end+1} = '';
            end
        end
        
        renderFileRows();
    end

    function clearAllFiles()
        fileList = {};
        titleSelections = {};
        customTitles = {};
        renderFileRows();
    end

    function removeFile(index)
        fileList(index) = [];
        titleSelections(index) = [];
        customTitles(index) = [];
        renderFileRows();
    end

    function renderFileRows()
        delete(scrollPanel.Children);
        
        numF = length(fileList);
        if numF == 0
            uilabel(scrollPanel, 'Position', [20, 180, 620, 30], ...
                'Text', 'No files loaded. Click "+ Browse LVM Files..." to add files.', ...
                'FontSize', 12, 'FontAngle', 'italic', ...
                'HorizontalAlignment', 'center');
            return;
        end
        
        rowHeight = 36;
        padding = 8;
        totalHeight = max(380, numF * (rowHeight + padding) + 20);
        
        titleOptions = {'Starting Static', 'Light Bending', 'Medium Bending', ...
                        'Heavy Bending', 'Rapid Bending', 'Final Static', ...
                        'Custom...', 'No Title'};
        
        for idx = 1:numF
            yPos = totalHeight - idx * (rowHeight + padding);
            
            [~, fname, fext] = fileparts(fileList{idx});
            shortName = [fname, fext];
            if length(shortName) > 22
                shortName = [shortName(1:19), '...'];
            end
            
            % File Label
            uilabel(scrollPanel, ...
                'Position', [10, yPos, 170, 24], ...
                'Text', sprintf('%d. %s', idx, shortName), ...
                'FontWeight', 'bold', ...
                'Tooltip', fileList{idx});
            
            % Title Selection Dropdown
            dd = uidropdown(scrollPanel, ...
                'Position', [185, yPos, 160, 24], ...
                'Items', titleOptions, ...
                'Value', titleSelections{idx});
            
            % Custom Title Edit Field
            custEnable = 'off';
            if strcmp(titleSelections{idx}, 'Custom...')
                custEnable = 'on';
            end
            
            tb = uieditfield(scrollPanel, 'text', ...
                'Position', [355, yPos, 220, 24], ...
                'Value', customTitles{idx}, ...
                'Placeholder', 'Type custom title...', ...
                'Enable', custEnable, ...
                'ValueChangedFcn', @(t, e) updateCustomTitle(idx, t.Value));
            
            % Link dropdown callback to toggle custom text field
            dd.UserData = tb;
            dd.ValueChangedFcn = @(d, e) onTitleDropdownChange(idx, d.Value, d.UserData);
            
            % Remove Button
            uibutton(scrollPanel, 'push', ...
                'Position', [585, yPos, 65, 24], ...
                'Text', 'Remove', ...
                'FontWeight', 'bold', ...
                'BackgroundColor', [0.85, 0.3, 0.3], ...
                'FontColor', 'w', ...
                'ButtonPushedFcn', @(btn, event) removeFile(idx));
        end
    end

    function onTitleDropdownChange(idx, newVal, customEditField)
        titleSelections{idx} = newVal;
        if strcmp(newVal, 'Custom...')
            customEditField.Enable = 'on';
        else
            customEditField.Enable = 'off';
        end
    end

    function updateCustomTitle(idx, val)
        customTitles{idx} = val;
    end

    function defTitle = smartTitleGuess(filename, fileIndex, titleOptions)
        lowerF = lower(filename);
        if contains(lowerF, 'ss') || contains(lowerF, 'starting_static')
            defTitle = 'Starting Static';
        elseif contains(lowerF, 'lb') || contains(lowerF, 'light_bending')
            defTitle = 'Light Bending';
        elseif contains(lowerF, 'mb') || contains(lowerF, 'medium_bending')
            defTitle = 'Medium Bending';
        elseif contains(lowerF, 'hb') || contains(lowerF, 'heavy_bending')
            defTitle = 'Heavy Bending';
        elseif contains(lowerF, 'rb') || contains(lowerF, 'rapid_bending')
            defTitle = 'Rapid Bending';
        elseif contains(lowerF, 'sf') || contains(lowerF, 'final_static')
            defTitle = 'Final Static';
        else
            if fileIndex <= 6
                defTitle = titleOptions{fileIndex};
            else
                defTitle = 'Starting Static';
            end
        end
    end

    function dataMatrix = loadLVMData(filePath)
        fid = fopen(filePath, 'r');
        if fid == -1
            error('Cannot open file: %s', filePath);
        end
        
        headerEndLine = 0;
        lineCount = 0;
        while ~feof(fid)
            tline = fgetl(fid);
            if ~ischar(tline), break; end
            lineCount = lineCount + 1;
            if contains(tline, '***End_of_Header***')
                headerEndLine = lineCount;
            end
        end
        fclose(fid);
        
        if headerEndLine > 0
            dataStartLine = headerEndLine + 1;
            try
                dataMatrix = readmatrix(filePath, 'FileType', 'text', ...
                    'NumHeaderLines', dataStartLine, 'CommentStyle', '***');
            catch
                fid = fopen(filePath, 'r');
                for k = 1:dataStartLine
                    fgetl(fid);
                end
                C = textscan(fid, '%f%f%*[^\n]', 'Delimiter', {',', '\t', ' '}, ...
                    'MultipleDelimsAsOne', true, 'TreatAsEmpty', {'NaN', 'nan'});
                fclose(fid);
                dataMatrix = [C{1}, C{2}];
            end
        else
            % Fallback for text/LVM without ***End_of_Header***
            try
                dataMatrix = readmatrix(filePath, 'FileType', 'text', 'NumHeaderLines', 22);
            catch
                try
                    dataMatrix = readmatrix(filePath);
                catch
                    rawData = importdata(filePath);
                    if isstruct(rawData) && isfield(rawData, 'data')
                        dataMatrix = rawData.data;
                    else
                        dataMatrix = rawData;
                    end
                end
            end
        end
    end

end