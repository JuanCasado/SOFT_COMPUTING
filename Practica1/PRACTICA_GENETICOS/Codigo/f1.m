function y = f1 (x, len)
    acc = 0;
    for i = 1:len
       acc = acc + x(i)^2;
    end
    y = acc;
end