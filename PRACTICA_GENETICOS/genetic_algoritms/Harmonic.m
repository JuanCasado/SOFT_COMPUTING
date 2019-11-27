function [best_fenotype, best_fitness] = Harmonic (evaluator, comparator, stopper, newGenotype, newPopulation, mutator)
    population = newPopulation();
    population = sortPopulation(evaluator, population);
    worst_fitness = evaluator(population(end,:));
    getBest = @(population) bestInPopulation (evaluator, comparator, population);
    [best_fenotype, best_fitness] = getBest(population);
    while ~stopper()
        new_fenotype = zeros(1, size(population,2));
        for i = 1:size(population, 2)
            if randi(100, 1) > 20
                row_index = randi(size(population, 1),1);
                new_fenotype(i) = population(row_index, i);
            else
                new_fenotype(i) = newGenotype();
            end
        end
        if randi(100,1) < 30
            new_fenotype = mutator(new_fenotype);
        end
        new_fitness = evaluator(new_fenotype);
        if comparator(new_fitness, worst_fitness)
            population = sortPopulation(evaluator, population);
            population(end,:) = new_fenotype;
            worst_fitness = evaluator(population(end-1,:));
            population = population(randperm(size(population,1)),:);
        end
        [best_fenotype, best_fitness_pop] = getBest(population);
        best_fitness = [best_fitness best_fitness_pop];
    end
end