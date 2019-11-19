function data=Obtener_datos()
data=struct('X',[],'y',[]);
% fig1=figure(1);
axis([-1,1,-1,1]);
hold on
Boton=1;
Entrada=1;
while(~isempty(Entrada))
  while(Boton~=2)
    [x,y,Boton]=ginput(1);
    if(Boton==1 & Entrada==1)
        b=plot(x,y,'bo');
        set(b,'MarkerSize',7);
        axis([-1,1,-1,1]);
        c=[x;y];
        data.X=[data.X,c];
        data.y=[data.y,1];
    elseif(Boton==1 & Entrada==2)
        b=plot(x,y,'g^');
        set(b,'MarkerSize',7);
        axis([-1,1,-1,1]);
        c=[x;y];
        data.X=[data.X,c];
        data.y=[data.y,2];
    elseif(Boton==1 & Entrada==3)
        b=plot(x,y,'rx');
        set(b,'MarkerSize',7);
        axis([-1,1,-1,1]);
        c=[x;y];
        data.X=[data.X,c];
        data.y=[data.y,3];
    end
  end
  Entrada=input('Clase:');
  Boton=1;
end