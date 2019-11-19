function y = f3 (x)
    y = sum(100*pow2(x(2:end)-pow2(x(1:end-1)))+pow2(x(1:end-1)-1));
end