function stop = iterationStop (max_iterations)
    persistent iterations;
    if isempty(iterations)
        iterations = max_iterations;
    end
    stop = (iterations == 0);
    iterations = iterations - 1;
    if mod(iterations,100)==0
       disp(iterations)
    end
    if stop
        clear iterations;
    end
end