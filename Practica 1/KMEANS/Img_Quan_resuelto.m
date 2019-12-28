clear;
close all;

% Definimos colores para la representación
color= ['xb';'xr';'xk';'xy';'xc';'xg';'xm'];
color1=['ob';'or';'ok';'oy';'oc';'og';'om'];
color2=['ok';'ok';'or';'ok';'ok';'ok';'ok'];


% Leer imagen RAW
%ff=fopen('lena_gray.raw','rb');
%im=fread(ff,[512 512]);
%fclose(ff);
%im=im';

im=double(imread('/Users/mrblissfulgrin/Documents/UAH_2019_2020/VISION_ARTIFICIAL/imagenes_clase/rice.tif'));

[P,Q]=size(im);

% Representar imagen original
figure(1);
image(im);
colormap(gray(255));

% Creamos una matriz [M x 2]
% con valores consecutivos de la imagen original
%
% pixel1,pixel2;...
% pixel3,pixel4;...
% pixel5,pixel6;...
% ...
im2=[];
for n=1:Q/2
  im2=[im2; im(:,n*2-1) im(:,n*2)];
end

% Representar los vectores bidimensionales
% con una línea diagonal roja
figure(2)
plot(im2(:,1),im2(:,2),'x');
hold on
plot([0 255],[0 255],'r');
hold off

%% Obtenemos los centroides con para los vectores
%% im2 NUM_CENT es el número de centroides
NUM_CENT=2;
result=kmeans(im2,NUM_CENT);

% Representamos los vectores con diferentes 
% colores en función de la clase a la que se asignan
% y los centroides con otro color para diferenciarlos
figure(3);
CC=[];
for n=1:NUM_CENT
  [p,i]=find(result==n);
   plot(im2(p,1),im2(p,2),color(rem(n,7)+1,:));
   CC=[CC;mean(im2(p,1)) mean(im2(p,2))];
   hold on
end
for n=1:NUM_CENT
   plot(CC(n,1),CC(n,2),color2(rem(n,7)+1,:),'LineWidth',8);
   plot(CC(n,1),CC(n,2),color1(rem(n,7)+1,:),'LineWidth',5);
end
hold off


% Reconstruimos la imagen;
CC=round(CC);
imr=[];
for n=1:Q/2
    ind1=P*(n-1)+1;
    ind2=ind1+Q-1;
   imr=[imr, CC(result(ind1:ind2),:)];
%   im2=[im2; im(:,n*2-1) im(:,n*2)];
end
% Representamos la imagen reconstruida
figure(4);
image(imr);
colormap(gray(255));

% Calculamos el Error Cuadrático medio
mse=mean(mean((im-imr).^2))

if (NUM_CENT==16)
    % Salvamos los centroides y los índices para la recuperación
    save CC.mat CC
    f=fopen('im.vvv','wb');
    indice=1;
    for m=1:length(result)/2
            i1=(m-1)*2+1;
            i2=(m-1)*2+2;
            dato8bits=(result(i1)-1)*16;
            dato8bits=dato8bits+(result(i2)-1);
            fwrite(f,dato8bits,'uchar');
    end
    fclose(f);
    disp('Imagen cuantificada salvada');
    pause;
else
    if (exist('CC.mat','file')~=0)
      ! rm CC.mat
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
if (exist('CC.mat','file')~=0)
  load CC.mat
  Q=512;
  P=512;
  NN=length(CC);
  % Recuperación válida para NUM_CENT=16 
  % que suponen 4 bits por cada bloque de dos pixels y se 
  % almacenan dos bloques en un byte.
  % Volvemos a leer los datos tras el clear
  close all
    f=fopen('im.vvv','rb');
    resultado=[];
    for m=1:P*Q/4
            d=fread(f,1,'uchar');
            a=floor(d/16);
            b=d-(a*16)+1;
            a=a+1;
            resultado=[resultado;a;b];
    end
    fclose(f);

    % Reestructuramos la imagen de partida
    im2=[];
    for n=1:Q/2
        ind1=P*(n-1)+1;
        ind2=ind1+Q-1;
       im2=[im2, CC(resultado(ind1:ind2),:)];
    end
    %Visualizamos la imagen recuperada
    figure(1);
    image(im2);
    colormap(gray(255));
end
