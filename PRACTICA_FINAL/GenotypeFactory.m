function genotypeFactory = GenotypeFactory (domain)
    range = (domain(2)-domain(1));
    genotypeFactory = @() rand(1,1)*range - range/2;
end