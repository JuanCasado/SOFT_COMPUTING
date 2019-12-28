function [best_fenotype, best_fitness] = Genetic (evaluator, stopper, comparator, newPopulation, sigma, lambda)
    population = newPopulation();
    fenotype_length = size(population,2);
    getBest = @(population) bestInPopulation (evaluator, comparator, population);
    [best_fenotype, best_fitness] = getBest(population);
    while ~stopper()
        for i = 1:size(population,1)
            fenotype_padre = population(i,:);
            fitness_padre = evaluator(fenotype_padre);
            best_hijo = fenotype_padre;
            for j = 1:lambda
                fenotype_hijo = fenotype_padre + sigma*randn(1, fenotype_length);
                fitness_hijo = evaluator(fenotype_hijo);
                if comparator(fitness_hijo, fitness_padre)
                    fitness_padre = fitness_hijo;
                    best_hijo = fenotype_hijo;
                end
            end
            population(i,:) = best_hijo;
        end
        [best_fenotype_pop, best_fitness_pop] = getBest(population);
        if comparator(best_fitness_pop, best_fitness)
            best_fenotype = best_fenotype_pop;
            best_fitness = [best_fitness best_fitness_pop];
        end
    end
end