function y = f3 (x, len)
    acc = 0;
    for i = 1:(len-1)
       acc = acc + 100*((x(i+1) - x(i)^2))^2 + (x(i)-1)^2;
    end
    y = acc;
end