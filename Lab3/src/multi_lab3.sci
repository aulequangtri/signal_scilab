function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    // Time index vectors for x1 and x2
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    // Find the common time bounds
    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    ny = n_min:n_max;
    
    // Initialize aligned arrays with zeros
    x1_aligned = zeros(1, length(ny));
    x2_aligned = zeros(1, length(ny));
    
    // Find starting indices in the common time vector
    start1 = find(ny == n1(1));
    start2 = find(ny == n2(1));
    
    // Populate aligned arrays
    x1_aligned(start1 : start1 + length(x1n) - 1) = x1n;
    x2_aligned(start2 : start2 + length(x2n) - 1) = x2n;
    
    // Perform element-wise multiplication
    yn = x1_aligned .* x2_aligned;
    
    // New origin is where ny equals 0
    yorigin = find(ny == 0);
    
    // Determine common axis limits for plotting
    y_min = min([x1n, x2n, yn, 0]) - 1;
    y_max = max([x1n, x2n, yn, 0]) + 1;
    
    // Plotting
    scf(); clf();
    
    subplot(3, 1, 1);
    plot2d3(ny, x1_aligned, style=2);
    plot(ny, x1_aligned, 'bo');
    xtitle("Signal x1(n)", "n", "Amplitude");
    a1 = gca();
    a1.data_bounds = [n_min-1, y_min; n_max+1, y_max];
    xgrid();
    
    subplot(3, 1, 2);
    plot2d3(ny, x2_aligned, style=3);
    plot(ny, x2_aligned, 'go');
    xtitle("Signal x2(n)", "n", "Amplitude");
    a2 = gca();
    a2.data_bounds = [n_min-1, y_min; n_max+1, y_max];
    xgrid();
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Multiplied Signal y(n) = x1(n)*x2(n)", "n", "Amplitude");
    a3 = gca();
    a3.data_bounds = [n_min-1, y_min; n_max+1, y_max];
    xgrid();
endfunction

// Execute the example
[yn, yorigin] = multi([1, 2, 3], 3, [4, 5], 1)
disp("yn = "); disp(yn);
disp("yorigin = "); disp(yorigin);