function sorted_population = sortPopulation (evaluator, population)
    fitnesses = zeros(size(population,1),1);
    sorted_population = zeros(size(population));
    for i = 1:size(population, 1)
        fitnesses(i) = evaluator(population(i,:));
    end
    [~, indexes] = sort(fitnesses);
    for i = 1:size(indexes,1)
        sorted_population(i,:) = population(indexes(i),:);
    end
end