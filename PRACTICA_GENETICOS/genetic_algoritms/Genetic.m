function [best_fenotype, fitness, iterations] = Genetic (domain, evaluator, newGenotype, newFenotype, newPopulation, sigma)
    best_fenotype = newFenotype();
    fitness = evaluator(best_fenotype);
end