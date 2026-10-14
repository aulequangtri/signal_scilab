// ============================================================================
// File: src/ex2_2_lab1.sce
// Description: Discrete-time signal operations and unit impulse/step decomposition
// ============================================================================

clear; clc;

// 1. Define the original signal function x(n)
function y = xsig(n)
    y = zeros(1, length(n));
    for i = 1:length(n)
        ni = n(i);
        if (ni >= -3) & (ni <= -1)
            y(i) = 1 + ni / 3;
        elseif (ni >= 0) & (ni <= 3)
            y(i) = 1;
        else
            y(i) = 0;
        end
    end
endfunction

// Unit impulse function delta(n)
function y = delta(n)
    y = zeros(1, length(n));
    y(find(n == 0)) = 1;
endfunction

// Unit step function u(n)
function y = u(n)
    y = zeros(1, length(n));
    y(find(n >= 0)) = 1;
endfunction

// Helper to print signals formatted with origin asterisk (*)
function print_signal(label_str, n_grid, val_grid)
    nz_idx = find(val_grid ~= 0);
    if isempty(nz_idx) then
        disp(label_str + " = {0*}, n = 0..0");
        return;
    end
    
    // Determine bounds including n = 0
    min_n = min([n_grid(nz_idx), 0]);
    max_n = max([n_grid(nz_idx), 0]);
    
    sel = find((n_grid >= min_n) & (n_grid <= max_n));
    sub_n = n_grid(sel);
    sub_v = val_grid(sel);
    
    str_elems = [];
    for k = 1:length(sub_n)
        val_round = round(sub_v(k) * 100) / 100;
        v_str = string(val_round);
        if sub_n(k) == 0 then
            v_str = v_str + "*";
        end
        str_elems = [str_elems, v_str];
    end
    
    out_str = sprintf("%s = {%s}, n = %d..%d", ..
        label_str, strcat(str_elems, ", "), min_n, max_n);
    disp(out_str);
endfunction

// Common index grid
n = -8:8;

// Compute signal transformations
x_orig   = xsig(n);                     // (a) x(n)
x_b1     = xsig(4 - n);                 // (b.1) Fold then delay: x(-n+4)
x_b2_del = xsig(n - 4);                 // (b.2.i) Delay by 4: x(n-4)
x_b2_fld = xsig(-n - 4);                // (b.2.ii) Fold x(n-4): x(-n-4)
x_c      = xsig(-n + 4);                // (c) x(-n+4)

// (e) Express x(n) using delta and u(n)
x_e = (1/3)*delta(n+2) + (2/3)*delta(n+1) + u(n) - u(n-4);

// Console Output Display
mprintf("(* marks the sample at n = 0)\n\n");
print_signal("x(n)", n, x_orig);
print_signal("(b.1) fold x(n) then delay by 4: x(-n+4)", n, x_b1);
print_signal("(b.2.i) delay x(n) by 4: x(n-4)", n, x_b2_del);
print_signal("(b.2.ii) fold x(n-4): x(-n-4)", n, x_b2_fld);
print_signal("(c) x(-n+4)", n, x_c);
print_signal("(e) x(n) via delta & unit step", n, x_e);

// Scilab uses and() instead of all()
is_equal = and(x_b1 == x_c);
if is_equal then
    mprintf("\nCheck x(-n+4) from (b.1) == x(-n+4) from (c): T\n");
else
    mprintf("\nCheck x(-n+4) from (b.1) == x(-n+4) from (c): F\n");
end

// Plotting Setup
clf();
subplot(3, 2, 1);
plot2d3(n, x_orig, 2); plot(n, x_orig, 'ro');
xtitle('(a) x(n)', 'n', 'amplitude'); xgrid();

subplot(3, 2, 2);
plot2d3(n, x_b1, 2); plot(n, x_b1, 'ro');
xtitle('(b.1) Fold then delay: x(-n+4)', 'n', 'amplitude'); xgrid();

subplot(3, 2, 3);
plot2d3(n, x_b2_del, 2); plot(n, x_b2_del, 'ro');
xtitle('(b.2.i) Delay x(n) by 4: x(n-4)', 'n', 'amplitude'); xgrid();

subplot(3, 2, 4);
plot2d3(n, x_b2_fld, 2); plot(n, x_b2_fld, 'ro');
xtitle('(b.2.ii) Fold x(n-4): x(-n-4)', 'n', 'amplitude'); xgrid();

subplot(3, 2, 5);
plot2d3(n, x_c, 2); plot(n, x_c, 'ro');
xtitle('(c) x(-n+4)', 'n', 'amplitude'); xgrid();

subplot(3, 2, 6);
plot2d3(n, x_e, 2); plot(n, x_e, 'ro');
xtitle('(e) Expression via \delta(n) and u(n)', 'n', 'amplitude'); xgrid();

// Export the figure (ensure 'figures' directory exists, or it will fail)
// xs2png(gcf(), 'figures/ex2_2.png');
