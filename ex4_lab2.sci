clc;
clear;
clf;

n = -5:5;
ur = n .* bool2s(n >= 0);

plot2d3(n, ur, style=2);
plot(n, ur, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

xlabel("Sample index (n)", "fontsize", 3);
ylabel("Amplitude ur(n)", "fontsize", 3);
title("Discrete-Time Unit Ramp Signal ur(n) for n = -5:5", "fontsize", 4);
xgrid(1);

a = gca();
a.data_bounds = [-6, -0.5; 6, 5.5];
