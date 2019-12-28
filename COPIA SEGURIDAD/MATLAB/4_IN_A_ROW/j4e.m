
global N M NIVEL NUMERO_JUGADOR J_1 J_2
NIVEL=30;
N=7;
M=7;
figure(1);
clf;
clc;
n=0:N+1;
close('all');
figure('Color',[0 0 1]);

for m=0:0.1:M+1
  plot(n,zeros(1,length(n))+m,'b','LineWidth',13);
  hold on
end

axis('off');

puntosx=((1:N)'*(ones(1,M)))';
puntosx=puntosx(:);
puntosx=puntosx';
puntosy=((1:N)'*(ones(1,M)));
puntosy=puntosy(:);
puntosy=puntosy';
plot(puntosx,puntosy,'ow','LineWidth',21);

% PASO 2: Bucle de secuencia de jugadas
global MATRIZ
MATRIZ=zeros(N,M);

current_player = NUMERO_JUGADOR;
%p1 = input('Indique si el jugador ROJO es maquina[1] o humano[2]: ');
%p2 = input('Indique si el jugador VERDE es maquina[1] o humano[2]: ');
players = [J_1 J_2];

coninue_playing = 1;
while coninue_playing
   if current_player
       pieza = -1;
       display('Turno jugador VERDE')
       color = 'og';
   else
       pieza = 1;
       display('Turno jugador ROJO')
       color = 'or';
   end
   if players(current_player+1) == 1
       %MAQUINA
      [board,move,v]=make_move(MATRIZ);
      jr=move(2);
      % Se actualiza la MATRIZ y se representa la pieza
      for m=1:M
        if (MATRIZ(jr,m)==0)
          plot(jr,m,color,'LineWidth',25);
          MATRIZ(jr,m)=pieza;
          break;
        end
      end        
   else
      %JUGADOR
      [x,y,b]=ginput(1);
      %while b~=1 || b~=27
      %    [x,y,b]=ginput(1);
      %end
      if b==27
          coninue_playing = 0;
          break
      end
      indice=round(x);
      if indice<1
        indice=1;
      end
      if indice>N
        indice=N;
      end
      if (MATRIZ(indice,M)~=0)
          beep;
      else
          % Recorremos la columna elegida desde la
          % primera fila hasta encontrar el primer hueco
          % para colocar la pieza que nos indican.
          for m=1:M
            if (MATRIZ(indice,m)==0)
              plot(indice,m,color,'LineWidth',25);   
              pause(0.1);
              MATRIZ(indice,m)=pieza;
              break;
            end
          end
      end
   end
   % Comprobamos si con esa juegada se ha ganado la partida.
    ganador=comprueba(MATRIZ);
    if (ganador~=0)
        continue_playing = 0;
        break
    end
    if isempty(find(MATRIZ(:,M)==0))
        display('EMPATE')
        continue_playing = 0;
        break
    end
   current_player = ~current_player; 
end

hold off
pause;
close('all');

