function mutation = MutationFactory (config)
    if config.mutation == "single"
        mutation = @(fenotype) singleMutation(config.sigma, fenotype);
    elseif config.mutation == "multiple"
        mutation = @(fenotype) multipleMutation(config.sigma,config.percentage,fenotype);
    elseif config.mutation == "total"
        mutation = @(fenotype) totalMutation(config.sigma, fenotype);
    else
        error("Invalid mutation name")
    end
end