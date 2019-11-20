
clear all
close all

population_len = 100;
fenotype_len = 30;
max_iterations = 100000;
min_distance = 1;
sigma = 0.009;
domain = "d3";
comparator = "min";
evaluator = "f3";
stopper = "iterations";
algorithm = "genetic-simple";

optimization = OptimizationFactory(algorithm, domain, evaluator, comparator, stopper, max_iterations, fenotype_len, population_len, min_distance, sigma);
[best, fit] = optimization();

plot(fit)
display(fit(end))


%%
% --------------
% genetic-simple
% --------------
% F1: 0.5
% F2: 4
% F3: 0.009
% --------------