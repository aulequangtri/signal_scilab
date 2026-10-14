function [yn, yorigin] = delay(xn, xorigin, k)
    // Check for valid k > 0
    if k <= 0 then
        error("k must be greater than 0");
    end
    
    // Time index vector for x(n)
    nx = (1:length(xn)) - xorigin;
    
    // Calculate new origin position for delay
    yorigin = xorigin - k;
    
    // Pad zeros on the left if yorigin <= 0
    if yorigin <= 0 then
        pad_size = abs(yorigin) + 1;
        yn = [zeros(1, pad_size), xn];
        yorigin = 1; // Origin is now at the first element
    else
        yn = xn;
    end
    
    // Time index vector for y(n)
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
    xtitle("Delayed Signal y(n) = x(n - " + string(k) + ")", "n", "Amplitude");
    a2 = gca();
    a2.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
endfunction

// Execute the example
[yn, yorigin] = delay([1, -2, 3, 6], 3, 1)
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);
