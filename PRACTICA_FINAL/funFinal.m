function y = funFinal(data,pesos,targets)
    acc = 0;
    ncol = size(data,2);
    for j=1:ncol
        acc = (targets(j)-predecirEnergia(data(:,j),pesos))^2;
    end
    y = acc/ncol;
end