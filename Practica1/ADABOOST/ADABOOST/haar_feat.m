%function [Xfeat]=haar_fear(x);
% entrada: 
% x: matriz de 12 x 24 con la imagen de la que extraer caracter�stica.
% Xfeat: vector fila con cada una de las caracter�sticas de Haar
function [Xfeat]=haar_fear(x);

%definimos dipolos horizontales
%  1100
%  1100
% '1' Suma
% '0' Resta
% Desde 1 fila  x 2 columnas
% Hasta 4 filas x 8 columnas
% Desplazamiento en horizontal y vertical de una unidad
Xfeat=[];
[p,q]=size(x);

for Nfilas=1:4
    for Ncol=1:4 % tenemos que considerar el doble las pos y neg
      for Filas=1:p-Nfilas+1
          for Col=1:q-2*Ncol+1
            cpos=sum(sum(x(Filas:Filas+Nfilas-1,Col:Col+Ncol-1)));
            cneg=sum(sum(x(Filas:Filas+Nfilas-1,Col+Ncol:Col+2*Ncol-1)));
            Xfeat=[Xfeat cpos-cneg];   
          end
      end
    end
end

%definimos dipolos verticales
%  11
%  11
%  00
%  00
% '1' Suma
% '0' Resta
% Desde 2 fila  x 1 columnas
% Hasta 8 filas x 4 columnas
% Desplazamiento en horizontal y vertical de una unidad

for Nfilas=1:4    % tenemos que considerar el doble las pos y neg
    for Ncol=1:4 
      for Filas=1:p-2*Nfilas+1
          for Col=1:q-Ncol+1
            cpos=sum(sum(x(Filas:Filas+Nfilas-1,Col:Col+Ncol-1)));
            cneg=sum(sum(x(Filas+Nfilas:Filas+2*Nfilas-1,Col:Col+Ncol-1)));
            Xfeat=[Xfeat cpos-cneg];   
          end
      end
    end
end


% definimos caracter�sticas con activaci�n central
%
%  0110
%  0110

for Filas=1:p-1
  for Col=1:q-3
     cpos=x(Filas  ,Col)+...
          x(Filas+1,Col)+...
          x(Filas  ,Col+3)+...
          x(Filas+1,Col+3);
     cneg=sum(sum(x(Filas:Filas+1,Col+1:Col+2)));
     Xfeat=[Xfeat cpos-cneg];   
   end
end

% definimos caracter�sticas con activaci�n central
%
%  0011100
%  0011100

for Filas=1:p-1
  for Col=1:q-6
     cpos=x(Filas  ,Col)+...
          x(Filas+1,Col)+...
          x(Filas  ,Col+1)+...
          x(Filas+1,Col+1)+...          
          x(Filas  ,Col+5)+...
          x(Filas+1,Col+5)+...
          x(Filas  ,Col+6)+...
          x(Filas+1,Col+6);
     cneg=sum(sum(x(Filas:Filas+1,Col+2:Col+4)));
     Xfeat=[Xfeat cpos-cneg];   
   end
end


