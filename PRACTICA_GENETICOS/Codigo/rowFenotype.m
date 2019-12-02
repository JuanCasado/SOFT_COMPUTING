function fenotype = rowFenotype(genotypeFactory, len)
    fenotype = zeros(1,len);
    for i = 1:len
        fenotype(i) = genotypeFactory();
    end
end