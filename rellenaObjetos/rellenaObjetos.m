clear all; clc, close all;
im1=imread('figGeometricas.png');
figure(1),imshow(im1); title('Imagen Original');

iptsetpref('ImshowBorder','loose');
imshow(im1);
iptsetpref('ImshowAxesVisible','on');
imshow(im1);
im2=im1>=45;
% figure(2),imshow(im2); title('Imagen Correccion im1>=45');

sel=ones(3);
im3=imdilate(im2,sel);
% figure(3),imshow(im3); title('Imagen Dilatada con elemento estructurante isotropico');

im4=xor(im3,im2);
% figure(4),imshow(im4); title('Imagen Xor - Bordes Externos');

im3=imerode(im2,sel);
im3=imdilate(im2,sel);
im5=imerode(im2,sel);
% figure(5),imshow(im5); title('Imagen Erosionada con elemento estructurante isotropico');

im6=xor(im5,im2);
% figure(6),imshow(im6); title('Imagen Xor - Bordes Internos');

% pxBordeExterno = sum(im4(:)) % #pixeles de bordes externos
% pxBordeInterno = sum(im6(:)) % #pixeles de bordes internos
% LAS IMAGENES SUELEN SER SEGMENTADAS POR SU BORDE INTERNO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RELLENA OBJETOS
im6(242,236); % Seleccionamos un punto semilla
Xk=false(size(im6()));
figure,imshow(Xk);
Xk1=false(size(Xk));



