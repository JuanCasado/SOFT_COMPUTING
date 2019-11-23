function new_population = tournamentSelection (evaluator, comparator, population_len, population)
    score = zeros(size(population,1),1);
    for i = 1:(size(population,1)*20)
        index1 = randi(size(population,1), 1);
        index2 = randi(size(population,1), 1);
        if comparator(evaluator(population(index1,:)),evaluator(population(index2,:)))
            score(index1) = score(index1)+1;
        else
            score(index2) = score(index2)+1;
        end
    end
    [~,indexes] = sort(score);
    new_population = zeros(population_len, size(population,2));
    for i = 0:(population_len-1)
        new_population(end-i,:) = population(indexes(end-i),:);
    end
end