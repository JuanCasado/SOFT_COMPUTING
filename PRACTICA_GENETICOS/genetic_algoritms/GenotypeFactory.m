function genotypeFactory = GenotypeFactory (domain)
    genotypeFactory = @() randi(domain);
end