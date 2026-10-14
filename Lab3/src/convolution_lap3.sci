function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    // Time index vectors for x(n) and h(n)
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    
    // Compute discrete convolution using Scilab's conv()
    yn = conv(xn, hn);//Length of  yn = M + N - 1
    
    // Calculate origin position of y(n)
    yorigin = xorigin + horigin - 1;
    ny = (1:length(yn)) - yorigin;
    
    // Common axis bounds for plotting
    n_min = min([min(nx), min(nh), min(ny)]) - 1;
    n_max = max([max(nx), max(nh), max(ny)]) + 1;
    y_min = min([xn, hn, yn, 0]) - 1;
    y_max = max([xn, hn, yn, 0]) + 1;
    
    // Plot x(n), h(n), and y(n) in the same figure
    scf(); clf();
    
    subplot(3, 1, 1);
    plot2d3(nx, xn, style=2);
    plot(nx, xn, 'bo');
    xtitle("Input Signal x(n)", "n", "Amplitude");
    a1 = gca();
    a1.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
    
    subplot(3, 1, 2);
    plot2d3(nh, hn, style=3);
    plot(nh, hn, 'go');
    xtitle("Impulse Response h(n)", "n", "Amplitude");
    a2 = gca();
    a2.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
    
    subplot(3, 1, 3);
    plot2d3(ny, yn, style=5);
    plot(ny, yn, 'ro');
    xtitle("Convolved Signal y(n) = x(n) * h(n)", "n", "Amplitude");
    a3 = gca();
    a3.data_bounds = [n_min, y_min; n_max, y_max];
    xgrid();
endfunction


// Let x(n) = {1, 2^, 3, 1} (xorigin = 2) and h(n) = {1^, 2, 1, -1} (horigin = 1)
[yn, yorigin] = convolution([1, 2, 3, 1], 2, [1, 2, 1, -1], 1)
disp("yn = ", yn);
disp("yorigin = ", yorigin);
