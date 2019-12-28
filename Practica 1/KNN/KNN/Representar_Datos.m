%function data=Representar_Datos(fichero)
function data=Representar_Datos(fichero)
load(fichero);
clf;
axis([-1,1,-1,1]);
hold on
plot(data.X(1,data.y==1),data.X(2,data.y==1),'bo');
plot(data.X(1,data.y==2),data.X(2,data.y==2),'g^');
plot(data.X(1,data.y==3),data.X(2,data.y==3),'rx');
hold off