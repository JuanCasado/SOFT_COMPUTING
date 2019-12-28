% Ejemplo1(2,1,3,2)

function T=Ejemplo1(A1,w1,A2,w2)

if(A1>10 || w1>10)
    error("Fallo en los parámetros sinusoide 1");
end
if(A2>10 || w2>10)
    error("Fallo en los parámetros sinusoide 2");
end

t=0:0.001:5;
a=A1*sin(w1*t);
b=A2*sin(w2*t);

%Las representamos
plot(t,a,'b'); %Se�al a de azul
hold on
plot(t,b,'r'); %Se�al b de rojo.

%Calculamos la diferencia en valor absoluto
c=abs(a-b);

%Buscamos los valores de c que sean menor que un umbral.

[D,I]=find(c<0.05);

%Encontramos los tiempos para los que se cumple la condicion anterior

%Representamos los puntos
T=t(I);
plot(T,a(I),'o');
hold off
