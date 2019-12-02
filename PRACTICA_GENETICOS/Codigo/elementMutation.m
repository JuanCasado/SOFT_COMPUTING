function genotype_mutate = elementMutation(sigma, genotype)
    genotype_mutate = genotype + sigma * randn(1,1);
end