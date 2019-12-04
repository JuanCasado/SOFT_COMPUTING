function mutation = MutationFactory (config)
    if config.mutation == "single"
        mutation = @(fenotype) singleMutation(config.sigma, config.domain, fenotype);
    elseif config.mutation == "multiple"
        mutation = @(fenotype) multipleMutation(config.sigma, config.domain,config.percentage,fenotype);
    elseif config.mutation == "total"
        mutation = @(fenotype) totalMutation(config.sigma, config.domain, fenotype);
    else
        error("Invalid mutation name")
    end
end