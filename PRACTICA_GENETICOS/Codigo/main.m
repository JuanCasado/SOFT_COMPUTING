
%clc
clear all
close all

config_genetic_full_ranking1.population_len = 200;
config_genetic_full_ranking1.sigma = 0.1;
config_genetic_full_ranking1.fenotype_len = 30;
config_genetic_full_ranking1.max_iterations = 300;
config_genetic_full_ranking1.percentage = 0.3;
config_genetic_full_ranking1.domain = "d1";
config_genetic_full_ranking1.comparator = "min";
config_genetic_full_ranking1.evaluator = "f1";
config_genetic_full_ranking1.stopper = "iterations";
config_genetic_full_ranking1.mutation = "multiple";
config_genetic_full_ranking1.crossover = "double";
config_genetic_full_ranking1.selection = "ranking";
config_genetic_full_ranking1.algorithm = "genetic-full";
config_genetic_full_ranking1.lambda = 0;

config_genetic_full_ranking2.population_len = 200;
config_genetic_full_ranking2.sigma = 0.01;
config_genetic_full_ranking2.fenotype_len = 30;
config_genetic_full_ranking2.max_iterations = 300;
config_genetic_full_ranking2.percentage = 0.3;
config_genetic_full_ranking2.domain = "d2";
config_genetic_full_ranking2.comparator = "min";
config_genetic_full_ranking2.evaluator = "f2";
config_genetic_full_ranking2.stopper = "iterations";
config_genetic_full_ranking2.mutation = "multiple";
config_genetic_full_ranking2.crossover = "double";
config_genetic_full_ranking2.selection = "ranking";
config_genetic_full_ranking2.algorithm = "genetic-full";
config_genetic_full_ranking2.lambda = 0;

config_genetic_full_ranking3.population_len = 200;
config_genetic_full_ranking3.sigma = 0.01;
config_genetic_full_ranking3.fenotype_len = 30;
config_genetic_full_ranking3.max_iterations = 300;
config_genetic_full_ranking3.percentage = 0.3;
config_genetic_full_ranking3.domain = "d3";
config_genetic_full_ranking3.comparator = "min";
config_genetic_full_ranking3.evaluator = "f3";
config_genetic_full_ranking3.stopper = "iterations";
config_genetic_full_ranking3.mutation = "multiple";
config_genetic_full_ranking3.crossover = "double";
config_genetic_full_ranking3.selection = "ranking";
config_genetic_full_ranking3.algorithm = "genetic-full";
config_genetic_full_ranking3.lambda = 0;

config_genetic_full_tournament1.population_len = 200;
config_genetic_full_tournament1.sigma = 0.1;
config_genetic_full_tournament1.fenotype_len = 30;
config_genetic_full_tournament1.max_iterations = 300;
config_genetic_full_tournament1.percentage = 0.3;
config_genetic_full_tournament1.domain = "d1";
config_genetic_full_tournament1.comparator = "min";
config_genetic_full_tournament1.evaluator = "f1";
config_genetic_full_tournament1.stopper = "iterations";
config_genetic_full_tournament1.mutation = "multiple";
config_genetic_full_tournament1.crossover = "double";
config_genetic_full_tournament1.selection = "tournament";
config_genetic_full_tournament1.algorithm = "genetic-full";
config_genetic_full_tournament1.lambda = 0;


config_genetic_full_tournament2.population_len = 200;
config_genetic_full_tournament2.sigma = 0.01;
config_genetic_full_tournament2.fenotype_len = 30;
config_genetic_full_tournament2.max_iterations = 300;
config_genetic_full_tournament2.percentage = 0.3;
config_genetic_full_tournament2.domain = "d2";
config_genetic_full_tournament2.comparator = "min";
config_genetic_full_tournament2.evaluator = "f2";
config_genetic_full_tournament2.stopper = "iterations";
config_genetic_full_tournament2.mutation = "multiple";
config_genetic_full_tournament2.crossover = "double";
config_genetic_full_tournament2.selection = "tournament";
config_genetic_full_tournament2.algorithm = "genetic-full";
config_genetic_full_tournament2.lambda = 0;

config_genetic_full_tournament3.population_len = 200;
config_genetic_full_tournament3.sigma = 0.01;
config_genetic_full_tournament3.fenotype_len = 30;
config_genetic_full_tournament3.max_iterations = 300;
config_genetic_full_tournament3.percentage = 0.3;
config_genetic_full_tournament3.domain = "d3";
config_genetic_full_tournament3.comparator = "min";
config_genetic_full_tournament3.evaluator = "f3";
config_genetic_full_tournament3.stopper = "iterations";
config_genetic_full_tournament3.mutation = "multiple";
config_genetic_full_tournament3.crossover = "double";
config_genetic_full_tournament3.selection = "tournament";
config_genetic_full_tournament3.algorithm = "genetic-full";
config_genetic_full_tournament3.lambda = 0;

config_genetic_simple1.sigma = 0.5;
config_genetic_simple1.fenotype_len = 30;
config_genetic_simple1.max_iterations = 100000;
config_genetic_simple1.domain = "d1";
config_genetic_simple1.comparator = "min";
config_genetic_simple1.evaluator = "f1";
config_genetic_simple1.stopper = "iterations";
config_genetic_simple1.algorithm = "genetic-simple";
config_genetic_simple1.population_len = 0;
config_genetic_simple1.lambda = 0;
config_genetic_simple1.percentage = 0;
config_genetic_simple1.mutation = "";
config_genetic_simple1.crossover = "";
config_genetic_simple1.selection = "";

config_genetic_simple2.sigma = 4;
config_genetic_simple2.fenotype_len = 30;
config_genetic_simple2.max_iterations = 100000;
config_genetic_simple2.domain = "d2";
config_genetic_simple2.comparator = "min";
config_genetic_simple2.evaluator = "f2";
config_genetic_simple2.stopper = "iterations";
config_genetic_simple2.algorithm = "genetic-simple";
config_genetic_simple2.population_len = 0;
config_genetic_simple2.lambda = 0;
config_genetic_simple2.percentage = 0;
config_genetic_simple2.mutation = "";
config_genetic_simple2.crossover = "";
config_genetic_simple2.selection = "";

config_genetic_simple3.sigma = 0.009;
config_genetic_simple3.fenotype_len = 30;
config_genetic_simple3.max_iterations = 100000;
config_genetic_simple3.domain = "d3";
config_genetic_simple3.comparator = "min";
config_genetic_simple3.evaluator = "f3";
config_genetic_simple3.stopper = "iterations";
config_genetic_simple3.algorithm = "genetic-simple";
config_genetic_simple3.population_len = 0;
config_genetic_simple3.lambda = 0;
config_genetic_simple3.percentage = 0;
config_genetic_simple3.mutation = "";
config_genetic_simple3.crossover = "";
config_genetic_simple3.selection = "";

config_genetic_simple_local1.sigma = 0.4;
config_genetic_simple_local1.fenotype_len = 30;
config_genetic_simple_local1.max_iterations = 100000;
config_genetic_simple_local1.domain = "d1";
config_genetic_simple_local1.comparator = "min";
config_genetic_simple_local1.evaluator = "f1";
config_genetic_simple_local1.stopper = "iterations";
config_genetic_simple_local1.algorithm = "genetic-simple-local";
config_genetic_simple_local1.population_len = 0;
config_genetic_simple_local1.lambda = 0;
config_genetic_simple_local1.percentage = 0;
config_genetic_simple_local1.mutation = "";
config_genetic_simple_local1.crossover = "";
config_genetic_simple_local1.selection = "";

config_genetic_simple_local2.sigma = 4;
config_genetic_simple_local2.fenotype_len = 30;
config_genetic_simple_local2.max_iterations = 100000;
config_genetic_simple_local2.domain = "d2";
config_genetic_simple_local2.comparator = "min";
config_genetic_simple_local2.evaluator = "f2";
config_genetic_simple_local2.stopper = "iterations";
config_genetic_simple_local2.algorithm = "genetic-simple-local";
config_genetic_simple_local2.population_len = 0;
config_genetic_simple_local2.lambda = 0;
config_genetic_simple_local2.percentage = 0;
config_genetic_simple_local2.mutation = "";
config_genetic_simple_local2.crossover = "";
config_genetic_simple_local2.selection = "";

config_genetic_simple_local3.sigma = 0.009;
config_genetic_simple_local3.fenotype_len = 30;
config_genetic_simple_local3.max_iterations = 50000;
config_genetic_simple_local3.domain = "d3";
config_genetic_simple_local3.comparator = "min";
config_genetic_simple_local3.evaluator = "f3";
config_genetic_simple_local3.stopper = "iterations";
config_genetic_simple_local3.algorithm = "genetic-simple-local";
config_genetic_simple_local3.population_len = 0;
config_genetic_simple_local3.lambda = 0;
config_genetic_simple_local3.percentage = 0;
config_genetic_simple_local3.mutation = "";
config_genetic_simple_local3.crossover = "";
config_genetic_simple_local3.selection = "";

config_genetic1.population_len = 100;
config_genetic1.sigma = 0.5;
config_genetic1.lambda = 5;
config_genetic1.fenotype_len = 30;
config_genetic1.max_iterations = 20000;
config_genetic1.domain = "d1";
config_genetic1.comparator = "min";
config_genetic1.evaluator = "f1";
config_genetic1.stopper = "iterations";
config_genetic1.algorithm = "genetic";
config_genetic1.percentage = 0;
config_genetic1.mutation = "";
config_genetic1.crossover = "";
config_genetic1.selection = "";

config_genetic2.population_len = 100;
config_genetic2.sigma = 4;
config_genetic2.lambda = 5;
config_genetic2.fenotype_len = 30;
config_genetic2.max_iterations = 20000;
config_genetic2.domain = "d2";
config_genetic2.comparator = "min";
config_genetic2.evaluator = "f2";
config_genetic2.stopper = "iterations";
config_genetic2.algorithm = "genetic";
config_genetic2.percentage = 0;
config_genetic2.mutation = "";
config_genetic2.crossover = "";
config_genetic2.selection = "";

config_genetic3.population_len = 100;
config_genetic3.sigma = 0.05;
config_genetic3.lambda = 5;
config_genetic3.fenotype_len = 30;
config_genetic3.max_iterations = 20000;
config_genetic3.domain = "d3";
config_genetic3.comparator = "min";
config_genetic3.evaluator = "f3";
config_genetic3.stopper = "iterations";
config_genetic3.algorithm = "genetic";
config_genetic3.percentage = 0;
config_genetic3.mutation = "";
config_genetic3.crossover = "";
config_genetic3.selection = "";

config_harmonic1.population_len = 15;
config_harmonic1.sigma = 0.5;
config_harmonic1.fenotype_len = 30;
config_harmonic1.max_iterations = 1000000;
config_harmonic1.domain = "d1";
config_harmonic1.comparator = "min";
config_harmonic1.evaluator = "f1";
config_harmonic1.stopper = "iterations";
config_harmonic1.mutation = "multiple";
config_harmonic1.algorithm = "harmonic";
config_harmonic1.lambda = 0;
config_harmonic1.percentage = 0;
config_harmonic1.crossover = "";
config_harmonic1.selection = "";

config_harmonic2.population_len = 100;
config_harmonic2.sigma = 4;
config_harmonic2.fenotype_len = 30;
config_harmonic2.max_iterations = 50000;
config_harmonic2.domain = "d2";
config_harmonic2.comparator = "min";
config_harmonic2.evaluator = "f2";
config_harmonic2.stopper = "iterations";
config_harmonic2.mutation = "multiple";
config_harmonic2.algorithm = "harmonic";
config_harmonic2.lambda = 0;
config_harmonic2.percentage = 0;
config_harmonic2.crossover = "";
config_harmonic2.selection = "";

config_harmonic3.population_len = 15;
config_harmonic3.sigma = 0.2;
config_harmonic3.fenotype_len = 30;
config_harmonic3.max_iterations = 1000000;
config_harmonic3.domain = "d3";
config_harmonic3.comparator = "min";
config_harmonic3.evaluator = "f3";
config_harmonic3.stopper = "iterations";
config_harmonic3.mutation = "multiple";
config_harmonic3.algorithm = "harmonic";
config_harmonic3.lambda = 0;
config_harmonic3.percentage = 0;
config_harmonic3.crossover = "";
config_harmonic3.selection = "";

config_temple1.sigma = 10;
config_temple1.lambda = 200;
config_temple1.fenotype_len = 30;
config_temple1.max_iterations = 5000;
config_temple1.domain = "d1";
config_temple1.comparator = "min";
config_temple1.evaluator = "f1";
config_temple1.stopper = "iterations";
config_temple1.algorithm = "temple";
config_temple1.population_len = 0;
config_temple1.percentage = 0;
config_temple1.mutation = "";
config_temple1.crossover = "";
config_temple1.selection = "";

config_temple2.sigma = 100;
config_temple2.lambda = 200;
config_temple2.fenotype_len = 30;
config_temple2.max_iterations = 5000;
config_temple2.domain = "d2";
config_temple2.comparator = "min";
config_temple2.evaluator = "f2";
config_temple2.stopper = "iterations";
config_temple2.algorithm = "temple";
config_temple2.population_len = 0;
config_temple2.percentage = 0;
config_temple2.mutation = "";
config_temple2.crossover = "";
config_temple2.selection = "";

config_temple3.sigma = 10;
config_temple3.lambda = 200;
config_temple3.fenotype_len = 30;
config_temple3.max_iterations = 5000;
config_temple3.domain = "d3";
config_temple3.comparator = "min";
config_temple3.evaluator = "f3";
config_temple3.stopper = "iterations";
config_temple3.algorithm = "temple";
config_temple3.population_len = 0;
config_temple3.percentage = 0;
config_temple3.mutation = "";
config_temple3.crossover = "";
config_temple3.selection = "";


%%
configurations = [config_genetic_full_ranking1;
                  config_genetic_full_ranking2;
                  config_genetic_full_ranking3;
                  config_genetic_full_tournament1;
                  config_genetic_full_tournament2;
                  config_genetic_full_tournament3;
                  config_genetic_simple1;
                  config_genetic_simple2;
                  config_genetic_simple3;
                  config_genetic_simple_local1;
                  config_genetic_simple_local2;
                  config_genetic_simple_local3;
                  config_genetic1;
                  config_genetic2;
                  config_genetic3;
                  config_harmonic1;
                  config_harmonic2;
                  config_harmonic3;
                  config_temple1;
                  config_temple2;
                  config_temple3];
executor(configurations)
%%
optimization = OptimizationFactory(config_harmonic3);
[best, fit] = optimization();
disp(strcat("Fitness: ", num2str(fit(end))))
%disp("---------------------------")
figure; plot(fit)
%%
optimization = OptimizationFactory(config_harmonic1);
[best, mean, best_fenotype] = execute(optimization, 30);
disp(strcat("Mejor fitness: ", num2str(best)))
disp(strcat("Media fitness: ", num2str(mean)))
disp(strcat("Mejor individuo: ", num2str(best_fenotype)))
disp("---------------------------")
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
% harmonic
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
% F3: 0.01
% --------------