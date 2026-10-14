// ===================================================================
// Lab 3 - Additional Exercise 2.2
// x(n) from Figure P2.2:  x(n) = {1, 1^, 1, 1, 1/2, 1/2}   (^ = origin)
// i.e. x(n) = 1 for -1 <= n <= 2, x(3) = x(4) = 1/2, 0 elsewhere
// ===================================================================

// x(n) evaluated at ANY integer index vector n
function y = xsig(n)
    y = bool2s(n >= -1 & n <= 2) + 0.5 * bool2s(n == 3 | n == 4);
endfunction

// Unit step u(n) and unit sample delta(n)
function y = ustep(n)
    y = bool2s(n >= 0);
endfunction

function y = delta(n)
    y = bool2s(n == 0);
endfunction

// Stem plot with markers, grid and labels
function stem(n, x, ttl, c, spec)
    plot2d3(n, x, style=c);
    plot(n, x, spec);
    xtitle(ttl, "n", "Amplitude");
    a = gca();
    a.data_bounds = [min(n) - 0.5, min([x, 0]) - 0.25; max(n) + 0.5, max([x, 0]) + 0.25];
    xgrid();
endfunction

// Print the signal as {v1, v2, v0*, ...} where * marks the origin n = 0
function show(name, n, x)
    k  = find(x <> 0);
    lo = min([n(k), 0]);
    hi = max([n(k), 0]);
    idx = find(n >= lo & n <= hi);
    s = string(x(idx));
    s(n(idx) == 0) = s(n(idx) == 0) + "*";
    mprintf("%-16s = {%s},   n = %d..%d\n", name, strcat(s, ", "), lo, hi);
endfunction

// ------------------------- Computation -----------------------------
n  = -6:8;
x  = xsig(n);
ya = xsig(n - 2);                     // (a) x(n-2)
yb = xsig(4 - n);                     // (b) x(4-n)
yc = xsig(n + 2);                     // (c) x(n+2)
yd = xsig(n) .* ustep(2 - n);         // (d) x(n)u(2-n)
ye = xsig(n - 1) .* delta(n - 3);     // (e) x(n-1)delta(n-3)
yf = xsig(n.^2);                      // (f) x(n^2)
yg = (xsig(n) + xsig(-n)) / 2;        // (g) even part
yh = (xsig(n) - xsig(-n)) / 2;        // (h) odd part

mprintf("\n----- Exercise 2.2 (* marks n = 0) -----\n");
show("x(n)", n, x);
show("(a) x(n-2)", n, ya);
show("(b) x(4-n)", n, yb);
show("(c) x(n+2)", n, yc);
show("(d) x(n)u(2-n)", n, yd);
show("(e) x(n-1)d(n-3)", n, ye);
show("(f) x(n^2)", n, yf);
show("(g) xe(n)", n, yg);
show("(h) xo(n)", n, yh);
mprintf("Check xe(n) + xo(n) = x(n): %s\n", string(and(yg + yh == x)));

// --------------------------- Plotting ------------------------------
f22 = scf(); clf();
f22.figure_size = [1300, 950];
subplot(3, 3, 1); stem(n, x,  "x(n)",                   2, "bo");
subplot(3, 3, 2); stem(n, ya, "(a) x(n-2)",             5, "ro");
subplot(3, 3, 3); stem(n, yb, "(b) x(4-n)",             5, "ro");
subplot(3, 3, 4); stem(n, yc, "(c) x(n+2)",             5, "ro");
subplot(3, 3, 5); stem(n, yd, "(d) x(n)u(2-n)",         5, "ro");
subplot(3, 3, 6); stem(n, ye, "(e) x(n-1)delta(n-3)",   5, "ro");
subplot(3, 3, 7); stem(n, yf, "(f) x(n^2)",             5, "ro");
subplot(3, 3, 8); stem(n, yg, "(g) even part xe(n)",    3, "go");
subplot(3, 3, 9); stem(n, yh, "(h) odd part xo(n)",     6, "mo");
