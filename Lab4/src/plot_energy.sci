// Define signals as row vectors
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

// Define discrete-time sample indices
n_x = 0 : (Lx - 1);           // 0 to 4
n_y = 0 : (Ly - 1);           // 0 to 6

// Calculate instantaneous energy sequences: |s(n)|^2
Ex = x.^2;
Ey = (y_matrix').^2;

// Calculate total scalar energy values
total_Ex = sum(Ex);
total_Ey = sum(Ey);

printf("Total Energy of x(n): %f\n", total_Ex);
printf("Total Energy of y(n): %f\n", total_Ey);

// --- Create Subplots ---
clf(); // Clear current figure window

// 1. Input signal x(n)
subplot(2, 2, 1);
plot2d3(n_x, x, color("red"));
h_stem = gce();
h_stem.children.thickness = 2;
plot(n_x, x, 'r.');
xtitle("Input Signal x(n)", "n", "Amplitude");
xgrid(1);

// 2. Output signal y(n)
subplot(2, 2, 2);
plot2d3(n_y, y_matrix', color("blue"));
h_stem = gce();
h_stem.children.thickness = 2;
plot(n_y, y_matrix', 'b.');
xtitle("Output Signal y(n) = x(n) * h(n)", "n", "Amplitude");
xgrid(1);

// 3. Instantaneous Energy of x(n)
subplot(2, 2, 3);
plot2d3(n_x, Ex, color("magenta"));
h_stem = gce();
h_stem.children.thickness = 2;
plot(n_x, Ex, 'm.');
xtitle(msprintf("Instantaneous Energy of x(n) [Total: %g]", total_Ex), "n", "|x(n)|^2");
xgrid(1);

// 4. Instantaneous Energy of y(n)
subplot(2, 2, 4);
plot2d3(n_y, Ey,color("black"));
h_stem = gce();
h_stem.children.thickness = 2;
plot(n_y, Ey, 'k.');
xtitle(msprintf("Instantaneous Energy of y(n) [Total: %g]", total_Ey), "n", "|y(n)|^2");
xgrid(1);
