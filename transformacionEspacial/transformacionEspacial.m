close all; clear all; clc;
%TRANSFORMACION GEOMETRICA BILINEAL

%im1 = imread('images/Automovil023.png');
im1 = imread('images/placa_014.png');
%im1 = imread('images/Automovil032.png');
%im1 = imread('images/Automovil006.png');


im1 = double(im1)/255;
figure(1), imshow(im1), title('Imagen Original')
%%%%%%%%%%%%%%%%%%%% Para obtener histogramas %%%%%%%%%%%%%%%%%%%%%%%%
h1r = imhist(im1(:,:,1));
h1g = imhist(im1(:,:,2));
h1b = imhist(im1(:,:,3));
figure(2), subplot(2,1,1), plot(0:255,h1r,'r');hold on; plot(0:255,h1g,'g'); plot(0:255,h1b,'b'); grid on
axis([0 260 0 3000]); % ajusta el rango de los ejes: axis([x1 x2 y1 y2])
title('Histograma de de la imagen Original a Color - Formato RGB')
[J,Tr] = histeq(im1(:,:,1));
[J,Tg] = histeq(im1(:,:,2));
[J,Tb] = histeq(im1(:,:,3));
subplot(2,1,2), plot((0:255)/255,Tr,'r');hold on;plot((0:255)/255,Tg,'g');plot((0:255)/255,Tb,'b');grid on
title('Histograma Acumulado - Formato RGB')

%%%%%%%%%%%%%%%%%%%% Para delimitar area de trabajo %%%%%%%%%%%%%%%%%%%%%%%%
% Para ello previamente seleccionamos las coordenadas (x,y) de la placa en 
% vista lateral de la Imagen Original
% Imagen1
% y = [230,223,268,281]';
% x = [329,396,393,328]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imagen2
 y = [135,133,188,192]';
 x = [267,359,356,265]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imagen3
% y = [148,159,196,176]';
% x = [271,310,299,259]';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Imagen4
% y = [222,231,280,264]';
% x = [103,174,169,98]';

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
% transformada puede quedar con un valor que no es entero por eso el round
for m=1:160, 
    for n=1:330, 
        im3(m,n)=im1(round(bp'*[1;n;m;n*m]), round(ap'*[1;n;m;n*m]));
    end; 
end;

figure(3), imshow(imadjust(im3)); title('Transformacion Vista Frontal')

%%%%%%%%%%%%%%%%%%%% Para la deteccion de bordes %%%%%%%%%%%%%%%%%%%%%%%%
im4 = edge(im3,'sobel');
figure(4), subplot(1,3,1), imshow([im3;im4]); title('Deteccion de bordes usando el comando EDGE')
% Defino dos matrices (horizontal y vertical)
s1 = [-1 0 1; -2 0 2; -1 0 1];
s2 = [-1 -2 -1; 0 0 0; 1 2 1];
im5 = filter2(s1,im3); %filter2 es la convolucion entre la imagen y la matriz
im6 = filter2(s2,im3); %derivada vertical
% Con la derivada lo que se busca es encontrar las variaciones
subplot(1,3,2), imshow([im5;im6],[]), title('Derivada Horizontal y Vertical')
im7 = abs(im5)  + abs(im6); % Gradiente
subplot(1,3,3), imshow([im3,[];im7,[]]), title('Convolucion entre la imagen y la matriz')

im11=im3./max(im3);
im12=zeros(size(im3));
%%%%%%%%%%%%%%%%
for m=1:160, 
    for n=1:330, 
        if (im11(m,n) >= 0.18) && (im11(m,n) <= 0.58)  
            im12(m,n)=0;
        else
            im12(m,n)=1;
        end
    end; 
end;
close all
figure(5),imshow([im11 im12])

im12(1:15,:)=[];%elimina las 15 filas primeras de la imagen
im12(125:end,:)=[];%elimina las filas desde la 125 hasta 160
im12(:,1:19)=[];%elimina  las primeras 18 columnas 
im12(:,303:end)=[];%elimina las columnas desde el 303 hasta 330
figure(6), imshow(im12); 
im8 = uint8(im12);
txt = ocr(im8), txt.Text