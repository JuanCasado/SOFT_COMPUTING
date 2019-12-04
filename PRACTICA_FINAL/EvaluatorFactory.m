function evaluator = EvaluatorFactory (config)
    if config.evaluator == "f1"
        evaluator = @(x) f1(x, config.fenotype_len);
    elseif config.evaluator == "f2"
        evaluator = @(x) f2(x, config.fenotype_len);
    elseif config.evaluator == "f3"
        evaluator = @(x) f3(x, config.fenotype_len);
    else
        error("Invalid function name")
    end
end