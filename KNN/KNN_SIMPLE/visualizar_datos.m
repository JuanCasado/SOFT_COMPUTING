%function visualizar_datos

clc;
load datachar.mat
for n=1:20
  array=data.X(1:512,n);
  ll=length(array);
  pp=reshape(array,[16 ll/16]);
  pp=pp';
%  pp=vec2mat(array,16);
  figure(1);
  image(pp*255);
  colormap(gray(255));
  clc;
  disp('PULSA UNA TECLA PARA VISUALIZAR SIGUIENTE DATO');
  CARACTER_REPRESENTADO=num2str(data.y(n),'%c')
  INDICE=data.y(n)
  disp('Se utilizan los �ndices desde 48 para el ''0'' hasta el 90 para ''Z''');
  pause;
end
clc;


% Ejecuci�n con 2 vecinos

model=Train_kNN(data,9);
[ACC,CM,Labels]=Test_kNN(dataTest,model);
Tasa_de_acierto=ACC
indices_no_nulos=sum(CM);
indices_no_nulos=find(indices_no_nulos~=0);
Matriz_Confusion=CM(indices_no_nulos,indices_no_nulos);
imagesc(Matriz_Confusion)


% Indicar con el �ndice del caracter que queremos comprobar.
comp_carac=53;
Fila_del_=CM(comp_carac,:);
[x,y]=sort(Fila_del_);
cadena=[];
cadena=['Probabilidad de detectar el ' sprintf('%c',comp_carac) ' como ' sprintf('%c',y(end)) ' = ' sprintf('%f',x(end))];
disp(cadena);
cadena=['Probabilidad de detectar el ' sprintf('%c',comp_carac) ' como ' sprintf('%c',y(end-1)) ' = ' sprintf('%f',x(end-1))];
disp(cadena);
cadena=['Probabilidad de detectar el ' sprintf('%c',comp_carac) ' como ' sprintf('%c',y(end-2)) ' = ' sprintf('%f',x(end-2))];
disp(cadena);
