function y = f2_iterative (x)
    acc = 0;
    for i = 1:30
       acc = acc + (-x(i) * sin(sqrt(abs(x(i)))));
    end
    y = acc;
end