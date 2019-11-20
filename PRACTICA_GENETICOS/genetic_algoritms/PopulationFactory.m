function population = PopulationFactory (fenotype_name, fenotypeFactory, config)
    if fenotype_name == "row"
        population = @() rowPopulation(fenotypeFactory, config.fenotype_len, config.population_len);
    elseif fenotype_name == "col"
        population = @() colPopulation(fenotypeFactory, config.fenotype_len, config.population_len);
    elseif fenotype_name == "list"
        population = @() listPopulation(fenotypeFactory, config.population_len);
    else
        error("Invalid population name")
    end
end