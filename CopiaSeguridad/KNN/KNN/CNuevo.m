%function Clasificar_Nueva_Muestra(fichero)
% fichero con data.X y data.y con los datos de entrenamiento
function CNuevo(fichero,Num_Vecinos)
Boton=1;
while(Boton==1)
    %Representar datos previos
    data=Representar_Datos(fichero);
    % 1: Azul  o
    % 2. Verde ^
    % 3: Rojo  x
    
    % Captura de dato para clasificar
    hold on;
    [x1,x2,Boton]=ginput(1);
    dataTest.X=[x1;x2];
    h=plot(dataTest.X(1,1),dataTest.X(2,1),'ko');

    set(h,'MarkerFaceColor',[0,0,0]);
    
    distancia=zeros(size(data.X,2),1);
    distancia=sum(data.X.^2,1)'*ones(1,1)+ones(size(data.X,2),1)*sum(dataTest.X.^2,1)-2*data.X'*dataTest.X;
    [aux,aux2]=sort(distancia);

    Vecinos=data.X(:,aux2(1:Num_Vecinos));
    h=plot(Vecinos(1,:),Vecinos(2,:),'ks');
    set(h,'Markersize',8);
    Clases_Vecinos=data.y(aux2(1:Num_Vecinos));
    Numero_Clases=max(data.y);
    C=zeros(1,Numero_Clases);
    for i=1:Num_Vecinos
        C(Clases_Vecinos(i))=C(Clases_Vecinos(i))+1;
    end
    [Numero,Clase]=max(C);
    str=['Clase:  ',num2str(Clase)];
    title(str);
    hold off
    pause();
end
    