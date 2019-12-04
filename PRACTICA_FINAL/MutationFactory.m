function mutation = MutationFactory (config, domain)
    if config.mutation == "single"
        mutation = @(fenotype) singleMutation(config.sigma, domain, fenotype);
    elseif config.mutation == "multiple"
        mutation = @(fenotype) multipleMutation(config.sigma, domain,config.percentage,fenotype);
    elseif config.mutation == "total"
        mutation = @(fenotype) totalMutation(config.sigma, domain, fenotype);
    else
        error("Invalid mutation name")
    end
end