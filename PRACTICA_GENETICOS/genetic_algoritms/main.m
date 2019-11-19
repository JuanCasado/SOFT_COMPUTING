
population_len = 100;
fenotype_len = 30;
domain = Domain ("d1");
evaluator = EvaluatorFactory("f1", fenotype_len);
newGenotype = GenotypeFactory(domain);
newFenotype = FenotypeFactory("col", newGenotype, fenotype_len);
newPopulation = PopulationFactory("row", newFenotype, fenotype_len, population_len);

%%
optimization = OptimizationFactory("d1", "f1", "genetic",fenotype_len, population_len);
[best, fit] = optimization();