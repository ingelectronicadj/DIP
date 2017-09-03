close all; clear all; clc;
im1 = imread('imagenesOriginales/Ocaso_gris_001.png');
[M1,N1] = size(im1); % tamano de la imagen (384x512)

im2 = double(im1)/255;
minimo = min(im2(:));
maximo = max(im2(:));

[h,x] = imhist(im2);% se obtiene un histograma de la imagen
figure(1), subplot(2,2,1), stem(x,h,'marker','none');
p = mean2(im2);
hold on, line([p,p],[0,max(h)], 'color', 'm'); % Marca la media del histograma
title('Histograma de la imagen original'); grid on; grid minor;

% Ampliacion de la escala de grises
maxGris = 1.1;
minGris = 0;
im3 = ((maxGris-minGris)*((im2-minimo)/(maximo-minimo))) + minGris;

[h2,x2] = imhist(im3);
subplot(2,2,3),stem(x2,h2,'marker','none');
p2 = mean2(im3);
hold on, line([p2,p2],[0,max(h2)], 'color', 'm');
title('Ampliacion de la Escala de Grises de la imagen Original'); grid on; grid minor; 

im4 = im2.^(1/2); % La imagen resultante es mas clara que la original
im5 = im3.^(1/2); % La imagen resultante es mas clara que la original

[h3,x3] = imhist(im4);
figure(1), subplot(2,2,2),stem(x3,h3,'marker','none');
p3 = mean2(im4);
hold on, line([p3,p3],[0,max(h3)], 'color', 'm');
title('Transformacion Raiz a la Imagen Original'); grid on; grid minor; 

[h4,x4] = imhist(im5);
figure(1), subplot(2,2,4),stem(x4,h4,'marker','none');
p4 = mean2(im5);
hold on, line([p4,p4],[0,max(h4)], 'color', 'm');
title('Transformacion Raiz despues de Ampliar Escala de Grises'); grid on; grid minor;

figure(2), imshow([im2 im4 im5])

[f,z]=imhist(im2,1000000); %Normalizando cuentas
fNorm = f/(sum(f)*(z(2)-z(1))); % Dividiendo por el total de las cuentas y el ancho binario para hacer un area bajo la curva.
fAcum = cumsum(fNorm);%Suma acumulada
figure(3), subplot(2,2,1),plot(z,fAcum); title('Histograma Acumulado Imagen Original') %Graficar
[f2,z2]=imhist(im3,1000000);
fNorm = f2/(sum(f2)*(z2(2)-z2(1)));
fAcum = cumsum(fNorm);
subplot(2,2,3),plot(z2,fAcum); title('Histograma Acumulado - Imagen con Aumento en Escala de Gris')
[f3,z3]=imhist(im4,1000000);
fNorm = f3/(sum(f3)*(z3(2)-z3(1)));
fAcum = cumsum(fNorm);
subplot(2,2,2),plot(z3,fAcum); title('Transformacion Raiz')
[f4,z4]=imhist(im5,1000000);
fNorm = f4/(sum(f4)*(z4(2)-z4(1)));
fAcum = cumsum(fNorm);
subplot(2,2,4),plot(z4,fAcum); title('Transformacion Raiz - Imagen con Aumento en Escala de Gris')


