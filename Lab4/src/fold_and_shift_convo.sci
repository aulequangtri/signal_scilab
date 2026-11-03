// Define signals as row vectors
x = [1, 2, -3, 2, 1];
h = [1, 0, -1];

Lx = length(x);
Lh = length(h);
Ly = Lx + Lh - 1;

// Initialize output vector y
y_fold = zeros(1, Ly);

// Zero-pad x so index lookups don't go out of bounds
// We pad with (Lh - 1) zeros on both sides
x_padded = [zeros(1, Lh - 1), x, zeros(1, Lh - 1)];

// h reversed (folded): h(-k)
h_folded = h($:-1:1);

// Slide and multiply
for n = 1:Ly
    // Extract the window of x that aligns with the folded h
    segment = x_padded(n : n + Lh - 1);
    y_fold(n) = sum(segment .* h_folded);
end

disp("y(n) via Folding and Shifting:");
disp(y_fold);
