function [ACC,CM,Labels]=Test_kNN(dataTest,modelo)
%   Funcion que calcula el vecino mas proximo para los valores de k de entrada
%
N_clases=max(modelo.data.y);
[N_dim,N_train]=size(modelo.data.X);
[N_dim,N_test]=size(dataTest.X);

K=modelo.K;
if(~exist('K'))
    K=1;
end

distancia=zeros(N_train,N_test);
%Calculamos las distancias
distancia=sum(modelo.data.X.^2,1)'*ones(1,N_test)+ones(N_train,1)*sum(dataTest.X.^2,1)-2*modelo.data.X'*dataTest.X;

%Buscamos los K menores
[aux,aux2]=sort(distancia);
T=modelo.data.y'*ones(1,N_test);
clases=T(aux2(1:K,:));

A=[];
for c=1:N_clases
    A=[A;sum(clases==c)];
end
[B,C]=sort(A);
%Buscamos en los que ha habido un empate
%Para esas cogemos la clase que dio menor distancia
[D,Indices_Empate]=find(~(B(N_clases,:)-B(N_clases-1,:)));
Labels=C(N_clases,:);
Labels(Indices_Empate)=clases(1,Indices_Empate);

 M=N_clases;
CM=zeros(M,M);
  ACC=0;
  for i=1:M
     TargetInds=find(dataTest.y==i);
     IndsN=length(TargetInds);
     if(IndsN)
        for j=1:M
            CM(i,j)=length(find(Labels(TargetInds)==j))/IndsN;
        end
     else
         N_clases=N_clases-1;
     end
     ACC=ACC+CM(i,i);
  end
  [D,I]=find(dataTest.y==Labels);
  ACC=length(I)/length(dataTest.y);