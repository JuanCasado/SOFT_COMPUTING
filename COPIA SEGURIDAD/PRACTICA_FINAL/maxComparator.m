function comparator = maxComparator ()
    comparator = @(fenotype1, fenotype2) fenotype1 > fenotype2;
end