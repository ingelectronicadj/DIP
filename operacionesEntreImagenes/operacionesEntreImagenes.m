close all; clear all; clc;
im1 = imread('cameraman.png');
im2 = imread('gantrycrane.png');
im2(:,:,1:2)=[]; %Elimina dos de las compontentes 
[M1,N1] = size(im1); %tamaño de la imagen (fil,col)
[M2,N2] = size(im2);
figure(1),subplot(2,2,1),imshow(im1);colorbar %subplot(filas,columnas,#imagen)
title('imagen de 256x256 pixeles');
subplot(2,2,2),imshow(im2);colorbar
title('imagen de 264x400 pixeles');
%La im2 es de mayor tamano a la im1, lo que se realiza es un corte rapido
im2(1:8,:)=[];%elimina las 8 filas primeras de la imagen para conteplar el tamaño 256
im2(:,1:99)=[];%elimina  las primeras 99 columnas 
im2(:,257:end)=[];%elimina las columnas desde el 257 hasta 400
subplot(2,2,3),imshow(im2);colorbar

im3 = im1 + im2;
im4 = (0.5*im1) + (0.5*im2);
subplot(2,2,4), imshow(im4);

figure(2), subplot(2,2,1), imhist(im1);
subplot(2,2,2), imhist(im2);
subplot(2,2,3), imhist(im3);
subplot(2,2,4), imhist(im4);

im5 = im1 - im2;
im6 = im2 - im1;
im7 = abs(im5);
figure(3), imshow([im5,im6,im7])

im8 = uint8(abs(double(im1)-double(im2)));%antes de operar colocar la imagen con double
%me permite aumentar las diferencias absolutas de cada pixel de la imagen
im9 = uint8(abs(double(im5)));
figure(4), imshow([im8 im9]);

im10 = uint8(double(im1) + 25*(rand(size(im1))-.05));
figure(5), imshow([im1,im10]);

im_11 = uint8(abs(double(im1) - double(im10)));
figure(6), imshow(im_11,[]); %Muestra la inmunidad o dependencia de la imagen al ruido

%Calculamos la energia para notar su diferencia por el efecto a ruido
E1 = sum(double(im1(:)).^2);
E_11 = sum(double(im_11(:)).^2);
E1_a = norm(double(im1(:)))^2;

im21 = double(im1)/255;
im22 = double(im2)/255;
im23 = im21./im22;
figure(7), subplot(1,2,1), imshow(im23);
subplot(1,2,2), imshow(im23,[]); % imshow(imX,[]) -- adapta el rango de intensidades entre el minimo y maximo)
subplot(1,2,1), colorbar, subplot(1,2,2), colorbar

im24 = im21.*im22; %el puntico denota que se debe tener el mismo numero de filas y decolumnas
im25 = im21*im22;
figure(8), imshow([im24 im25]);

im26 = im21.^(1/2);
im27 = im21.^(1/3);
figure(9), imshow([im26 im27])
%cuando se le aplica a la imagen una operacion de potencia se dice que se esta realizando una correccion gamma
im28 = im21.^2; 
im29 = im21.^3;
figure(10), imshow([im26,im27 ; im28,im29])

figure(11), imhist(im21)%maneja por defecto 256 barras
figure(12), hist(im21(:),256);

[h11,X11] = imhist(im21,32);
figure(13), subplot(1,2,1),plot(X11,h11);
subplot(1,2,2), bar(X11,h11)

%%%%% De la imagen de huellas dactilares que esta en el aula
%intentar aplicar la sigmoide