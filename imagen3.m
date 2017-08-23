close all; clear all; clc;
pa=[0.2,0]; pb=[0.8,1];x=0.1;
y = cambiobrillo(x,pa,pb);

im1 = imread('pout.tif');
figure(1),subplot(3,2,1),imshow(im1);colorbar
title('Imagen Original');
[h,x] = imhist(im1);%para obtener un histograma de la imagen
subplot(3,2,2),stem(x,h,'marker','none');
grid on; grid minor;
title('Histograma de la imagen original');


im2 = double(im1)/255;
minimo = min(im2(:));
maximo = max(im2(:));
pa=[minimo,0]; pb=[maximo,1];x=0.83;
[M,N] = size(im2);


im3=im2.^2;
subplot(3,2,3),imshow(im3);colorbar
title('Transformacion Cuadratica'); % Realce niveles bajos de intensidad
%para obtener un histograma de la imagen
[h,x] = imhist(im3);
subplot(3,2,4),stem(x,h,'marker','none');
grid on; grid minor;
title('Histograma de la imagen - Realce niveles bajos');


im4=sqrt(im2);
subplot(3,2,5),imshow(im4);colorbar
title('Transformacion Raiz'); % Realce niveles altos de intensidad
%para obtener un histograma de la imagen
[h,x] = imhist(im4);
subplot(3,2,6),stem(x,h,'marker','none');
grid on; grid minor;
title('Histograma de la imagen - Realce niveles altos');

im5=double(im1) - mean2(im1);  %Umbralizacion, Umbral - Valor medio
[h,x] = imhist(im1);
figure(2),subplot(2,1,1),stem(x,h,'marker','none')
grid on; grid minor;
title('Umbrales unos y ceros')
p = mean2(im1);
hold on, line([p,p],[0,max(h)], 'color', 'm')%Marca la media del histograma para la im1
%[h,x] = imhist(im5); % al representarle me arroja la cantidad de unos y
%ceros que contempla la imagen
%subplot(2,1,3),stem(x,h,'marker','none')
%title('Histograma de la imagen');

subplot(2,1,2), imshow(im5);%Imagen Binaria
title('Imagen Binaria');colorbar

