% function ganador=comprueba(MATRIZ)
% Esta funci�n llama a la funci�n que comprueba si existe una posici�n
% ganadora, devuelve el ganador y representa un mensaje indicando el
% ganador caso de que lo haya.

% Para crear una funci�n se escribe 'function' con los par�metros que debe
% devolver (entre corchetes si son varios) = al numbre de la funci�n y
% entre par�ntesis los par�metros que se le introducen.

function ganador=comprueba(MATRIZ)
[N,M]=size(MATRIZ);
% Dentro de las funciones tambi�n podemos crear nuevas funciones que
% tendr�n visibilidad desde la funci�n que las contiene. Puede encontrar
% m�s abajo el c�digo de la funci�n comp. 
ganador=comp(MATRIZ);

if (ganador~=0)
      if (ganador==1)
          % disp es una funci�n que nos permite representar un texto por
          % pantalla.
        disp('GANADOR ROJO');
      else
        disp('GANADOR VERDE');       
      end
      beep;
end



% function ganador=comp(MATRIZ,flag)
% comprueba si hay ganador en la MATRIZ
% con flag 1 representa la jugada ganadora en negro y con flag 0
% no representa.
%
% Para crear una funci�n se escribe 'function' con los par�metros que debe
% devolver (entre corchetes si son varios) = al numbre de la funci�n y
% entre par�ntesis los par�metros que se le introducen.
function ganador=comp(MATRIZ)
[N,M]=size(MATRIZ);

ganador=0;

%Horizontales
    for n=1:N-3
          cuenta=sum(MATRIZ(n:n+3,:));
          b=find(abs(cuenta)==4);
          if (length(b)>0)
          
            if (cuenta(b(1))>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posici�n ganadora
            plot( n:n+3,[b(1) b(1) b(1) b(1)],'ok','LineWidth',5);
            return;          
          end
    end
 

% Verticales
    for m=1:M-3
          cuenta=sum(MATRIZ(:,m:m+3)');
          b=find(abs(cuenta)==4);
          if (length(b)>0)
          
            if (cuenta(b(1))>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posici�n ganadora
            plot([b(1) b(1) b(1) b(1)], m:m+3,'ok','LineWidth',5);
            return;
          end
    end
 

% Pendiente positiva

% Si deseamos separar una l�nea de c�digo en varias l�neas, 
% podemos escribir la l�nea acabada en ... y seguir en la 
% siguiente l�nea tantas veces como queramos.
   for m=1:M-3
    for n=1:N-3
          cuenta=MATRIZ(n,m)+...
                 MATRIZ(n+1,m+1)+...
                 MATRIZ(n+2,m+2)+...
                 MATRIZ(n+3,m+3);
          if (abs(cuenta)==4)
            if (cuenta>0)
                ganador=1;
            else
                ganador=-1;
            end
            % Superpone circulos negros para indicar posici�n ganadora
            plot(n:n+3,m:m+3,'ok','LineWidth',5);
            return;
          end
        end
    end

% Pendiente negativa
  for m=4:M
    for n=1:N-3
          cuenta=MATRIZ(n,m)+...
                 MATRIZ(n+1,m-1)+...
                 MATRIZ(n+2,m-2)+...
                 MATRIZ(n+3,m-3);
          if (abs(cuenta)==4)
              if (cuenta>0)
                ganador=1;
            else
                ganador=-1;
              end
            % Superpone circulos negros para indicar posici�n ganadora
            plot(n:n+3,m:-1:m-3,'ok','LineWidth',5);
            return;
          end
        end
    end
  
