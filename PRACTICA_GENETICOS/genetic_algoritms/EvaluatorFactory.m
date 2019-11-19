function evaluator = EvaluatorFactory (evaluator_name, len)
    if evaluator_name == "f1"
        evaluator = @(x) f1(x, len);
    elseif evaluator_name == "f2"
        evaluator = @(x) f2(x, len);
    elseif evaluator_name == "f3"
        evaluator = @(x) f3(x, len);
    else
        error("Invalid function name")
    end
end