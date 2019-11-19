function fenotypeFactory = FenotypeFactory (fenotype_name, genotypeFactory, len)
    if fenotype_name == "row"
        fenotypeFactory = @() rowFenotype(genotypeFactory, len);
    elseif fenotype_name == "col"
        fenotypeFactory = @() colFenotype(genotypeFactory, len);
    else
        error("Invalid fenotype name")
    end
end