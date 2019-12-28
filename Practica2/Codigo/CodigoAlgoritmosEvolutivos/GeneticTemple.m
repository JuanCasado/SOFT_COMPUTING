function [best_fenotype, best_fitness] = GeneticTemple (evaluator, comparator, stopper, mutator, crosser, selector, newPopulation, sigma, lambda)
    population = newPopulation();
    getBest = @(population) bestInPopulation (evaluator, comparator, population);
    [best_fenotype, best_fitness] = getBest(population);
    sigma_inicial = sigma;
    current_iteration = 1;
    while ~stopper()
        for l = 1:lambda
            childs = zeros(size(population,1)*2,size(population,2));
            for i = 1:(size(population,1))
                if mod(i,2)==0
                    index1 = randi(size(population,1), 1);
                    index2 = randi(size(population,1), 1);
                    [child1, child2] = crosser(population(index1,:), population(index2,:));
                    childs(i,:) = child1;
                    childs(i+1,:) = child2;
                end
            end
            mutations = [];
            for i = 1:size(population,1)
                mutations = [mutations; mutator(population(i,:), sigma)];
            end
            population = selector ([population; childs; mutations]);
            [best_fenotype, new_fitness] = getBest(population);
            best_fitness = [best_fitness new_fitness];
        end
        %sigma = sigma*0.95;
        sigma = sigma_inicial/(0.5*current_iteration);
        current_iteration = current_iteration + 1;
    end
end