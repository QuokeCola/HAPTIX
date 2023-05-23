real_data = [
  3  8  5  7  2  1  3  4  8  6  7;
  5  6  4  5  4  3  5  6  3  2  1;
  2  4  8  8  3  2  1  2  2  1  3;
  6  2  2  2  1  5  6  3  6  3  2;
  8  1  1  6  6  7  2  1  7  4  8;
  1  5  5  3  5  4  8  5  1  8  5;
  5  7  6  6  8  8  7  7  5  3  6;
  4  3  2  1  3  1  5  8  3  7  1;
  3  2  3  4  7  6  6  2  4  5  4;
  7  1  7  8  7  8  4  4  8  6  5;
];

perceived_data = [
  3  8  5  6  2  1  3  4  8  6  6;
  4  6  4  5  4  3  5  6  3  2  1;
  2  3  8  8  2  2  1  2  2  1  3;
  6  4  2  2  1  5  6  3  6  3  2;
  7  1  1  6  6  7  2  1  7  5  8;
  1  5  5  3  5  4  8  5  1  8  5;
  5  7  5  6  8  8  7  6  5  3  6;
  4  3  2  1  3  1  4  8  3  6  1;
  3  2  3  3  7  6  6  2  4  5  4;
  7  3  7  8  7  8  4  4  8  6  5;
];
% Combine real and perceived data into one array
combined_data = [real_data, perceived_data];
num_participants = size(real_data, 2);

% Create cell array for table
table_data = cell(size(real_data, 1) + 1, num_participants * 2);

% Add headers
for i = 1:num_participants
    table_data{1, i * 2 - 1} = sprintf('P%d Real', i);
    table_data{1, i * 2} = sprintf('P%d Perception', i);
end

% Add data to the table
for i = 1:size(real_data, 1)
    for j = 1:num_participants
        table_data{i + 1, j * 2 - 1} = real_data(i, j);
        table_data{i + 1, j * 2} = perceived_data(i, j);
    end
end

% Create table from cell array
result_table = cell2table(table_data(2:end, :), 'VariableNames', table_data(1, :));

% Display the table
disp(result_table);
% Create a figure with the table
figure;
uitable('Data', combined_data, 'ColumnName', {'P1', 'P2', 'P3', 'P4', 'P5', 'P6', 'P7', 'P8', 'P9', 'P10', 'P11'});

% Save the figure as a JPG image
saveas(gcf, 'result_table.jpg');


% % Calculate the difference between real and perceived directions
% difference_data = abs(real_data - perceived_data);
% 
% % Create a heatmap
% figure;
% heatmap(1:num_participants, 1:size(real_data, 1), difference_data, ...
%         'Colormap', jet, ...
%         'ColorbarVisible', 'on', ...
%         'ColorScaling', 'scaled', ...
%         'GridVisible', 'on');
% 
% % Set axis labels and plot title
% xlabel('Participant');
% ylabel('Trial');
% title('Heatmap of Absolute Difference Between Real and Perceived Directions');

% figure;
% hold on;
% 
% num_participants = size(real_data, 2);

% % Define a list of colors or markers for each participant
% colors = ['r', 'g', 'b', 'm', 'c', 'k', 'y', 'r', 'g', 'b', 'm'];
% markers = ['o', 's', 'd', '^', 'v', '>', '<', 'p', 'h', '+', 'x'];
% 
% % Iterate through the participants and plot their data
% for i = 1:num_participants
%     % Use the current color and marker for each participant
%     current_color = colors(i);
%     current_marker = markers(i);
%     
%     % Combine the color and marker in a single string
%     plot_style = strcat(current_color, current_marker);
%     
%     % Extract real and perceived data for the current participant
%     x = real_data(:, i);
%     y = perceived_data(:, i);
%     
%     % Plot the data using the specified color and marker
%     scatter(x, y, 50, plot_style, 'filled');
% end
% 
% % Set axis labels and plot title
% xlabel('Real Directions');
% ylabel('Perceived Directions');
% title('Real vs. Perceived Directions for Different Participants');
% 
% % Set axis limits
% xlim([0, 9]);
% ylim([0, 9]);
% 
% % Add a legend to the plot to identify each participant
% participant_labels = arrayfun(@(n) sprintf('Participant %d', n), 1:num_participants, 'UniformOutput', false);
% legend(participant_labels);
% 
% hold off;
