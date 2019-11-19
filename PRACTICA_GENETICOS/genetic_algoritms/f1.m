function y = f1 (x, len)
    acc = 0;
    for i = 1:len
       acc = acc + pow2(x(i));
    end
    y = acc;
end