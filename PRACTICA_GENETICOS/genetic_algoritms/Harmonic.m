function [best_fenotype, fitness, iterations] = Harmonic (domain, evaluator, newGenotype, newFenotype, newPopulation)
    best_fenotype = newFenotype();
    fitness = evaluator(best_fenotype);
end