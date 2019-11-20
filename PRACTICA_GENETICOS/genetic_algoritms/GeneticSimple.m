function [best_fenotype, best_fitness] = GeneticSimple (domain, evaluator, comparator, stopper, newGenotype, newFenotype, sigma)
    best_fenotype = newFenotype();
    best_fitness = [evaluator(best_fenotype)];
    while ~stopper()
        fenotype = best_fenotype + sigma*randn(1, length(best_fenotype));
        fitness = evaluator(fenotype);
        if comparator(fitness, best_fitness)
            best_fitness = [best_fitness fitness];
            best_fenotype = fenotype;
        end
    end
end