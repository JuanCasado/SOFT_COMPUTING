function fenotype_mutate = singleMutation(sigma, fenotype)
    index = randi(1,length(fenotype));
    fenotype_mutate = fenotype;
    fenotype_mutate(index) = fenotype_mutate(index) + sigma * randn(1,1);
end