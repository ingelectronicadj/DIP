close all
clear all
clc
%im1 = imread('globulos.TIF');
im1 = imread('cameraman.png'); %imagen1
im1 = double(im1)/255;
%las imagenes no tienen valores de intensidad negativo
%para conocer el valor min y max de la imagen
minimo = min(im1(:));
maximo = max(im1(:));
promedio = mean2(im1);
%para obtener un histograma de la imagen
[h,x] = imhist(im1);
figure, stem(x,h,'marker','none')
xlabel('Intensidad');
ylabel('Numero de pixeles');
title('Histograma de la imagen')
[M,N] = size(im1);%obtiene el tamano de la imagen f,c
maximoNpixeles = max(h);
%encuentra el indice de los elementos de ese vector que cumple con la
%condicion que esta relacionada con la intensidad
%(find(h==max(h))-1)
xi = x; clear x
%encontramos las intensidades de x que son mas populares
[x,y] = find(im1==(find(h==max(h))-1)/255); %255 -->(tamanoImagen-1)
figure,imshow(im1);
hold on
plot(y,x,'r.'); %sobre la imagen puntos rojos
plot(y-0.2,x+0.8,'g+') %sobre la imagen + verdes desplazados
minimoNpixeles = min(h);

%Para encontrar los valores de la imagen que tienen esta intensidad 7/255
z = find(im1==7/255); %15495
[f,c]= find(im1==7/255);%fila= 135 X columna=61
z2 = find(im1(:)==7/255); %(:) --> toma la matriz y la vuelve vectores columnas
%(60*256)+135 = 15495 %60-->61-1 no se considera la primer columna