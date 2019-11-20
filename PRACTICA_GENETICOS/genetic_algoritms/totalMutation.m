function fenotype_mutate = totalMutation(sigma, fenotype)
    fenotype_mutate = fenotype + sigma*randn(1, length(fenotype));
end