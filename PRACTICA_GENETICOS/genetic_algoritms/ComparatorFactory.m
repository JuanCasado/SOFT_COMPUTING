function comparator = ComparatorFactory (comparator_name)
    if comparator_name == "min"
        comparator = minComparator;
    elseif comparator_name == "max"
        comparator = maxComparator;
    else
        error("Invalid comparator name")
    end
end