function [best_fenotype, best_fitness] = GeneticSimpleLocal (evaluator, comparator, stopper, newFenotype, sigma)
    best_fenotype = newFenotype();
    best_fitness = [evaluator(best_fenotype)];
    while ~stopper()
        for i = 1:length(best_fenotype)
            fenotype = best_fenotype;
            fenotype(i) = elementMutation(sigma, fenotype(i));
            fitness = evaluator(fenotype);
            if comparator(fitness, best_fitness)
                best_fitness = [best_fitness fitness];
                best_fenotype = fenotype;
            end
        end
    end
end