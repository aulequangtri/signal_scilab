clc;
clear;
close(winsid());

n = -6:3;
x  = [0, 0, 0, 0, 1, -2, 3, 6, 0, 0];
y1 = [0, 0, 0, 0, 0, 6, 3, -2, 1, 0];
y2 = [0, 1, -2, 3, 6, 0, 0, 0, 0, 0];
y3 = [0, 0, 0, 12, 6, -4, 2, 0, 0, 0];

scf(1);
clf(1);
subplot(2, 1, 1);
plot2d3(n, x, style=2);
plot(n, x, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
title("Original Signal x(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x(n)", "fontsize", 2);
xgrid(1);
a1 = gca();
a1.data_bounds = [-6.5, -5; 3.5, 13];

subplot(2, 1, 2);
plot2d3(n, y1, style=5);
plot(n, y1, 'ro', 'MarkerSize', 6, 'MarkerFaceColor', 'r');
title("Manipulated Signal y1(n) = x(-n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("y1(n)", "fontsize", 2);
xgrid(1);
a2 = gca();
a2.data_bounds = [-6.5, -5; 3.5, 13];

scf(2);
clf(2);
subplot(2, 1, 1);
plot2d3(n, x, style=2);
plot(n, x, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
title("Original Signal x(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x(n)", "fontsize", 2);
xgrid(1);
a3 = gca();
a3.data_bounds = [-6.5, -5; 3.5, 13];

subplot(2, 1, 2);
plot2d3(n, y2, style=3);
plot(n, y2, 'go', 'MarkerSize', 6, 'MarkerFaceColor', 'g');
title("Manipulated Signal y2(n) = x(n + 3)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("y2(n)", "fontsize", 2);
xgrid(1);
a4 = gca();
a4.data_bounds = [-6.5, -5; 3.5, 13];

scf(3);
clf(3);
subplot(2, 1, 1);
plot2d3(n, x, style=2);
plot(n, x, 'bo', 'MarkerSize', 6, 'MarkerFaceColor', 'b');
title("Original Signal x(n)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("x(n)", "fontsize", 2);
xgrid(1);
a5 = gca();
a5.data_bounds = [-6.5, -5; 3.5, 13];

subplot(2, 1, 2);
plot2d3(n, y3, style=6);
plot(n, y3, 'mo', 'MarkerSize', 6, 'MarkerFaceColor', 'm');
title("Manipulated Signal y3(n) = 2x(-n - 2)", "fontsize", 3);
xlabel("n", "fontsize", 2);
ylabel("y3(n)", "fontsize", 2);
xgrid(1);
a6 = gca();
a6.data_bounds = [-6.5, -5; 3.5, 13];
