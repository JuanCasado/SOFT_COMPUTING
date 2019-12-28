%Demo
%https://playground.tensorflow.org

clear

p=load('train.csv');

Data.P=p(:,2:end)';
Data.T=p(:,1)';

Train.P=Data.P;
Train.T=Data.T;

%Earlystoping after 6 iterations without improving in the validation set
%the algorithm is sttoped.

red=feedforwardnet([5],'trainlm'); %Traingdx or Traingdm
red.divideParam.trainRatio=0.8;
red.divideParam.valRatio=0.2;
red.divideParam.testRatio=0.0;

red=train(red,Train.P,Train.T);

t=load('test.csv');

Data.P=p(:,2:end)';
Data.T=p(:,1)';


Test.P=Data.P;
Test.T=Data.T;



Y=sim(red,Test.P);

clase_real=Test.T>0;
clase_asignada=Y>0;

ErrorTest=mean(clase_real~=clase_asignada)

