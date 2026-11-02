clear; clc; clf;

// ---------- Data ----------
x = [1, 2, -3, 2, 1];      // x(0)=1
h = [1, 0, -1, -1, 1];     // h(0)=1
N = length(x);
M = length(h);
n = 0:N-1;

// =====================================================
// (a) FOLDING AND SHIFTING METHOD
// y(n) = sum_k h(k) * x[(n-k) mod N]
// =====================================================
y_fs = zeros(1, N);
for i = 0:N-1
    idx  = pmodulo(i - (0:M-1), N) + 1;   // pmodulo: always >= 0; +1 for Scilab indexing
    x_fs = x(idx);                        // folded and shifted copy of x
    y_fs(i+1) = sum(h .* x_fs);
    mprintf("n=%d  x[(n-k) mod N] = [%s]  ->  y(%d) = %d\n", ...
            i, strcat(string(x_fs), " "), i, y_fs(i+1));
end
disp("y (folding and shifting) = ");
disp(y_fs);

// =====================================================
// (b) MATRIX METHOD:  y = Xc * h'
// Xc(n,k) = x[(n-k) mod N]
// =====================================================
Xc = zeros(N, M);
for i = 0:N-1
    for k = 0:M-1
        Xc(i+1, k+1) = x(pmodulo(i - k, N) + 1);
    end
end
disp("Circulant matrix Xc = ");
disp(Xc);

y_mat = (Xc * h')';
disp("y (matrix method) = ");
disp(y_mat);

// ---------- Checks ----------
disp("Both methods equal? ");
disp(and(y_fs == y_mat));
y_fft = real(fft(fft(x, -1) .* fft(h, -1), 1));   // DFT property check
disp("y (FFT check) = ");
disp(round(y_fft));

// =====================================================
// (c) ENERGY AND PLOTS IN ONE FIGURE
// =====================================================
y  = y_mat;
ex = abs(x).^2;            // energy per sample
ey = abs(y).^2;
Ex = sum(ex);
Ey = sum(ey);
mprintf("Energy of x = %g,  Energy of y = %g\n", Ex, Ey);

scf(0); clf;

// --- top: x(n) and y(n) ---
subplot(2,1,1);
plot2d3([n'-0.08, n'+0.08], [x', y'], style=[2, 5], rect=[-0.5, -5, N-0.5, 5]);
xgrid();
xlabel("n"); ylabel("amplitude");
title("x(n) and y(n) = circular convolution of x and h");
legend(["x(n)"; "y(n)"], 1);

// --- bottom: energy of the signals ---
subplot(2,1,2);
plot2d3([n'-0.08, n'+0.08], [ex', ey'], style=[2, 5], rect=[-0.5, 0, N-0.5, 20]);
xgrid();
xlabel("n"); ylabel("|.|^2");
title(msprintf("Energy per sample:  Ex = %g,  Ey = %g", Ex, Ey));
legend(["|x(n)|^2"; "|y(n)|^2"], 1);
