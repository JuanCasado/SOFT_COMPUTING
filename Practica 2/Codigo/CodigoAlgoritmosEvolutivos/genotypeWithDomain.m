function new_genotype = genotypeWithDomain(domain)
    range = (domain(2)-domain(1));
    new_genotype = rand(1,1)*range - range/2;
    if new_genotype > domain(2)
        new_genotype = domain(2);
    elseif new_genotype < domain(1)
        new_genotype = domain(1);
    end
end