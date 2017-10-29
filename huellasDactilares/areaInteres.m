close all, clc, clear all;
im1 = imread('images/diego1.bmp');
im1 = 255 - im1; %Se invierte la huella
h1 = imhist(im1); % histogram,a de toda la imagen
[h,x] = imhist(im1);
figure, subplot(211), stem(x,h,'marker','none')
p = mean2(im1);
hold on, line([p,p],[0,max(h)], 'color', 'm'); % Marca la media del histograma
xlabel('Intensidad');
ylabel('Numero de pixeles');
title('Histograma de la imagen original');

se = strel('disk',5,0);
im2 = imclose(im1,se);
im2 = imclose(im2,se);

vector = im1(:);
%dinamico = double(mean(im1)) - double(std(vector));
im3 = im2 > (p);
im4 = regionprops(im3, 'area'); % funcion que crea estructuras (rotular)
a = max([im4.Area])-1; % encontrar areas maximas -1

im5 = bwareaopen(im3,a);% elimina todas las areas de tamaño inferior a la max-1
h2 = imhist(im1(im5)); % halla el histograma solo la parte que nos interesa 


[h,x2] = imhist(im1(im5));
subplot(212), stem(x2,h,'marker','none')
p = mean2(im1(im5));
hold on, line([p,p],[0,max(h)], 'color', 'm'); % Marca la media del histograma
xlabel('Intensidad');
ylabel('Numero de pixeles');
title('Histograma del area de la huella');

media = mean2(im1);
im6 = im1;
im6(im6<media) = media;
im7 = im1;
im7(im7>media) = media;
figure, mesh([im6,im7]); %Se corta la imagen mesh desde la media del histograma

im8 = im1 - im7;
im9 = imsharpen(im8,'Radius',2,'Amount',2);
im9 = medfilt2(im9); 
figure, imshow([im1 im8 im9],[])


