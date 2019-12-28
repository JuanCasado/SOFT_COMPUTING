function [best_fenotype, fitness] = Temple (evaluator,comparator, stopper, newFenotype, sigma, lambda, domain)
    best_fenotype = newFenotype();
    best_fitness = evaluator(best_fenotype);
    fitness = best_fitness;
    sigma_inicial = sigma;
    current_iteration = 1;
	while ~stopper()
        for i = 1:lambda
            new_fenotype = totalMutation(sigma, domain, best_fenotype);
            new_fitness = evaluator(new_fenotype);
            if comparator(new_fitness, best_fitness)
                best_fenotype = new_fenotype;
                best_fitness = new_fitness;
                fitness = [fitness best_fitness];
            else
                if rand(1,1) < exp(-(abs(best_fitness - new_fitness))/sigma)
                    best_fenotype = new_fenotype;
                    best_fitness = new_fitness;
                    fitness = [fitness best_fitness];
                end
            end
        end
        %sigma = sigma*0.95;
        sigma = sigma_inicial/(0.5*current_iteration);
        current_iteration = current_iteration + 1;
    end
end