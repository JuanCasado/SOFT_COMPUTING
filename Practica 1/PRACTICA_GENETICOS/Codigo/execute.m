function [best, mean, best_fenotype] = execute(optimization, times)
    [fenotype, fitnesses] = optimization();
    mean = fitnesses(end)*(1/times);
    best = fitnesses(end);
    best_fenotype = fenotype;
    for i = 1:(times-1)
        [fenotype, fitnesses] = optimization();
        mean = mean + fitnesses(end)*(1/times);
        if fitnesses(end) < best
            best = fitnesses(end);
            best_fenotype = fenotype;
        end
    end
end