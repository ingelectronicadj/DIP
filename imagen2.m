close all
clear all
clc

im1 = imread('figGeometricas.png');
[M,N] = size(im1);%obtiene el tamano de la imagen fila,columna
[h,i] = imhist(im1); %crea histograma para el vector i [intensidad]
figure(7), imshow(im1), title('Histograma de las figuras geometricas');
colorbar;
xlabel('Intensidad');
ylabel('Numero de pixeles');
figure(3), stem(i,h,'marker','none');
promedio = mean2(im1);
p = mean2(im1);
% line tiene como bas dos parametros ([X][Y])
figure(3), hold on, line([p,p],[0,max(h)], 'color', 'm') %marca linea en el valor promedio del histograma
im2 = double(im1)/255;
figure, mesh(im2);
colorbar;
%para encontrar el pixel de mayor intensidad
minimo = min(im1(:));
maximo = max(im1(:));
figure(8), imshow(im1,[]);%con respecto a la imagen original esta saldra mas clara
%dado que al dejar vacio el array matlab pone el valor min=3 seguido del
%valor max=233
colorbar;
figure(9), imshow(im1,[51,178]); %con respecto a la anterior esta es mucho mas clara
%el 20% de 255 = 51 y el 70% de 255 = 178.5
text(250,229,'triangulo', 'color', [0.3 0.6 1], 'Fontname', 'Comic') %le puedo pasar al texto un color compuesto rgb definido en el array [] con valores 0-1
