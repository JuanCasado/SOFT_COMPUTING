function y = f2(x, len)
    acc = 0;
    for i = 1:len
       acc = acc + (-x(i) * sin(sqrt(abs(x(i)))));
    end
    y = acc;
end