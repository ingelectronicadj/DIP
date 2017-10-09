close all; clear all; clc;
BW = imread('images/camilo2.bmp');
minimo = min(BW(:));
maximo = max(BW(:));
promedio = mean2(BW);
nivel = (maximo-minimo)/2;
figure(1),imshow(BW);title('Imagen Original');

iptsetpref('ImshowBorder','loose'); imshow(BW);
iptsetpref('ImshowAxesVisible','on'); imshow(BW);
im2=(BW>=170); % Cambiar 170, hay que ver como hacerlo dinamico
figure(2),imshow(im2); title('Imagen con Correccion BW>=170');

sel=ones(3);
im3=imdilate(im2,sel);
figure(3),imshow(im3); title('Imagen Dilatada con elemento estructurante isotropico');

im4=xor(im3,im2);
figure(4),imshow(im4); title('Imagen Xor - Bordes Externos');

im3=imerode(im2,sel);
im3=imdilate(im2,sel);
im5=imerode(im2,sel);
figure(5),imshow(im5); title('Imagen Erosionada con elemento estructurante isotropico');

im6=xor(im5,im2);
figure(6),imshow(im6); title('Imagen Xor - Bordes Internos');