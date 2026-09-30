function y  = x_a(t)
    y = 3*sin(100 * %pi * t)
endfunction
x = linspace(0, 0.1, 50)
plot(x, x_a)

function y = x_b(n)
    y = 3*sin((%pi / 3) * n )
endfunction    
scf()
for n= 1 :30
   u(n) = x_b(n);
end
plot(u,"*r")

scf()
function y = x_q(n)
    y =  floor(x_b(n) / 0.1) * 0.1
endfunction
for n = 1:30
    g(n) = x_q(n)
end
plot(g, "*b")
