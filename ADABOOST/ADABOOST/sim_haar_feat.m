function salida=sim_haar_fear(x,ADABOOST,IT);
%global out

%definimos dipolos horizontales
%  1100
%  1100
% '1' Suma
% '0' Resta
% Desde 1 fila  x 2 columnas
% Hasta 4 filas x 8 columnas
% Desplazamiento en horizontal y vertical de una unidad

salida=0;
[p,q]=size(x);
[a,b]=size(ADABOOST);
% Para cada caracter�stica marcada en ADABOOST
for CONTADOR=1:IT
  contador_parcial=0;
    for Nfilas=1:4
        for Ncol=1:4 % tenemos que considerar el doble las pos y neg
          for Filas=1:p-Nfilas+1
              for Col=1:q-2*Ncol+1
                  contador_parcial=contador_parcial+1;
                  if (contador_parcial==ADABOOST(CONTADOR,1))
                    cpos=sum(sum(x(Filas:Filas+Nfilas-1,Col:Col+Ncol-1)));
                    cneg=sum(sum(x(Filas:Filas+Nfilas-1,Col+Ncol:Col+2*Ncol-1)));
                    if (ADABOOST(CONTADOR,3)*(cpos-cneg)<ADABOOST(CONTADOR,3)*ADABOOST(CONTADOR,4))
                      salida=salida+ADABOOST(CONTADOR,2);
                    end
                  end
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
                  contador_parcial=contador_parcial+1;
                  if (contador_parcial==ADABOOST(CONTADOR,1))
                     cpos=sum(sum(x(Filas:Filas+Nfilas-1,Col:Col+Ncol-1)));
                     cneg=sum(sum(x(Filas+Nfilas:Filas+2*Nfilas-1,Col:Col+Ncol-1)));
                     %out=[out cpos-cneg]
                     if (ADABOOST(CONTADOR,3)*(cpos-cneg)<ADABOOST(CONTADOR,3)*ADABOOST(CONTADOR,4))
                      salida=salida+ADABOOST(CONTADOR,2);
                    end
                  end
                  
              end
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
    contador_parcial=contador_parcial+1;
    if (contador_parcial==ADABOOST(CONTADOR,1))
       cpos=x(Filas  ,Col)+...
            x(Filas+1,Col)+...
            x(Filas  ,Col+3)+...
            x(Filas+1,Col+3);
       cneg=sum(sum(x(Filas:Filas+1,Col+1:Col+2)));
       
       if (ADABOOST(CONTADOR,3)*(cpos-cneg)<ADABOOST(CONTADOR,3)*ADABOOST(CONTADOR,4))
         salida=salida+ADABOOST(CONTADOR,2);
       end
     end
   end
end


% definimos caracter�sticas con activaci�n central
%
%  0011100
%  0011100

for Filas=1:p-1
    for Col=1:q-6
        contador_parcial=contador_parcial+1;
        if (contador_parcial==ADABOOST(CONTADOR,1))
            cpos=x(Filas  ,Col)+...
            x(Filas+1,Col)+...
            x(Filas  ,Col+1)+...
            x(Filas+1,Col+1)+...          
            x(Filas  ,Col+5)+...
            x(Filas+1,Col+5)+...
            x(Filas  ,Col+6)+...
            x(Filas+1,Col+6);
            cneg=sum(sum(x(Filas:Filas+1,Col+2:Col+4)));
            
            if (ADABOOST(CONTADOR,3)*(cpos-cneg)<ADABOOST(CONTADOR,3)*ADABOOST(CONTADOR,4))
                salida=salida+ADABOOST(CONTADOR,2);
            end
        end
    end
end
