close all; clear all; clc;
im1 = imread('peppers.png');
[M1,N1] = size(im1); %tamaño de la imagen (fil,col)
%figure(1),imshow(im1), title('Imagen Original')

h1r = imhist(im1(:,:,1));
h1g = imhist(im1(:,:,2));
h1b = imhist(im1(:,:,3));
figure(2), plot(0:255,h1r,'r');hold on; plot(0:255,h1g,'g'); plot(0:255,h1b,'b')
title('Histograma de de la imagen Original')

figure(3), subplot(2,2,1), imshow(im1); title('Color');
subplot(2,2,2), imshow(im1(:,:,1)); title('Rojo');
subplot(2,2,3), imshow(im1(:,:,2)); title('Verde');
subplot(2,2,4), imshow(im1(:,:,3)); title('Azul');

im2 = uint8(((double(im1(:,:,1))) + (double(im1(:,:,2))) + (double(im1(:,:,3))))/3);
%figure(4), imshow(im2); title('Suma de las imagenes RGB/3')

im3 = uint8((0.3*(double(im1(:,:,1)))) + (0.59*double(im1(:,:,2))) + (0.11*double(im1(:,:,3))));
figure(5), subplot(1,3,1), imshow(im2); title('Suma de las imagenes (R+G+B)/3');
subplot(1,3,2), imshow(im3); title('Suma de las imagenes 0.3R+0.59G+0.11B');
im4 = rgb2gray(im1);
subplot(1,3,3), imshow(im4); title('Comando rgb2gray');

im5 = uint8(abs((double(im2)) - double(im3)));
im6 = uint8(abs((double(im2)) - double(im4)));
im7 = uint8(abs((double(im3)) - double(im4)));
figure(6), subplot(1,3,1), imshow(im5), title('im2 - im3');
subplot(1,3,2), imshow(im6), title('im2 - im4');
subplot(1,3,3), imshow(im7), title('im3 - im4');

im8 = rgb2hsv(im1);
figure(7), subplot(2,2,1),imshow(im1), title('color');
subplot(2,2,2), imshow(im8(:,:,1)), title('Hue');
subplot(2,2,3), imshow(im8(:,:,2)), title('Saturation');
subplot(2,2,4), imshow(im8(:,:,3)), title('Value');
