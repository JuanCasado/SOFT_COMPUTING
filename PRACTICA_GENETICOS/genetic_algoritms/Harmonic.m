function [best_fenotype, fitness] = Harmonic (domain, evaluator, newGenotype, newFenotype, newPopulation)
    best_fenotype = newFenotype();
    fitness = evaluator(best_fenotype);
end