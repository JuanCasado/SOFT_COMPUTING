function population = rowPopulation(fenotypeFactory, fenotype_len, population_len)
    population = zeros (fenotype_len, population_len);
    for i = 1:population_len
        population(:,i) = fenotypeFactory();
    end
end