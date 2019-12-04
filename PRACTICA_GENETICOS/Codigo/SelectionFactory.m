function selection = SelectionFactory (config, evaluator, comparator)
    if config.selection == "ranking"
        selection = @(population) rankingSelection (evaluator, config.population_len, population);
    elseif config.selection == "tournament"
        selection = @(population) tournamentSelection(evaluator, comparator, config.population_len, population);
    else
        error("Invalid selection name")
    end
end