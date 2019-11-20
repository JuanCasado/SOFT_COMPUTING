function stopper = StopFactory (stop_name, max_iterations, min_distance)
    if stop_name == "iterations"
        stopper = @() iterationStop(max_iterations);
    elseif stop_name == "distance"
        stopper = @(new_fenotype) distanceStop(max_iterations, min_distance, new_fenotype);
    else
        error("Invalid stopper name")
    end
end