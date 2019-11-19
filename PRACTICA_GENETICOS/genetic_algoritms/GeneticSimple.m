function [best_fenotype, fitness] = GeneticSimple (domain, evaluator, newGenotype, newFenotype)
    best_fenotype = newFenotype();
    fitness = evaluator(best_fenotype);
end