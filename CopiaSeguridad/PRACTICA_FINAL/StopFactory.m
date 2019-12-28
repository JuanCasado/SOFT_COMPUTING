function stopper = StopFactory (config)
    if config.stopper == "iterations"
        stopper = @() iterationStop(config.max_iterations);
    elseif config.stopper == "distance"
        stopper = @(new_fenotype) distanceStop(config.max_iterations, config.min_distance, config.new_fenotype);
    else
        error("Invalid stopper name")
    end
end