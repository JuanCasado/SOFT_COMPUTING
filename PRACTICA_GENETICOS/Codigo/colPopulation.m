function population = colPopulation(fenotypeFactory, fenotype_len, population_len)
    population = zeros (population_len, fenotype_len);
    for i = 1:population_len
        population(i,:) = fenotypeFactory();
    end
end