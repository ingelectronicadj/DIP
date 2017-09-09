close all; clear all; clc;
%TRANSFORMACION GEOMETRICA BILINEAL

%im1 = imread('images/Automovil023.png');
%im1 = imread('images/placa_014.png');
%im1 = imread('images/Automovil032.png');
im1 = imread('images/Automovil006.png');

figure(1), imshow(im1), title('Imagen Original')

% Seleccionamos los vertices (x,y) de la placa en vista lateral de la Imagen Original
%y = [230,223,268,281]';
%x = [329,396,393,328]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%y = [135,133,188,192]';
%x = [267,359,356,265]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% y = [146,157,196,176]';
% x = [268,311,300,258]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = [222,231,280,264]';
x = [103,174,169,98]';

yp = [1,1,160,160]'; %Asignamos un tamano para la imagen final
xp = [1,330,330,1]';

M = [ones(4,1),x,y,x.*y]; % Creamos la matriz para transformacion Bilineal
a = M^(-1)*xp;
b = M^(-1)*yp;
Mp = [ones(4,1),xp,yp,xp.*yp];
ap = Mp^(-1)*x;
bp = Mp^(-1)*y;
% Ahora recalculamos el valor para cada punto y lo redondeamos al mas
% cercano; como es una transformada lineal, un pixel dentro de la nueva
% transformada puede quedar con un valor que no es entero por el round
for m=1:160, 
    for n=1:330, 
        im2(m,n)=im1(round(bp'*[1;n;m;n*m]), round(ap'*[1;n;m;n*m]));
    end; 
end;

figure(2), imshow(im2); title('Transformacion Vista Frontal')

% Para reconocer texto mediante reconocimiento optico de caracteres
% https://www.mathworks.com/help/vision/ref/ocr.html?s_tid=srchtitle
