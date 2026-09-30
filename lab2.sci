clf(); // Clear the current figure window
t = linspace(0, 2*%pi, 100);

// 1. Top-Left: Sine wave
subplot(2, 2, 1);
plot(t, sin(t), 'b');
title("sin_plot", "fontname", 3, "color", "blue", "box", "on")//title(text, property_name, property_value,...)
//xlabel(label, property_name, property_value,...)
xlabel("t(time)", "color", "red");
ylabel("amp","backgroundcolor", "#FFFFCC" )
// 2. Top-Right: Cosine wave
subplot(2, 2, 2);
plot(t, cos(t), 'r');
xtitle("cos(t)", "t", "Amplitude");

// 3. Bottom-Left: Damped sine wave (using 3-digit shorthand)
subplot(223);
plot(t, exp(-0.5*t) .* sin(3*t), 'g');
xtitle("Damped Sine", "t", "Amplitude");

// 4. Bottom-Right: Discrete stem-like plot (plot2d3)
n = 0:15;
subplot(224);
plot2d3(n, sin(0.2 * %pi * n));
xtitle("Discrete Signal", "n", "x[n]");
