function optimization = OptimizationFactory (config)
    domain = Domain (config);
    evaluator = EvaluatorFactory(config);
    comparator = ComparatorFactory(config);
    stopper = StopFactory(config);
    newGenotype = GenotypeFactory(domain);
    newFenotype = FenotypeFactory("row", newGenotype, config);
    newPopulation = PopulationFactory("col", newFenotype, config);
    sigma = config.sigma;
    lambda = config.lambda;
    if config.algorithm == "genetic-simple"
        optimization = @() GeneticSimple(evaluator, comparator, stopper, newFenotype, sigma);
    elseif config.algorithm  == "genetic-simple-local"
        optimization = @() GeneticSimpleLocal(evaluator, comparator, stopper, newFenotype, sigma);
    elseif config.algorithm  == "genetic"
        optimization = @() Genetic(evaluator, stopper, comparator, newPopulation, sigma, lambda);
    elseif config.algorithm  == "genetic-full"
        mutator = MutationFactory(config);
        crosser = CrossoverFactory(config);
        selector = SelectionFactory(config, evaluator, comparator);
        optimization = @() FullGenetic(evaluator, comparator, stopper, mutator, crosser, selector, newPopulation);
    elseif config.algorithm  == "temple"
        optimization = @() Temple(evaluator, comparator, stopper, newFenotype, sigma, lambda);
    elseif config.algorithm  == "harmonic"
        optimization = @() Harmonic(evaluator, comparator, stopper, newGenotype, newPopulation);
    else
        error("Invalid optimization name")
    end
end