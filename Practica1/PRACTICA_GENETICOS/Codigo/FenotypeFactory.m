function fenotypeFactory = FenotypeFactory (fenotype_name, genotypeFactory, config)
    if fenotype_name == "row"
        fenotypeFactory = @() rowFenotype(genotypeFactory, config.fenotype_len);
    elseif fenotype_name == "col"
        fenotypeFactory = @() colFenotype(genotypeFactory, config.fenotype_len);
    else
        error("Invalid fenotype name")
    end
end