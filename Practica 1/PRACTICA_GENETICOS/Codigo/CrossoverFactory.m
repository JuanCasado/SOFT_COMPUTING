function crossover = CrossoverFactory (config)
    if config.crossover == "single"
        crossover = @(fenotype_1, fenotype_2) singleCrossover(fenotype_1, fenotype_2);
    elseif config.crossover == "double"
        crossover = @(fenotype_1, fenotype_2) doubleCrossover(fenotype_1, fenotype_2);
    else
        error("Invalid crossover name")
    end
end