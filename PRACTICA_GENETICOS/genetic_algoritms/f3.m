function y = f3 (x, len)
    acc = 0;
    for i = 1:(len-1)
       acc = acc + 100*pow2((x(i+1) - pow2(x(i)))) + pow2(x(i)-1);
    end
    y = acc;
end