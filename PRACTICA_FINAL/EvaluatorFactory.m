function evaluator = EvaluatorFactory (config, data, targets)
    if config.evaluator == "f1"
        evaluator = @(x) f1(x, config.fenotype_len);
    elseif config.evaluator == "f2"
        evaluator = @(x) f2(x, config.fenotype_len);
    elseif config.evaluator == "f3"
        evaluator = @(x) f3(x, config.fenotype_len);
    elseif config.evaluator == "f4"
        evaluator = @(pesos) funFinal(data, pesos, targets);
    else
        error("Invalid function name")
    end
end