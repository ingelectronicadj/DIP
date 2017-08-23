%Funcion para hacer transformaciones de intensidad
%Esta funcion toma el valor de x y lo convierte en el valor y, de acuerdo
%con la ubicacion que le corresponda. Los parametros Pa y Pb son vectores
%de dos elementos que representan la posicion de los puntos A y B en la
%funcion de transformacion. (las funciones no se terminan con ;)
% el argumento ~=n denota diferente de n
function y = cambiobrillo(x,pa,pb)

if length(pa)~=2,disp('Pa debe ser un vector de 2 elementos');return;end
if length(pb)~=2,disp('Pb debe ser un vector de 2 elementos');return;end
if (max(x(:))>1)|(min(x(:))<0),disp('los valores de x desea estar entre 0 y 1');return;end
m1=pa(2)/pa(1); m2=(pb(2)-pa(2))/(pb(1)-pa(1)); m3=(1-pb(2))/(1-pb(1));% para las pendientes
if x<=pa(1),
    y=m1*m1; 
elseif (x>pa(1))&(x<pb(1))
    y=m2*(x-pa(1))+pa(2);
else
    y=m3*(x-pb(1))+pb(2);
end
   