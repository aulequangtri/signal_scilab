// ===================================================================
// Lab 3 - Additional Exercise 2.4
// Even / odd decomposition of x(n) = {2, 3, 4^, 5, 6}   (^ = origin)
// ===================================================================

// [xe, xo, yorigin] = evenodd(xn, xorigin)
//   xe(n) = [x(n) + x(-n)] / 2 ,  xo(n) = [x(n) - x(-n)] / 2
//   Both outputs are placed on a symmetric grid [-L, L] so that the
//   origin is exactly in the middle (yorigin = L + 1).
function [xe, xo, yorigin, xs, xf] = evenodd(xn, xorigin)
    nx = (1:length(xn)) - xorigin;     // time indices of x(n)
    L  = max(abs(nx));                 // half-length of symmetric grid
    xs = zeros(1, 2*L + 1);
    xs(nx + L + 1) = xn;               // x(n)  on [-L, L]
    xf = xs($:-1:1);                   // x(-n) on [-L, L]  (folding)
    xe = (xs + xf) / 2;
    xo = (xs - xf) / 2;
    yorigin = L + 1;
endfunction

function stem(n, x, ttl, c, spec)
    plot2d3(n, x, style=c);
    plot(n, x, spec);
    xtitle(ttl, "n", "Amplitude");
    a = gca();
    a.data_bounds = [min(n) - 1, min([x, 0]) - 1; max(n) + 1, max([x, 0]) + 1];
    xgrid();
endfunction

// ------------------------- Computation -----------------------------
[xe, xo, yorigin, xs, xf] = evenodd([2, 3, 4, 5, 6], 3);
n = (1:length(xe)) - yorigin;

mprintf("\n----- Exercise 2.4 -----\n");
mprintf("n       = %s\n", strcat(string(n),  "  "));
mprintf("x(n)    = %s\n", strcat(string(xs), "  "));
mprintf("x(-n)   = %s\n", strcat(string(xf), "  "));
mprintf("xe(n)   = %s\n", strcat(string(xe), "  "));
mprintf("xo(n)   = %s\n", strcat(string(xo), "  "));
mprintf("yorigin = %d\n", yorigin);
mprintf("xe even  (xe(n) =  xe(-n)) : %s\n", string(and(xe ==  xe($:-1:1))));
mprintf("xo odd   (xo(n) = -xo(-n)) : %s\n", string(and(xo == -xo($:-1:1))));
mprintf("xe + xo == x               : %s\n", string(and(xe + xo == xs)));

// --------------------------- Plotting ------------------------------
f24 = scf(); clf();
f24.figure_size = [1100, 800];
subplot(2, 2, 1); stem(n, xs, "x(n)",             2, "bo");
subplot(2, 2, 2); stem(n, xf, "x(-n)",            13, "ko");
subplot(2, 2, 3); stem(n, xe, "Even part xe(n)",  3, "go");
subplot(2, 2, 4); stem(n, xo, "Odd part xo(n)",   5, "ro");
