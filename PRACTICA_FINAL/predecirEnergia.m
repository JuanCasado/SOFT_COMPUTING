function y = predecirEnergia(data,pesos)
    acc = 0;
    mprima = (length(pesos)-1)/2;
    bias = pesos(end)*5;
    
    for i = 1:length(data)
       acc = acc + pesos(i)*(data(i)^pesos(i+mprima));
    end
    y = acc+bias;
end