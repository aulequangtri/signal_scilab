function [yn, yorigin] = fold(xn, xorigin)
    // Reverse the array elements
    yn = xn($:-1:1);
    
    // Calculate new origin position
    L = length(xn);
    yorigin = L - xorigin + 1;
    
    // Time index vectors for x(n) and y(n)
    nx = (1:L) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    // Common axis limits for clear comparison
    n_min = min(min(nx), min(ny)) - 1;
    n_max = max(max(nx), max(ny)) + 1;
    y_min = min([xn, yn, 0]) - 1;
    y_max = max([xn, yn, 0]) + 1;
    
    // Plot x(n) and y(n) in the same figure
    scf(); clf();
    
    subplot(2, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Original Signal x(n)", "n", "Amplitude");
    a1 = gca();
    a1.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
    
    subplot(2, 1, 2);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Folded Signal y(n) = x(-n)", "n", "Amplitude");
    a2 = gca();
    a2.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
endfunction

// Execute the example
[yn, yorigin] = fold([1, -2, 3, 6], 3)
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);