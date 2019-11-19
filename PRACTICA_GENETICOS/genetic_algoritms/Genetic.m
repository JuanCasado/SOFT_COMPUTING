function [best_fenotype, fitness] = Genetic (domain, evaluator, newGenotype, newFenotype, newPopulation)
    best_fenotype = newFenotype();
    fitness = evaluator(best_fenotype);
end