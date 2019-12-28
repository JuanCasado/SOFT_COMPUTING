function executor (configurations)
    disp(strcat("Execution of : ", num2str(size(configurations,1)), " configurations"))
    for i = 1:size(configurations,1)
        optimization = OptimizationFactory(configurations(i));
        tic()
        [best, mean, best_fenotype] = execute(optimization, 30);
        time = toc();
        disp("-------------------------------------")
        disp(configurations(i))
        disp(strcat("Best fitness: ", num2str(best)))
        disp(strcat("Mean fitness: ", num2str(mean)))
        disp(strcat("Time: ", num2str(time)))
        disp("Best fenotype: ")
        for genotype = best_fenotype
            disp(num2str(genotype))
        end
        disp("-------------------------------------")
    end
end