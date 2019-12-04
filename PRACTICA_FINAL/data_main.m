clear all
close all

data = ...
    [
        [58512000 58559000 58851000 59206000 59327000 59541000 59753000 59964000 60186000 60496000 60912000  61357000 61805000 62244000 62704000 63179000 63621000 64016000 64374000 64707000 65027000 65342000 65659000 65998000 66331000 66624000 66892000];
        [1.275 1.276 1.409 1.333 1.402 1.610 1.614 1.461 1.511 1.500 1.368 1.382 1.500 1.848 2.124 2.204 2.325 2.663 2.923 2.694 2.647 2.863 2.681 2.809 2.849 2.434 2.465];
        [347 374 363 346 339 349 364 353 380 373 374 383 373 379 379 377 365 358 356 338 348 320 322 326 292 299 306];
        [421 456 464 473 477 494 513 505 511 526 540 550 559 567 574 576 575 569 574 536 569 561 566 572 563 568 553];
        [323 347 356 356 363 368 384 382 393 401 410 421 419 437 449 451 446 448 461 448 472 443 454 457 432 440 448];
        [7.8 8.0 9.0 10.0 10.4 10.1 10.5 10.7 10.3 10.0 8.5 7.8 7.9 8.5 8.9 8.9 8.8 8.0 7.5 9.1 9.3 9.2 9.8 10.3 10.2 9.9 9.7];
        [1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016];
    ];
targets = [225 238 234 238 231 240 251 244 252 252 255 261 261 266 270 271 266 263 265 253 261 251 252 253 243 246 243];
variables_to_use = [1 1 1 1 1 1 0];
number_of_variables = sum(variables_to_use);

normatization_data = max(data,[],2);
normatization_targets = max(targets);

train = zeros(number_of_variables, floor(size(data,2)/2));
targets_train = zeros(1, floor(size(data,2)/2));
test = zeros(number_of_variables, floor(size(data,2)/2));
targets_test = zeros(1, floor(size(data,2)/2));
offset = 0;
for i = 1:size(data, 1)
    if variables_to_use(i)
        for j = 1:(size(data, 2)-1)
            if mod(j ,2)
                train(i-offset,(j+1)/2) = data(i,j)/normatization_data(i);
            else
                test(i-offset,j/2) = data(i,j)/normatization_data(i);
            end
        end
    else
        offset = offset + 1;
    end
end


for j = 2:size(targets, 2)
    if mod(j ,2)
        targets_test((j-1)/2) = targets(j)/normatization_targets;
    else
        targets_train(j/2) = targets(j)/normatization_targets;
    end
end

config_harmonic1.population_len = 50;
config_harmonic1.sigma = 0.5;
config_harmonic1.fenotype_len = number_of_variables*2+1;
config_harmonic1.max_iterations = 20000;
config_harmonic1.domain = "d4";
config_harmonic1.comparator = "min";
config_harmonic1.evaluator = "final";
config_harmonic1.stopper = "iterations";
config_harmonic1.mutation = "multiple";
config_harmonic1.algorithm = "harmonic";
config_harmonic1.lambda = 0;
config_harmonic1.percentage = 0;
config_harmonic1.crossover = "";
config_harmonic1.selection = "";

config2.population_len = 50;
config2.sigma = 10;
config2.fenotype_len =  number_of_variables*2+1;
config2.lambda = 100;
config2.max_iterations = 5000;
config2.percentage = 0.3;
config2.domain = "d4";
config2.comparator = "min";
config2.evaluator = "final";
config2.stopper = "iterations";
config2.mutation = "multiple";
config2.crossover = "double";
config2.selection = "ranking";
config2.algorithm = "genetic-temple";

config.sigma = 25;
config.lambda = 1000;
config.fenotype_len = number_of_variables*2+1;
config.max_iterations = 8000;
config.domain = "d4";
config.comparator = "min";
config.evaluator = "final";
config.stopper = "iterations";
config.algorithm = "temple";
config.population_len = 0;
config.percentage = 0;
config.mutation = "";
config.crossover = "";
config.selection = "";

optimizador = OptimizationFactory(config2, train, targets_train);
[best, fit] = optimizador();

figure;plot(fit)
%%
evaluatorTest = EvaluatorFactory(config2, test, targets_test);
test_error = evaluatorTest(best)*normatization_targets^2;
disp(test_error);
raw_predict_data = data(:,end);
predict_data = zeros(1,sum(variables_to_use));
for i = 1:size(predict_data,1)
    if variables_to_use(i)
        predict_data(i) = raw_predict_data(i)/normatization_data(i);
    end
end

%energia_predecida = predecirEnergia(predict_data, best)*normatization_targets;
%disp(energia_predecida);

%%
predictions_test = zeros(1,size(targets_test, 2));
for i = 1:size(targets_test, 2)
    predictions_test(i) = predecirEnergia(test(:,i), best);
end

figure;
plot(targets_test*normatization_targets, '-or')
hold on;
plot(predictions_test*normatization_targets, '-xb')
hold off

