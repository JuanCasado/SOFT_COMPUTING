function population = PopulationFactory (fenotype_name, fenotypeFactory, fenotype_len, population_len)
    if fenotype_name == "row"
        population = @() rowPopulation(fenotypeFactory, fenotype_len, population_len);
    elseif fenotype_name == "col"
        population = @() colPopulation(fenotypeFactory, fenotype_len, population_len);
    else
        error("Invalid population name")
    end
end