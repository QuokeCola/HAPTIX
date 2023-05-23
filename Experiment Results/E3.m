% Data for individual scores and average perceived realism scores
individual_scores = [4, 3, 3, 2, 4, 3;
                     5, 4, 4, 3, 3, 5;
                     4, 3, 3, 3, 4, 4;
                     4, 4, 3, 2, 4, 3;
                     5, 5, 2, 1, 5, 4;
                     4, 3, 5, 3, 3, 3;
                     5, 5, 4, 4, 4, 4;
                     4, 3, 3, 3, 3, 5;
                     3, 4, 4, 3, 4, 3;
                     5, 3, 3, 2, 5, 3];
average_scores = [4.3, 3.7, 3.4, 2.6, 3.9, 3.7];

% Calculate minimum and maximum scores for error bars
min_scores = min(individual_scores);
max_scores = max(individual_scores);

% Calculate lower and upper error values
lower_error = average_scores - min_scores;
upper_error = max_scores - average_scores;

% Labels for objects
object_labels = {'Sphere', 'Rectangle', 'Cup', 'Cone', 'Cylinder 1', 'Cylinder 2'};

% Create a horizontal bar chart with error bars
figure;
hb = barh(1:length(object_labels), average_scores, 0.6);
hold on;

% Add error bars
errorbar(average_scores, 1:length(object_labels), lower_error, upper_error, 'horizontal', 'LineStyle', 'none', 'Color', 'black', 'LineWidth', 1.5);

% Set the labels for the vertical axis
yticks(1:length(object_labels));
yticklabels(object_labels);

% Set the label for the horizontal axis
xlabel('Average Perceived Realism Score');

% Set the title of the bar chart
title('Shape Rendering Score Evaluation');

% Display the average scores as text labels next to the bars with adjusted vertical position
vertical_offset = -0.15;
for i = 1:length(average_scores)
    text(average_scores(i) + 0.1, i + vertical_offset, num2str(average_scores(i), '%.1f'), 'VerticalAlignment', 'middle');
end

% Display the bar chart
grid on;
axis tight;
box on;
hold off;
