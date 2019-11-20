
clear all
close all

config.population_len = 100;
config.lambda = 200;
config.sigma = 0.1;
config.fenotype_len = 30;
config.max_iterations = 500;
config.min_distance = 1;
config.percentage = 0.3;
config.domain = "d2";
config.comparator = "min";
config.evaluator = "f2";
config.stopper = "iterations";
config.mutation = "multiple";
config.crossover = "double";
config.selection = "ranking";
config.algorithm = "genetic-full";
%%

optimization = OptimizationFactory(config);
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
% genetic
% --------------
% F1: 0.5
% F2: 4
% F3: 0.05
% --------------
% harmoni
% --------------
% F1: 0.4
% F2: 4
% F3: 0.05
% --------------
% temple (sigma == temp)(lambda = 200 == iterations)
% --------------
% F1: 10
% F2: 50
% F3: 10
% --------------
% --------------
% genetic-full (ranking is better)
% --------------
% F1: 0.1
% F2: 0.01
% F3: 10
% --------------