function fenotype = colFenotype(genotypeFactory, len)
    fenotype = zeros(len, 1);
    for i = 1:len
        fenotype(i) = genotypeFactory();
    end
end