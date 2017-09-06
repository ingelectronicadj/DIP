close all; clear all; clc;
im1 = imread('peppers.png');
[M1,N1] = size(im1); %tamaño de la imagen (fil,col)

im1 = ones(256,1)*[0:255]/255;
im2 = im1';
im3 = ones(256);
im4 = [im1,im1];
im4(:,:,2) = [im2, im3];
im4(:,:,3) = [im3, im2];
im5 = hsv2rgb(im4);
figure(1), imshow(im5); %Dado que mi pantalla es rgb no se percibe el cambio

im6 = rgb2ycbcr(im5); % ycbcr Formato de video llamado modelo de diferencia de color
% De esa manera el ancho de banda necesario es menor y usualmente es
% empleada esta transformacion para transmision de video digital
figure(2), imshow([im6(:,:,1); im6(:,:,2); im6(:,:,3);])