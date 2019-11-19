function optimization = OptimizationFactory (domain_name, evaluator_name, optimization_name, ...
                                             fenotype_len, population_len)
    domain = Domain (domain_name);
    evaluator = EvaluatorFactory(evaluator_name, fenotype_len);
    newGenotype = GenotypeFactory(domain);
    newFenotype = FenotypeFactory("col", newGenotype, fenotype_len);
    newPopulation = PopulationFactory("row", newFenotype, fenotype_len, population_len);
    if optimization_name == "genetic-simple"
        optimization = @() GeneticSimple(domain, evaluator, newGenotype, newFenotype);
    elseif optimization_name == "genetic"
        optimization = @() Genetic(domain, evaluator, newGenotype, newFenotype, newPopulation);
    elseif optimization_name == "temple"
        optimization = @() Temple(domain, evaluator, newGenotype, newFenotype, newPopulation);
    elseif optimization_name == "harmonic"
        optimization = @() Harmonic(domain, evaluator, newGenotype, newFenotype, newPopulation);
    else
        error("Invalid optimization name")
    end
end