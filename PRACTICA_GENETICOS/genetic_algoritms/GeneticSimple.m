function [best_fenotype, best_fitness] = GeneticSimple (evaluator, comparator, stopper, newFenotype, sigma)
    best_fenotype = newFenotype();
    best_fitness = [evaluator(best_fenotype)];
    while ~stopper()
        fenotype = totalMutation(sigma, best_fenotype);
        fitness = evaluator(fenotype);
        if comparator(fitness, best_fitness)
            best_fitness = [best_fitness fitness];
            best_fenotype = fenotype;
        end
    end
end