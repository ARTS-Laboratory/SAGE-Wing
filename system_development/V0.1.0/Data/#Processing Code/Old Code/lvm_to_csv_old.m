function lvm_to_csv(varargin)
%% Interactive Multi-File LVM to CSV/MAT Converter
% Interactive UI script/function to load multiple .lvm files,
% select output export formats (.csv, .mat, or both) per file or in batch,
% and save converted files in the exact directory of each source LVM file.

clc; close all;

%% 1. LAUNCH INTERACTIVE SETUP UI
fileList = {};         % Cell array of full file paths
formatSelections = {}; % Cell array of selected format options per file

setupFig = uifigure('Name', 'Multi-File LVM Converter Settings', ...
    'Position', [350, 180, 720, 580], ...
    'Resize', 'on');

% --- Header / Instructions ---
uilabel(setupFig, 'Position', [20, 540, 420, 28], ...
    'Text', 'Multi-File LVM Converter (CSV / MAT)', ...
    'FontSize', 16, 'FontWeight', 'bold');

% --- Global Default Format Selection ---
uilabel(setupFig, 'Position', [430, 543, 110, 22], ...
    'Text', 'Default Format:', 'FontWeight', 'bold', 'HorizontalAlignment', 'right');
globalFormatDrop = uidropdown(setupFig, ...
    'Position', [545, 541, 155, 24], ...
    'Items', {'Both (.csv & .mat)', 'CSV (.csv)', 'MAT (.mat)'}, ...
    'Value', 'Both (.csv & .mat)', ...
    'ValueChangedFcn', @(d,e) setAllFormats(d.Value));

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
    'Title', 'Loaded Files & Target Output Formats', ...
    'FontWeight', 'bold', ...
    'Scrollable', 'on');

% --- Action Buttons ---
uibutton(setupFig, 'push', ...
    'Position', [230, 22, 150, 42], ...
    'Text', 'Run Converter', ...
    'FontWeight', 'bold', ...
    'FontSize', 14, ...
    'BackgroundColor', [0.2, 0.6, 0.3], ...
    'FontColor', 'w', ...
    'ButtonPushedFcn', @(btn,event) uiresume(setupFig));

uibutton(setupFig, 'push', ...
    'Position', [400, 22, 110, 42], ...
    'Text', 'Cancel', ...
    'FontSize', 14, ...
    'ButtonPushedFcn', @(btn,event) close(setupFig));

% Initial render of empty panel state
renderFileRows();

% Pause execution until user clicks Run Converter or closes figure
uiwait(setupFig);

% Check if figure was closed or cancelled
if ~isvalid(setupFig)
    disp('Conversion operation cancelled by user.');
    return;
end

%% 2. EXTRACT USER INPUTS & CLEAN UP UI
processingFiles = fileList;
processingFormats = formatSelections;
delete(setupFig);
drawnow;

numFiles = length(processingFiles);
if numFiles == 0
    disp('No files selected. Exiting.');
    return;
end

%% 3. BATCH PROCESS & CONVERT FILES
fprintf('\n========================================\n');
fprintf('Starting Batch Conversion of %d LVM File(s)\n', numFiles);
fprintf('========================================\n\n');

for i = 1:numFiles
    currentFilePath = processingFiles{i};
    targetFmt = processingFormats{i};
    
    fprintf('[%d/%d] Converting: %s\n', i, numFiles, currentFilePath);
    
    if ~isfile(currentFilePath)
        warning('File not found: %s. Skipping...', currentFilePath);
        continue;
    end
    
    try
        % Load LVM data
        dataMatrix = loadLVMData(currentFilePath);
        if isempty(dataMatrix)
            warning('Could not load numerical data from %s. Skipping...', currentFilePath);
            continue;
        end
        
        [fileDir, baseName, ~] = fileparts(currentFilePath);
        
        % Export CSV if selected
        if contains(targetFmt, 'CSV') || contains(targetFmt, 'Both')
            csvOutputPath = fullfile(fileDir, [baseName, '.csv']);
            writematrix(dataMatrix, csvOutputPath);
            fprintf('  -> Saved CSV: %s\n', csvOutputPath);
        end
        
        % Export MAT if selected
        if contains(targetFmt, 'MAT') || contains(targetFmt, 'Both')
            matOutputPath = fullfile(fileDir, [baseName, '.mat']);
            rawMatrix = dataMatrix; %#ok<NASGU>
            save(matOutputPath, 'rawMatrix');
            fprintf('  -> Saved MAT: %s\n', matOutputPath);
        end
        
        fprintf('\n');
        
    catch ME
        warning('Failed to convert file %s: %s', currentFilePath, ME.message);
    end
end

fprintf('All conversions completed successfully!\n');

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
        
        defaultFmt = globalFormatDrop.Value;
        
        for k = 1:length(files)
            fullP = fullfile(path, files{k});
            if ~ismember(fullP, fileList)
                fileList{end+1} = fullP;
                formatSelections{end+1} = defaultFmt;
            end
        end
        
        renderFileRows();
    end

    function clearAllFiles()
        fileList = {};
        formatSelections = {};
        renderFileRows();
    end

    function removeFile(index)
        fileList(index) = [];
        formatSelections(index) = [];
        renderFileRows();
    end

    function setAllFormats(newFmt)
        for idx = 1:length(formatSelections)
            formatSelections{idx} = newFmt;
        end
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
        
        fmtOptions = {'Both (.csv & .mat)', 'CSV (.csv)', 'MAT (.mat)'};
        
        for idx = 1:numF
            yPos = totalHeight - idx * (rowHeight + padding);
            
            [~, fname, fext] = fileparts(fileList{idx});
            shortName = [fname, fext];
            if length(shortName) > 28
                shortName = [shortName(1:25), '...'];
            end
            
            % File Label
            uilabel(scrollPanel, ...
                'Position', [10, yPos, 260, 24], ...
                'Text', sprintf('%d. %s', idx, shortName), ...
                'FontWeight', 'bold', ...
                'Tooltip', fileList{idx});
            
            % Format Selection Dropdown
            uidropdown(scrollPanel, ...
                'Position', [280, yPos, 190, 24], ...
                'Items', fmtOptions, ...
                'Value', formatSelections{idx}, ...
                'ValueChangedFcn', @(d, e) updateFormatSelection(idx, d.Value));
            
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

    function updateFormatSelection(idx, val)
        formatSelections{idx} = val;
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