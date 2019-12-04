function stop = distanceStop(max_iterations, min_distance, fenotype)
    persistent iterations_stopper;
    if isempty(iterations_stopper)
        iterations_stopper = StopFactory("iterations", max_iterations);
    end
    persistent last_fenotype;
    if isempty(last_fenotype)
        last_fenotype = fenotype;
        stop = iterations_stopper();
    else
        distance = sum(abs(fenotype - last_fenotype));
        last_fenotype = fenotype;
        stop = iterations_stopper() || (distance < min_distance);
    end
end