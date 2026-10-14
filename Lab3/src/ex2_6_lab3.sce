// ===================================================================
// Lab 3 - Additional Exercise 2.6 : time-invariance test
//   x(n) = 1 for 0 <= n <= 3, 0 elsewhere
//   System 1: y(n) = x(n^2)
//   System 2: y(n) = x(n) - x(n-1)
//   System 3: y(n) = n x(n)
// A system T is evaluated as T(f, m): output y(m) when input is f(.)
// ===================================================================

function y = xin(n)                 // input x(n)
    y = bool2s(n >= 0 & n <= 3);
endfunction

function y = x2in(n)                // delayed input x2(n) = x(n-2)
    y = xin(n - 2);
endfunction

function y = T1(f, n)               // y(n) = x(n^2)
    y = f(n.^2);
endfunction

function y = T2(f, n)               // y(n) = x(n) - x(n-1)
    y = f(n) - f(n - 1);
endfunction

function y = T3(f, n)               // y(n) = n x(n)
    y = n .* f(n);
endfunction

function stem(n, x, ttl, c, spec)
    plot2d3(n, x, style=c);
    plot(n, x, spec);
    xtitle(ttl, "n", "Amplitude");
    a = gca();
    a.data_bounds = [min(n) - 0.5, min([x, 0]) - 0.5; max(n) + 0.5, max([x, 0]) + 0.5];
    xgrid();
endfunction

function show(name, n, x)
    k  = find(x <> 0);
    lo = min([n(k), 0]);
    hi = max([n(k), 0]);
    idx = find(n >= lo & n <= hi);
    s = string(x(idx));
    s(n(idx) == 0) = s(n(idx) == 0) + "*";
    mprintf("  %-14s = {%s},   n = %d..%d\n", name, strcat(s, ", "), lo, hi);
endfunction

// Steps (1)-(6) of part (b) for a given system T
function f = check_system(T, label, n)
    x   = xin(n);           // (1) x(n)
    y   = T(xin, n);        // (2) y(n)  = T[x(n)]
    yd  = T(xin, n - 2);    // (3) y(n-2)
    x2  = x2in(n);          // (4) x2(n) = x(n-2)
    y2  = T(x2in, n);       // (5) y2(n) = T[x2(n)]
    dif = y2 - yd;          // (6) compare y2(n) with y(n-2)

    mprintf("\n----- %s -----\n", label);
    show("x(n)", n, x);
    show("y(n)", n, y);
    show("y(n-2)", n, yd);
    show("x2(n)=x(n-2)", n, x2);
    show("y2(n)=T[x2]", n, y2);
    if and(dif == 0) then
        mprintf("  => y2(n) = y(n-2) for this input (consistent with time-invariance)\n");
    else
        mprintf("  => y2(n) <> y(n-2)  ==> the system is TIME-VARIANT\n");
    end

    f = scf(); clf();
    f.figure_size = [1100, 900];
    subplot(3, 2, 1); stem(n, x,   "(1) x(n)",                   2, "bo");
    subplot(3, 2, 2); stem(n, y,   "(2) y(n) = T[x(n)]",         5, "ro");
    subplot(3, 2, 3); stem(n, yd,  "(3) y(n-2)",                 5, "ro");
    subplot(3, 2, 4); stem(n, x2,  "(4) x2(n) = x(n-2)",         2, "bo");
    subplot(3, 2, 5); stem(n, y2,  "(5) y2(n) = T[x2(n)]",       3, "go");
    subplot(3, 2, 6); stem(n, dif, "(6) y2(n) - y(n-2)",         6, "mo");
endfunction

// ------------------------- Run the tests ---------------------------
n = -4:8;
f261 = check_system(T1, "System 1: y(n) = x(n^2)", n);
f262 = check_system(T2, "System 2: y(n) = x(n) - x(n-1)", n);
f263 = check_system(T3, "System 3: y(n) = n x(n)", n);
