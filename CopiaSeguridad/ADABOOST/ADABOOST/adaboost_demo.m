%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Este c�digo implementa una demo para la clasificaci�n
% de im�genes mediante ADABOOST
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%   Lea el README.txt
%%%
% function adaboost_demo(DIR_POS,DIR_NEG,ETAPAS,IT);
% adaboost_demo('S1','RUIDO',2,[2 2]);
%
% DIR_POS: directorio donde se encuentran las muestras positivas
% DIR_NEG: directorio donde se encuentran las muestras negativas
% ETAPAS: N�mero de clasificadores fuertes (etapas de la cascada).
% IT: Vector con el n�mero de clasificadores d�biles de cada etapa.
%
% Esta funci�n genera un fichero ADABOOST%02.mat por cada una de las etapas
% de la sucesi�n de clasificadores fuertes que est�n formados por los
% clasificadores d�biles que se indican en el par�metro IT.
function adaboost_demo(DIR_POS,DIR_NEG,ETAPAS,IT);

% Constante con la que se realiza la clasificaci�n d�bil, en el art�culo de
% Viola and Jones aparece 0.5\sum \alpha, en esta implementaci�n se utiliza
% CONST_ALPHA * \sum alpha por si se desea relajar o ser m�s estricto en la
% clasificaci�n fuerte (0.5 es el valor por defecto).
CONST_ALPHA=0.5;

% Directorio con las muestras positivas para entrenamiento
%DIR_POS='S1';
% Directorio con las muestras negativas para entrenamiento
%DIR_NEG='RUIDO';

% Creaci�n y borrado de los directorios auxiliares que se utilizand para
% mantener una copia de las muestras que pasan por la sucesi�n de etapas en
% cascada
mkdir auxpos
cd auxpos
delete *.*
cd ..
mkdir auxneg
cd auxneg
delete *.*
cd ..
cad=['copyfile ' DIR_POS '/*bmp auxpos'];
eval(cad);
cad=['copyfile ' DIR_NEG '/*bmp auxneg'];
eval(cad);

Dir_pos='auxpos';
Dir_neg='auxneg';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%     TRAINING
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Se busca un clasificador fuerte por cada una de las etapas que se han
% indicado en los par�metros.
for CASCADE=1:ETAPAS
    CASCADE
    % Cargamos muestras positivas
    [Xfeat,Y]=cargar_caracteristicas(Dir_pos,1);
    % Cargamos muestras negativas
    [Xfeat1,Y1]=cargar_caracteristicas(Dir_neg,0);
    % Se concatenan todas las caracter�sticas con su etiqueta asociada.
    Xfeat=[Xfeat;Xfeat1];
    size(Xfeat)
    Y=[Y Y1];
    %    iteraciones(1)=3;
    %    iteraciones(2)=3;
    %    iteraciones(3)=3;
    %    iteraciones(2)=6;
    %    iteraciones(3)=6;
    %    iteraciones(4)=10;
    % Se llama a la funci�n que obtiene cada clasificador fuerte.
    [ADABOOST,t]=adaboost(Xfeat,Y,IT(CASCADE));
    % Si no se ha podido alcanzar el n�mero de iteraciones indicado, se
    % actualiza, este hecho se produce cuando un clasificador d�bil
    % consigue separar completamente los conjuntos que quedan.
    IT(CASCADE)=t;
    %Se salvan los datos del clasificador fuerte como resultado de la
    %funci�n
    cad=sprintf('save ADABOOST%02d.mat ADABOOST ',CASCADE);
    eval(cad);
    % Se pasa a borrar los ficheros que salen de esta etapa de la cascada
    % para pasar a la siguiente iteraci�n con las muestras que contin�an en
    % con el proceso de clasificaci�n
    [p,q]=size(ADABOOST);
    IT(CASCADE)=p;
    borrar_falsos(Dir_pos,CONST_ALPHA*sum(ADABOOST(:,2)),ADABOOST,IT(CASCADE),0)
    borrar_falsos(Dir_neg,CONST_ALPHA*sum(ADABOOST(:,2)),ADABOOST,IT(CASCADE),0)
end  % fin de for CASCADE=
end  % fin de function


% Esta función realiza el entrenamiento del Adaboost y devuelve una matriz
% con  ADABOOST=[ADABOOST;CARACT(end) alfa(end) SIGN(end) UMBRAL(end)];
% por cada una de las iteraciones (número de clasificadores débiles que
% comparte en esta iteración).
function [ADABOOST,t]=adaboost(Xfeat,Y,iteraciones)
depuracion=0;
% adaboost 
ADABOOST=[];

% Obtenemos:
% n�mero de vectores de entrenamiento
% n�mero de caracter�sticas analizadas
% �ndices de la clase POSITIVA (1) y su n�mero
[NUM_VECT,NUM_CARACT]=size(Xfeat);
rrr=find(Y==1);
NUM_VECT_CLASE_1=length(rrr);

% Definimos los pesos del entrenamiento
w=ones(1,NUM_VECT)/NUM_VECT;

UMBRAL=[];
CARACT=[];
SIGN=[];
ACC=[];


% Bucle para el n�mero de iteraciones de esta etapa
% del adaboost
 for t=1:iteraciones
    %Normalizar pesos
    w=w./sum(w);
    UMBRAL=0;
    CARACT=[CARACT 0];
    SIGN=[SIGN 0];
    ACC=[ACC 0];
    ERROR=Inf;    
    MAX=0;
    
    % Visualizamos una barra de progreso
    cad=sprintf('Adaboost');
    h = waitbar(0,cad);
    
    % Analizamos todas las caracter�sticas
    for caract=1:NUM_CARACT
        Um=0;
        UM=0;
        % Barra de progreso
        waitbar(caract/NUM_CARACT,h,cad);
        
        % Obtenemos el m�nimo de cada caracter�stica para todos los
        % vectores de la clase POSITIVA (1)
        Um1=min(Xfeat(1:NUM_VECT_CLASE_1,caract));
        % Obtenemos el m�nimo de cada caracter�stica para todos los
        % vectores de la clase NEGATIVA (0)
        Um2=min(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract));
        
        % Obtenemos el valor m�ximo de la caracter�stica que estamos
        % analizando para todos los vectores.
        UM=double(max(Xfeat(:,caract)));
        % Obtenemos el valor m�nimo de la caracter�stica que estamos
        % analizando para todos los vectores (POSITIVOS y NEGATIVOS).
        Um=double(max([Um1 Um2]));
        
        
        if (Um~=0 || UM~=0)
                if (Um<0)
                    Um=0.99*Um;
                else
                    Um=1.01*Um;
                end
                if (Um>UM)
                    Um=UM*0.99;
                end
                % La constante 100 es el número de bins de búsqueda del
                % umbral óptimo.
            intervalo=double((UM-Um))/100;
            NN=[];
            MM=[];
            m=Um:intervalo:UM;
            for n=Um:intervalo:UM
                p=find(Xfeat(1:NUM_VECT_CLASE_1,caract)<n);
                r=find(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract)<n);
                %Precisi�n en un sentido de la comparaci�n
                NN=[NN (length(p)+(NUM_VECT-NUM_VECT_CLASE_1-length(r)))/NUM_VECT];
                %Precisi�n en el otro sentido de la comparaci�n
                MM=[MM ((NUM_VECT-NUM_VECT_CLASE_1)-length(p)+length(r))/NUM_VECT];
            end
            [mm1,ii1]=max(NN);
            [mm2,ii2]=max(MM);
            if (mm1>mm2)
                p=find(Xfeat(1:NUM_VECT_CLASE_1,caract)<m(ii1));
                %                   r=find(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract)<m(ii1));
                %                   Acierto=(length(p)+(NUM_VECT-NUM_VECT_CLASE_1-length(r)))/NUM_VECT;
                %a1=length(p)/200;
                %a2=(NUM_VECT-NUM_VECT_CLASE_1-length(r))/200;
                r=find(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract)>=m(ii1));
                %                     e1=sum(w(p));
                %                     e2=sum(w(r+NUM_VECT_CLASE_1));
                e1=NUM_VECT_CLASE_1/NUM_VECT-sum(w(p));
                e2=(NUM_VECT-NUM_VECT_CLASE_1)/NUM_VECT-sum(w(r+NUM_VECT_CLASE_1));
                Acierto=1-e1-e2;
                if (depuracion==1)
                    sum(w(p))
                    e1
                    e2
                end
                %                     if (abs(Acierto1-Acierto)>0.01)
                %                       disp('diferente');
                %                     else
                %                         Acierto=Acierto1;
                %                     end
                signo=1;
                umm=m(ii1);
            else                
                p=find(Xfeat(1:NUM_VECT_CLASE_1,caract)>m(ii2));
                %                    r=find(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract)>m(ii2));
                %                       Acierto=(length(p)+(NUM_VECT-NUM_VECT_CLASE_1-length(r)))/NUM_VECT;
                %a1=length(p)/200;
                %a2=(NUM_VECT-NUM_VECT_CLASE_1-length(r))/200;
                r=find(Xfeat(NUM_VECT_CLASE_1+1:NUM_VECT,caract)<=m(ii2));
                e1=NUM_VECT_CLASE_1/NUM_VECT-sum(w(p));
                e2=(NUM_VECT-NUM_VECT_CLASE_1)/NUM_VECT-sum(w(r+NUM_VECT_CLASE_1));
                Acierto=1-e1-e2;
                if (depuracion==1)
                    sum(w(p))
                    e1
                    e2
                end
                %                     if (abs(Acierto1-Acierto)>0.01)
                %                         disp('diferente');
                %                     else
                %                         Acierto=Acierto1;
                %                     end
                signo=-1;
                umm=m(ii2);
            end
            if (MAX<Acierto)

                CARACT(end)=caract;
                SIGN(end)=signo;
                MAX=Acierto;
                UMBRAL=umm;
                P=p;
                R=r;
%                 Acierto
%                 caract
%                 signo
%                 UMBRAL
%                 pause
                
            end
        end % if (Um~=0 && UM~=0
    end % for caract=1:...
    close(h);
    error=1-MAX;
    
    beta=(error/(1-error));
    
    w(P)=w(P)*beta;
    w(R+NUM_VECT_CLASE_1)=w(R+NUM_VECT_CLASE_1)*beta;
    Xfeat(:,CARACT(end))=zeros(NUM_VECT,1);
    if (beta==0)
        alfa(t)=1000;
    else
        alfa(t)=log(1/beta);
    end,
    cadena=sprintf('UMBRAL: %4.2f Acc: %7.5f  Alfa %4.2f Signo: %+01d Feat: ',UMBRAL,MAX,alfa(t),SIGN(end));
    for n=1:t
        cadena=sprintf('%s %04d',cadena,CARACT(n));
    end
    disp(cadena);
    ADABOOST=[ADABOOST;CARACT(end) alfa(end) SIGN(end) UMBRAL];    
    MAX=MAX
    if (MAX>0.999)
        MAX
        t=t+1;
        break;
    end
 end
t=t-1;
ADABOOST
end % fin de function adaboost

function borrar_falsos(Dir,UMBRAL,ADABOOST,iteraciones,verbose)
% Cargamos muestras negativas
    D=dir(Dir);
    NUMERO=length(D);
    for n=3:NUMERO
    %    D(n).name
        cadena=['./',Dir,'/',D(n).name];
        x=imread(cadena);
        
          x=rgb2gray(x);
%         figure(1)
%         image(x)    
%         colormap(gray(255));
        A1=30;
        A2=220;

         [a,b]=find(x<A1);
        for nnn=1:length(a)
          x(a(nnn),b(nnn))=A1;
        end
        MM=max(max(x));
        if (MM<A2)
            A2=MM;
        end
        [a,b]=find(x>A2);
        for nnn=1:length(a)
          x(a(nnn),b(nnn))=A2;
        end
        for nn=1:31
            for mm=1:31
                x(nn,mm)=floor(255*(double(x(nn,mm))-A1)/(A2-A1));
            end
        end
        
        salida=sim_haar_feat(x,ADABOOST,iteraciones);
        
        if (salida<UMBRAL)
            delete(cadena);
            if (verbose)
                cadena
                salida
                pause;
            end
        end
    end
end % fin de function borrar_falsos


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Xfeat,Y]=cargar_caracteristicas(Dir,y);
    % Cargamos muestras positivas
    D=dir(Dir);
    NUMERO=length(D);
    Xfeat=[];
    Y=[];
    cad=sprintf('Cargando Muestras de entrenamiento %01d...',y);
    h = waitbar(0,cad);    
    for n=3:NUMERO
        waitbar((n-2)/(NUMERO-2),h,cad);
        cadena=['./',Dir, '/',D(n).name];
        
        A1=30;
        A2=220;
        x=imread(cadena);
        x=rgb2gray(x);
%         figure(1)
%         image(x)    
%         colormap(gray(255));
         [a,b]=find(x<A1);
        for nnn=1:length(a)
          x(a(nnn),b(nnn))=A1;
        end
        MM=max(max(x));
        if (MM<A2)
            A2=MM;
        end
        [a,b]=find(x>A2);
        for nnn=1:length(a)
          x(a(nnn),b(nnn))=A2;
        end
        for nn=1:31
            for mm=1:31
                x(nn,mm)=floor(255*(double(x(nn,mm))-A1)/(A2-A1));
            end
        end
%         figure(2)
%         image(x)    
%         colormap(gray(255));
        Xfeat=[Xfeat;haar_feat(x)];
        Y=[Y y];
    end
    close(h);
end  % fin de function cargar_caracteristicas


