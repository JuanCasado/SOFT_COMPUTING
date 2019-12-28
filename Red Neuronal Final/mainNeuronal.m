clear all;
close all;
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

trainD = zeros(number_of_variables, floor(size(data,2)/2));
targets_train = zeros(1, floor(size(data,2)/2));
testD = zeros(number_of_variables, floor(size(data,2)/2));
targets_test = zeros(1, floor(size(data,2)/2));
offset = 0;

for i = 1:size(data, 1)
    if variables_to_use(i)
        for j = 1:(size(data, 2)-1)
            if mod(j ,2)
                trainD(i-offset,(j+1)/2) = data(i,j)/normatization_data(i);
            else
                testD(i-offset,j/2) = data(i,j)/normatization_data(i);
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

dataD = zeros((size(data,1)-1),(size(data,2)-1));
targetsD = zeros(1,(size(targets,2)-1));
for i = 2:(size(dataD,2)+1)
    if ~mod(i,2)
        dataD(:,i-1) = trainD(:,i/2);
        targetsD(i-1) = targets_train(i/2);
    else 
        dataD(:,i-1) = testD(:,(i-1)/2);
        targetsD(i-1) = targets_test((i-1)/2);
    end
end


errors = [];
targetsDraw = [];
outputsDraw = [];
for i = 1:size(dataD,2)
   if i < size(dataD,2)
    trainCross = [dataD(:,1:i-1) dataD(:,i+1:end)]; 
    targetsTrain = [targetsD(:,1:i-1) targetsD(:,i+1:end)];
   else
    trainCross = [dataD(:,1:i-1)]; 
    targetsTrain = [targetsD(:,1:i-1)];
   end
   %disp(size(trainCross))
   %disp(size(targetsTrain))
   
   testCross = dataD(:,i);
   targetsTest = targetsD(:,i);
   targetsDraw = [targetsDraw targetsTest];
   

    hiddenLayerSize = [10];
    net = fitnet(hiddenLayerSize);
    net.divideParam.trainRatio = 100/100;
    net.divideParam.valRatio = 0/100;
    net.divideParam.testRatio = 0/100;
    net.trainParam.epochs = 10;
    net.trainParam.goal = 0;
    % Entrenamiento de la red
    [net,tr] = train(net,trainCross,targetsTrain);
    outputs = net(testCross);
    outputsDraw = [outputsDraw outputs];
    errors = [errors ((outputs-targetsTest)^2)*normatization_targets^2];
end
 
figure;
hold on;
view(net)
plot(targetsDraw*normatization_targets, '-or')
plot(outputsDraw*normatization_targets, '-xb')
hold off;
disp(mean(errors));

