function fenotype_mutate = totalMutation(sigma, domain, fenotype)
    fenotype_mutate = fenotype + sigma*randn(1, length(fenotype));
    for i = 1:length(fenotype_mutate)
        if(fenotype_mutate(i)>domain(2))
            fenotype_mutate(i) = domain(2);
        elseif (fenotype_mutate(i)<domain(1))
           fenotype_mutate(i) = domain(1);
        end
    end
end