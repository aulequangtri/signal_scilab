// Define signals as row vectors
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

// Column 1 of H: h padded with zeros to length Ly
col1 = [h(:); zeros(Ly - Lh, 1)];

// Row 1 of H: h(1) followed by (Lx - 1) zeros
row1 = [h(1), zeros(1, Lx - 1)];

// Build the Toeplitz convolution matrix H (size 7 x 5)
H = toeplitz(col1, row1);

// Convert x to a column vector and multiply
x_col = x(:);
y_matrix = H * x_col;

disp("Convolution Matrix H:");
disp(H);

disp("y(n) via Matrix Multiplication:");
disp(y_matrix');
