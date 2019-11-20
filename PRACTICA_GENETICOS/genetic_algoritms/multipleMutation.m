function fenotype_mutate = multipleMutation(sigma, percentage,fenotype)
    length_fenotype = length(fenotype);
    n_changes = int32(length_fenotype*percentage);
    index = randi(length_fenotype,1,n_changes);
    fenotype_mutate = fenotype;
    for i = index
        fenotype_mutate(i) = sigma * randn(1,1);
    end
end