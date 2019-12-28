function fenotype_mutate = multipleMutation(sigma,domain, percentage,fenotype)
    length_fenotype = length(fenotype);
    n_changes = ceil(length_fenotype*percentage);
    index = randi(length_fenotype,1,n_changes);
    fenotype_mutate = fenotype;
    for i = index
        fenotype_mutate(i) = sigma * randn(1,1);
        if(fenotype_mutate(i)>domain(2))
            fenotype_mutate(i) = domain(2);
        elseif (fenotype_mutate(i)<domain(1))
           fenotype_mutate(i) = domain(1);
        end
    end
end