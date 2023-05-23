% Define your data
data = [1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 2 3; 1 3 2; 2 1 3; 1 3 2; 3 2 1];

% Count the occurrences of each number in each column
counts = [sum(data(:,1) == 1), sum(data(:,1) == 2), sum(data(:,1) == 3);
          sum(data(:,2) == 1), sum(data(:,2) == 2), sum(data(:,2) == 3);
          sum(data(:,3) == 1), sum(data(:,3) == 2), sum(data(:,3) == 3)];

% Define labels
labels = {'1', '2', '3'};
subtitles = {'Success Rate: 86.7%', 'Success Rate: 80%', 'Success Rate: 73.3%'};
% Plot the pie charts
figure;

% Pie chart for the first column
subplot(1, 3, 1);
pie(counts(1, :), labels);
title('Heaviest Object', 'Position', [0, 1.75, 0]);
text(0, 1.6, subtitles{1}, 'HorizontalAlignment', 'center');

% Pie chart for the second column
subplot(1, 3, 2);
pie(counts(2, :), labels);
title('Second Heaviest Object', 'Position', [0, 1.75, 0]);
text(0, 1.6, subtitles{2}, 'HorizontalAlignment', 'center');

% Pie chart for the third column
subplot(1, 3, 3);
pie(counts(3, :), labels);
title('Lightest Object', 'Position', [0, 1.75, 0]);
text(0, 1.6, subtitles{3}, 'HorizontalAlignment', 'center');


