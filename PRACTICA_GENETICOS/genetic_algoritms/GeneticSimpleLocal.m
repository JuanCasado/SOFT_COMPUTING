function [best_fenotype, best_fitness] = GeneticSimpleLocal (domain, evaluator, comparator, stopper, newGenotype, newFenotype, sigma)
    best_fenotype = newFenotype();
    best_fitness = [evaluator(best_fenotype)];
    while ~stopper()
        for i = 1:length(best_fenotype)
            fenotype = best_fenotype;
            fenotype(i) = fenotype(i) + sigma * randn(1, 1);
            fitness = evaluator(fenotype);
            if comparator(fitness, best_fitness)
                best_fitness = [best_fitness fitness];
                best_fenotype = fenotype;
            end
        end
    end
end