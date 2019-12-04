function [best_fenotype, best_fitness] = FullGenetic (evaluator, comparator, stopper, mutator, crosser, selector, newPopulation)
    population = newPopulation();
    getBest = @(population) bestInPopulation (evaluator, comparator, population);
    [best_fenotype, best_fitness] = getBest(population);
    while ~stopper()
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
            if randi(100, 1) <= 5
                mutations = [mutations; mutator(population(i,:))];
            end
        end
        population = selector ([population; childs; mutations]);
        [best_fenotype, new_fitness] = getBest(population);
        best_fitness = [best_fitness new_fitness];
    end
end