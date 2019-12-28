function y = predecirEnergia(data,pesos)
    acc = 0;
    bias = pesos(end)*5;
    for i = 1:length(data)
       acc = acc + (pesos(i*2-1)*data(i));
       %acc = acc + (pesos(i*2-1)*data(i)^pesos(i*2));
       %acc = acc + ((pesos(i*2-1)*data(i))^pesos(i*2));
    end
    y = acc+bias;
end