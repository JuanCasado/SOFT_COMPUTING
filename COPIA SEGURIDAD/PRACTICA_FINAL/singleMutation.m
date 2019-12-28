function fenotype_mutate = singleMutation(sigma, domain, fenotype)
    index = randi(1,length(fenotype));
    fenotype_mutate = fenotype;    
    fenotype_mutate(index) = fenotype_mutate(index) + sigma * randn(1,1);
    if(fenotype_mutate(index)>domain(2))
        fenotype_mutate(index) = domain(2);
    elseif (fenotype_mutate(index)<domain(1))
       fenotype_mutate(index) = domain(1);
    end
end