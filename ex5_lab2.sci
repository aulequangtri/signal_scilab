clc;
clear;
clf;

n = -2:2;
x = [0, 1, 3, -2, 0];
x_fold = x($:-1:1);

xe = 0.5 * (x + x_fold);
xo = 0.5 * (x - x_fold);

subplot(3, 1, 1);
plot2d3(n, x, style=2);
plot(n, x, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
title("Original Signal x(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x(n)", "fontsize", 2);
xgrid(1);
a1 = gca();
a1.data_bounds = [-2.5, -2.5; 2.5, 3.5];

subplot(3, 1, 2);
plot2d3(n, xo, style=5);
plot(n, xo, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
title("Odd Signal Component xo(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("xo(n)", "fontsize", 2);
xgrid(1);
a2 = gca();
a2.data_bounds = [-2.5, -2.5; 2.5, 3.5];

subplot(3, 1, 3);
plot2d3(n, xe, style=3);
plot(n, xe, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
title("Even Signal Component xe(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("xe(n)", "fontsize", 2);
xgrid(1);
a3 = gca();
a3.data_bounds = [-2.5, -2.5; 2.5, 3.5];
