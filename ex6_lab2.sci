clc;
clear;
clf;

n = -2:4;
x1 = [0, 0, 0, 1, 3, -2, 0];
x2 = [0, 0, 1, 2, 3, 0, 0];
y = x1 + x2;

subplot(3, 1, 1);
plot2d3(n, x1, style=2);
plot(n, x1, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
title("Signal x1(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x1(n)", "fontsize", 2);
xgrid(1);
a1 = gca();
a1.data_bounds = [-2.5, -3; 4.5, 7];

subplot(3, 1, 2);
plot2d3(n, x2, style=5);
plot(n, x2, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
title("Signal x2(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x2(n)", "fontsize", 2);
xgrid(1);
a2 = gca();
a2.data_bounds = [-2.5, -3; 4.5, 7];

subplot(3, 1, 3);
plot2d3(n, y, style=3);
plot(n, y, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
title("Sum Signal y(n) = x1(n) + x2(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("y(n)", "fontsize", 2);
xgrid(1);
a3 = gca();
a3.data_bounds = [-2.5, -3; 4.5, 7];
