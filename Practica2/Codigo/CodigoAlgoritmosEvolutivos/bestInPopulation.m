function [best_fenotype, best_fitness] = bestInPopulation (evaluator, comparator, population)
    best_fenotype = population(1, :);
    best_fitness = evaluator(best_fenotype);
    for i = 2:size(population, 1)
        fenotype = population(i, :);
        fitness = evaluator(fenotype);
        if comparator(fitness, best_fitness)
            best_fenotype = fenotype;
            best_fitness = fitness;
        end
    end
end