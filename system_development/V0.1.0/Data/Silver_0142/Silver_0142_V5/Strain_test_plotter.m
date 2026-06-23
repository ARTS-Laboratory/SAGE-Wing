%% MATLAB Script to Process Multiple Strain Sensor Data Files
clear; clc; close all;
% --- CONFIGURATION ---
prefix = 'Silver'; version = 'V5';
suffixes = {'ss', 'lb', 'mb', 'hb', 'fb', 'sf'};
full_names = {'Starting Static', 'Light Bending', 'Medium Bending', 'Heavy Bending', 'Fast Bending', 'Final Static'};

% Initialize storage for comparison
time_ss = []; res_ss = []; time_sf = []; res_sf = [];
y_label_str = ''; 

% 2. Loop through each file
for i = 1:length(suffixes)
    filename = sprintf('%s_%s_%s.lvm', prefix, version, suffixes{i});
    if ~isfile(filename), continue; end
    
    data = readmatrix(filename, 'NumHeaderLines', 22, 'FileType', 'text', 'Delimiter', ',');
    time_sec = data(:, 1);
    resistance_ohms = data(:, 2);
    
    % 3. Auto-detect units
    max_r = max(resistance_ohms);
    if max_r >= 1e6
        plot_resistance = resistance_ohms / 1e6; y_label_str = 'Resistance (M\Omega)';
    elseif max_r >= 1e3
        plot_resistance = resistance_ohms / 1e3; y_label_str = 'Resistance (k\Omega)';
    else
        plot_resistance = resistance_ohms; y_label_str = 'Resistance (\Omega)';
    end
    
    % Capture for comparison
    if strcmp(suffixes{i}, 'ss')
        time_ss = time_sec; res_ss = plot_resistance;
    elseif strcmp(suffixes{i}, 'sf')
        time_sf = time_sec; res_sf = plot_resistance;
    end
    
    % 4. Individual Plotting
    f = figure('Name', full_names{i}, 'Color', 'w', 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    plot(time_sec, plot_resistance, 'LineWidth', 1.7, 'Color', [0.85, 0.33, 0.10]);
    title([prefix, ' ', version, ' - ', full_names{i}], 'FontSize', 14);
    xlabel('Time (s)', 'FontSize', 12); ylabel(y_label_str, 'FontSize', 12);
    grid on;
    exportgraphics(f, sprintf('Plot_%s_%s_%s.jpg', prefix, version, suffixes{i}), 'Resolution', 300);
end

% 5. Comparison Plot (Outside the loop)
if ~isempty(res_ss) && ~isempty(res_sf)
    f_comp = figure('Name', 'Static Drift Comparison', 'Color', 'w', 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
    plot(time_ss, res_ss, 'b', 'LineWidth', 1.5, 'DisplayName', 'Starting Static');
    hold on;
    plot(time_sf, res_sf, 'r', 'LineWidth', 1.5, 'DisplayName', 'Final Static');
    
    title(['Drift Comparison: ', prefix, ' ', version], 'FontSize', 14);
    xlabel('Time (s)', 'FontSize', 12); ylabel(y_label_str, 'FontSize', 12);
    legend('Location', 'best', 'FontSize', 12); grid on;
    
    exportgraphics(f_comp, sprintf('LineComparison_%s_%s.jpg', prefix, version), 'Resolution', 300);
end