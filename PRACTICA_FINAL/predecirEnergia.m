function y = predecirEnergia(data,pesos)
    acc = 0;
    bias = pesos(end)*5;
    for i = 1:2:length(data)
       acc = acc + ((pesos(i)*data(i))^pesos(i+1));
    end
    y = acc+bias;
end