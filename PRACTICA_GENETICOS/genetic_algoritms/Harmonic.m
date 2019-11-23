function [best_fenotype, best_fitness] = Harmonic (evaluator, comparator, stopper, newGenotype, newPopulation, sigma)
    population = newPopulation();
    population = sortPopulation(evaluator, population);
    worst_fitness = evaluator(population(end,:));
    getBest = @(population) bestInPopulation (evaluator, comparator, population);
    [best_fenotype, best_fitness] = getBest(population);
    while ~stopper()
        new_fenotype = zeros(1, size(population,2));
        for i = 1:size(population, 2)
            if randi(100, 1) > 12
                col_index = randi(size(population, 1),1);
                new_fenotype(i) = population(col_index, i);
            else
                new_fenotype(i) = newGenotype();
            end
            if randi(3,1) == 1
                new_fenotype(i) = elementMutation(sigma, new_fenotype(i));
            end
        end        
        new_fitness = evaluator(new_fenotype);
        if comparator(new_fitness, worst_fitness)
            population = sortPopulation(evaluator, population);
            population(end,:) = new_fenotype;
            worst_fitness = evaluator(population(end-1,:));
            population(randperm(size(population,1)),:);
        end
        [best_fenotype, best_fitness_pop] = getBest(population);
        best_fitness = [best_fitness best_fitness_pop];
    end
end