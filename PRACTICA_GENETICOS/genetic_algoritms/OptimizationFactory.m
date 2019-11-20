function optimization = OptimizationFactory (optimization_name, domain_name, evaluator_name, ...
                                             comparator_name, stopper_name, max_iterations, ...
                                             fenotype_len, population_len, min_distance, sigma)
    domain = Domain (domain_name);
    evaluator = EvaluatorFactory(evaluator_name, fenotype_len);
    comparator = ComparatorFactory(comparator_name);
    stopper = StopFactory(stopper_name, max_iterations, min_distance);
    newGenotype = GenotypeFactory(domain);
    newFenotype = FenotypeFactory("row", newGenotype, fenotype_len);
    newPopulation = PopulationFactory("col", newFenotype, fenotype_len, population_len);
    if optimization_name == "genetic-simple"
        optimization = @() GeneticSimple(domain, evaluator, comparator, stopper, newGenotype, newFenotype, sigma);
    elseif optimization_name == "genetic-simple-local"
        optimization = @() GeneticSimpleLocal(domain, evaluator, comparator, stopper, newGenotype, newFenotype, sigma);
    elseif optimization_name == "genetic"
        optimization = @() Genetic(domain, evaluator, comparator, stopper, newGenotype, newFenotype, newPopulation, sigma);
    elseif optimization_name == "temple"
        optimization = @() Temple(domain, evaluator, comparator, stopper, newGenotype, newFenotype, newPopulation);
    elseif optimization_name == "harmonic"
        optimization = @() Harmonic(domain, evaluator, comparator, stopper, newGenotype, newFenotype, newPopulation);
    else
        error("Invalid optimization name")
    end
end