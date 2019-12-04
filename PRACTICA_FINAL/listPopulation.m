function population = listPopulation(fenotypeFactory, population_len)
    population = cell (1,population_len);
    for i = 1:population_len
        population(i) = {fenotypeFactory()};
    end
end