close all; clear all; clc;
im1 = imread('imagenesOriginales/Ocaso_gris_001.png');
[M1,N1] = size(im1); % tamano de la imagen (384x512)

im2 = double(im1)/255;
minimo = min(im2(:));
maximo = max(im2(:));

im3 = im2.^2; % La imagen resultante es mas oscura que la original
im4 = im2.^(1/2); % La imagen resultante es mas clara que la original
% cuando se le aplica a la imagen una operacion de potencia se dice que se 
% esta realizando una correccion gamma
figure(1), imshow([im2 im3 im4]);

[h,x] = imhist(im2);% se obtiene un histograma de la imagen
% subplot(filas,columnas,#imagen)
figure(2); subplot(3,1,1),stem(x,h,'marker','none');
p = mean2(im2);
hold on, line([p,p],[0,max(h)], 'color', 'm'); % Marca la media del histograma
title('Histograma de la imagen original'); grid on; grid minor;

[h2,x2] = imhist(im3);
subplot(3,1,2),stem(x2,h2,'marker','none');
p2 = mean2(im3);
hold on, line([p2,p2],[0,max(h2)], 'color', 'm');
title('Transformacion exponencial'); grid on; grid minor; 

[h3,x3] = imhist(im4);
subplot(3,1,3),stem(x3,h3,'marker','none');
p3 = mean2(im4);
hold on, line([p3,p3],[0,max(h3)], 'color', 'm');
title('Transformacion Raiz'); grid on; grid minor; 




%Calculamos la energia para notar su diferencia por el efecto a ruido
E1 = sum(abs(double(im1(:)).^2));
%Se concluye que ninguna de las imagenes presenta ruido considerable para 
%ser tenido en cuenta en cuenta como parametro adecuado para la correccion 
%del set de imagenesOriginales






