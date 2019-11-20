function new_population = rankingSelection (evaluator, population_len, population)
    population = sortPopulation(evaluator, population);
    new_population = population(1:population_len,:);
    new_population(randperm(size(new_population,2)),:);
end