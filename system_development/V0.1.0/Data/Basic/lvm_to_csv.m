%% Method B (Updated): LVM to Antigravity Format Converter with Dynamic Paths
% This script imports an NI LabVIEW Measurement (.lvm) file from any specified
% path and saves the converted .csv and .mat files directly into the same 
% directory as the original source file.

clear; clc;

%% Step 1: Specify or Select Your LVM File Path

% OPTION 1: Manually paste your full file path here between the quotes:
%fullFilePath = 'C:\Users\YourName\Documents\Cantilever_Tests\test_cycle_data.lvm';

% OPTION 2: Interactive File Selector (Uncomment the 3 lines below to use a pop-up window!)
 [fileName, fileDir] = uigetfile('*.lvm', 'Select your LabVIEW Measurement File');
 if isequal(fileName,0); disp('User canceled file selection.'); return; end
 fullFilePath = fullfile(fileDir, fileName);

%% Step 2: Extract Directory and Build Output Paths
% fileparts extracts the folder path, file name (without extension), and extension
[fileDir, baseName, ~] = fileparts(fullFilePath);

% Construct full output paths in the exact same directory as the source file
csvOutputPath = fullfile(fileDir, [baseName, '.csv']);
matOutputPath = fullfile(fileDir, [baseName, '.mat']);

%% Step 3 (Native Alternative): Import the .lvm File Without External Functions
fprintf('Reading: %s\n', fullFilePath);

% MATLAB's built-in readmatrix can read tab-delimited text files directly.
% It automatically detects and ignores standard non-numeric header blocks.
rawMatrix = readmatrix(fullFilePath, 'FileType', 'text');

% Note: If your file has a strict, known number of header lines (for example, 22 lines),
% you can explicitly instruct MATLAB to skip them for faster processing:
% rawMatrix = readmatrix(fullFilePath, 'FileType', 'text', 'NumHeaderLines', 22);

%% Step 4: Export to Clean Formats in the Same Location

% Option A: Save as Comma-Separated Values (.csv) (Highly Recommended for Antigravity)
writematrix(rawMatrix, csvOutputPath);
fprintf('Successfully saved CSV to: %s\n', csvOutputPath);

% Option B: Save directly as a MATLAB workspace variable (.mat) file
save(matOutputPath, 'rawMatrix');
fprintf('Successfully saved MAT-file to: %s\n', matOutputPath);

disp('Conversion complete! Your new files are sitting right next to your original .lvm file.');