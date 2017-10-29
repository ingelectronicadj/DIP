close all, clc, clear all;
im1 = imread('images/diego1.bmp');
im1 = 255 - im1; %Se invierte la huella

h1 = imhist(im1); % Se obtiene histograma de toda la imagen
[h,x] = imhist(im1);
figure, subplot(211), stem(x,h,'marker','none')
p = mean2(im1);
hold on, line([p,p],[0,max(h)], 'color', 'm'); % Marca la media del histograma
xlabel('Intensidad'); ylabel('Numero de pixeles');
title('Histograma de la imagen original');

se = strel('disk',5,0);
im2 = imclose(im1,se);
im2 = imclose(im2,se);

im3 = im2 > (p);
im4 = regionprops(im3, 'area'); % regionprops crea estructuras (rotula)
a = max([im4.Area])-1; % se encontran areas maximas -1

im5 = bwareaopen(im3,a);% se elimina todas las areas de tamaño inferior a la max-1
h2 = imhist(im1(im5)); % Se obtiene el histograma de solo la parte que nos interesa 
[h,x2] = imhist(im1(im5));
subplot(212), stem(x2,h,'marker','none')
p2 = mean2(im1(im5));
hold on, line([p2,p2],[0,max(h)], 'color', 'm'); % Marca la media del histograma
xlabel('Intensidad'); ylabel('Numero de pixeles');
title('Histograma del area de la huella');

%Se realiza un corte a la imagen mesh usando como parametro la media del histograma de la imagen
%que contiene el area de interes
media = p2;
im6 = im1;
im6(im6<media) = media; 
im7 = im1;
im7(im7>media) = media;
figure, mesh([im6,im7]); 

im8 = im1 - im7; % Le quitamos a la imagen original el corte
im9 = imsharpen(im8,'Radius',2,'Amount',2); %aplicamos realce
im9 = medfilt2(im9); %Aplicamos un filtro
figure, imshow([im1 im8 im9],[])

im10 = bwmorph(im9,'thin',400); %Adelgazamos las crestas de las huellas
figure, imshow(~im10);