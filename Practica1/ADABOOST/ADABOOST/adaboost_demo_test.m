%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%      TEST
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear;
CONST_ALPHA=0.5;
% Es la constante por la que se multiplica la suma de los alfas para
% obtener el umbral de clasificación
cadena_pos='S1';
cadena_neg='RUIDO';
DP=dir(cadena_pos);
DN=dir(cadena_neg);
for CASCADE=1:5
  CASCADE
  cad=sprintf('load ADABOOST%02d.mat',CASCADE);
  eval(cad);

  [TP_FN_TN_FP,DPaux,DNaux]=adaboost_test(ADABOOST,CONST_ALPHA,DP,DN,cadena_pos,cadena_neg);
  
  DP=DPaux;
  DN=DNaux;
end

function [TP_FN_TN_FP,DPaux,DNaux]=adaboost_test(ADABOOST,CONST_ALPHA,DP,DN,cadena_pos,cadena_neg);
    % Adaboost test
    % Cargamos muestras positivas
    DPaux=DP;
    DNaux=DN;    
    RP=[];
    TP=0;
    FP=0;
    TN=0;
    FN=0;
    NUMERO=length(DP);
    [p,q]=size(ADABOOST);
    iteraciones=p;
    for n=3:NUMERO
      if (length(DP(n).name)>0)
        cadena=['./',cadena_pos,'/',DP(n).name];
        x=imread(cadena);     
        A1=30;
        A2=220;
        x=rgb2gray(x);
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
        
        if (salida<CONST_ALPHA*sum(ADABOOST(:,2)))
            DPaux(n).name=[];
            FN=FN+1;
        else
            TP=TP+1;
        end
        RP=[RP salida];
      end
    end

    RN=[];
    % Cargamos muestras negativas
    NUMERO=length(DN);
    for n=3:NUMERO
      if (length(DN(n).name)>0)
        cadena=['./',cadena_neg,'/',DN(n).name];
        x=imread(cadena);        
        A1=30;
        A2=220;
        x=rgb2gray(x);
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
        if (salida<CONST_ALPHA*sum(ADABOOST(:,2)))
            DNaux(n).name=[];
            TN=TN+1;
        else
            FP=FP+1;
        end        
        RN=[RN salida];
      end
    end
    aa=min([RP,RN]);
    bb=max([RP,RN]);
    intervalos=aa:(bb-aa)/100:bb;
    [p1,q1]=hist(RP,intervalos);
    [p2,q2]=hist(RN,intervalos);
    figure
    plot(q1,p1,'bo');
    hold on
    plot(q2,p2,'ro');
    xlabel('UMBRAL');
    ylabel('Output hard classifier');
    legend('Positive samples','Negative samples')
    hold off
    figure
    PP=[];
    RR=[];
    LONG=length(p1);
    for n=0:LONG
        PP(n+1)=sum(p1(n+1:LONG))/sum(p1);
        RR(n+1)=sum(p2(n+1:LONG))/sum(p2);
    end
    prp=['kx-';'rx-';'bx-';'gx-';'yx-';'cx-';'mx-'];
    plot(RR,PP,prp(1,:),'LineWidth',2);
    hold on
    xlabel('False positives');
    ylabel('True positives');   
    hold off
    TP_FN_TN_FP=[TP FN TN FP]
end

