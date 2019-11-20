function new_population = tournamentSelection (evaluator, comparator, population_len, population)
    score = zeros(size(population,1),1);
    for i = 1:(size(population,1)*20)
        index1 = randi(size(population,1), 1);
        index2 = randi(size(population,1), 1);
        if comparator(evaluator(population(index1,:)),evaluator(population(index2,:)))
            score(index1) = score(index1)+1;
        end
    end
    [~,indexes] = sort(score);
    new_population = zeros(population_len, size(population,2));
    for i = 1:population_len
        new_population(i,:) = population(indexes(i),:);
    end
end