
population_len = 100;
fenotype_len = 30;
domain = Domain ("d1");
evaluator = EvaluatorFactory("f1", fenotype_len);
newGenotype = GenotypeFactory(domain);
newFenotype = FenotypeFactory("row", newGenotype, fenotype_len);
newPopulation = PopulationFactory("col", newFenotype, fenotype_len, population_len);