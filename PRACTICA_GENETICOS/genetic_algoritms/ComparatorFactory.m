function comparator = ComparatorFactory (config)
    if config.comparator == "min"
        comparator = minComparator;
    elseif config.comparator == "max"
        comparator = maxComparator;
    else
        error("Invalid comparator name")
    end
end