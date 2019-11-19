function y = f1_iterative (x)
    acc = 0;
    for i = 1:30
       acc = acc + pow2(x(i));
    end
    y = acc;
end