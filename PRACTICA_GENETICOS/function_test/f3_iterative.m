function y = f3_iterative (x)
    acc = 0;
    for i = 1:29
       acc = acc + 100*pow2((x(i+1) - pow2(x(i)))) + pow2(x(i)-1);
    end
    y = acc;
end