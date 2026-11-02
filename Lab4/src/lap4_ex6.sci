clear; clc; clf;

// 1. Data definition
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

// 2. Folding and Shifting Method
y_fold = zeros(1, Ly);
x_padded = [zeros(1, Lh - 1), x, zeros(1, Lh - 1)];
h_folded = h($:-1:1);

for n = 1:Ly
    segment = x_padded(n : n + Lh - 1);
    y_fold(n) = sum(segment .* h_folded);
end

disp("y(n) via Folding and Shifting:");
disp(y_fold);

// 3. Matrix Multiplication Method
col1 = [h(:); zeros(Ly - Lh, 1)];
row1 = [h(1), zeros(1, Lx - 1)];
H = toeplitz(col1, row1);
x_col = x(:);
y_matrix = H * x_col;

disp("Convolution Matrix H:");
disp(H);
disp("y(n) via Matrix Multiplication:");
disp(y_matrix');

// 4. Energy Computation
Ex = sum(abs(x).^2);
Ey = sum(abs(y_fold).^2);
mprintf("Energy of x: Ex = %g\n", Ex);
mprintf("Energy of y: Ey = %g\n", Ey);

// 5. Visualization
nx = 0:Lx-1;
ny = 0:Ly-1;

scf(0); clf;
subplot(2, 1, 1);
plot2d3(nx', x', style=2);
plot2d3(ny', y_fold', style=5);
xlabel("n"); ylabel("Amplitude");
title("Input x(n) and Output y(n)");
legend(["x(n)"; "y(n)"], 1);

subplot(2, 1, 2);
plot2d3(nx', (abs(x).^2)', style=2);
plot2d3(ny', (abs(y_fold).^2)', style=5);
xlabel("n"); ylabel("|.|^2");
title(msprintf("Signal Energies: Ex = %g, Ey = %g", Ex, Ey));
legend(["|x(n)|^2"; "|y(n)|^2"], 1);

