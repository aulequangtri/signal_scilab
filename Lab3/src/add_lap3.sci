function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    // Time index vectors for x1(n) and x2(n)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // Determine common time range [n_min, n_max]
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min : n_max;
    
    // New origin position (where n = 0 in ny)
    yorigin = 1 - n_min;
    
    // Pad x1n and x2n with zeros to match the length of ny
    x1_pad = [zeros(1, min(n1) - n_min), x1n, zeros(1, n_max - max(n1))];
    x2_pad = [zeros(1, min(n2) - n_min), x2n, zeros(1, n_max - max(n2))];
    
    // Perform addition
    yn = x1_pad + x2_pad;
    
    // Common axis bounds for plotting
    y_min = min([x1n, x2n, yn, 0]) - 1;
    y_max = max([x1n, x2n, yn, 0]) + 1;
    
    // Plot x1(n), x2(n), and y(n) in the same figure
    scf(); clf();
    
    subplot(3, 1, 1);
    plot2d3(n1, x1n, style=2);
    plot(n1, x1n, 'bo');
    xtitle("Signal x1(n)", "n", "Amplitude");
    a1 = gca();
    a1.data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
    
    subplot(3, 1, 2);
    plot2d3(n2, x2n, style=3);
    plot(n2, x2n, 'go');
    xtitle("Signal x2(n)", "n", "Amplitude");
    a2 = gca();
    a2.data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Added Signal y(n) = x1(n) + x2(n)", "n", "Amplitude");
    a3 = gca();
    a3.data_bounds = [n_min - 1, y_min; n_max + 1, y_max];
    xgrid();
endfunction

//Example 
[yn, yorigin] = add([0, 1, 3, -2], 1, [1, 1, 2, 3], 2)
disp("yn = ", yn);
disp("yorigin = ", yorigin);
