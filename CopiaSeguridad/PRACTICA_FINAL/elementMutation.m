function genotype_mutate = elementMutation(sigma, domain, genotype)
    genotype_mutate = genotype + sigma * randn(1,1);
    if(genotype_mutate>domain(2))
        genotype_mutate = domain(2);
    elseif (genotype_mutate<domain(1))
       genotype_mutate = domain(1);
    end
end