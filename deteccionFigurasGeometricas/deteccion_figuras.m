clear all; clc; close all;
BW = imread('FigurasGeometricasGrandes.png');
%de intensidad 50 hacia arriba
im1=BW>45; % para binarizar

se=[0,1,0;1,1,1;0,1,0]; %Elemento estructurante
%im2=imerode(im1,se); % erosionar disminuye el tamano
im2=imdilate(im1,se); % dilatar aumenta tamano
%figure(), imshow([im1 im2]); title('Imagen Original & Imagen Dilatada')
im3=im2-im1;
%im4=xor(im2,im1);la misma cosa
im4=bwlabel(im3); %Sirve para rotular la imagen
%figure(3), imshow(im4); title('Bordes con objetos rotulados')

%PUNTOS SEMILLA
Xk = zeros(size(im3)); %Se define fondo logico en falso
% Se invierte la pareja ordenada x,y por y,x
Xk(89,74) = 250; %figura 1
Xk(75,171) = 250; %figura 2
Xk(89,301) = 250; %figura 3
Xk(90,425) = 250; %figura 4
Xk(188,67) = 250; %figura 5
Xk(201,195) = 250; %figura 6
Xk(199,330) = 250; %figura 7
Xk(221,448) = 250; %figura 8
Xk(310,96) = 250; %figura 9
Xk(303,206) = 250; %figura 10
Xk(304,301) = 250; %figura 11
Xk(324,405) = 250; %figura 12

im5 = bitor(im3,Xk);
figure(1), imshow(im5); title('Bordes Externos y Puntos Semilla'); 

[m,n] = size(im5);
for m=1:m
    for n=1:n
        if(im5(m,n)==250)
           %Xk = false;
           text(m,n,'Figura', 'color', [0.3 0.6 1], 'Fontname', 'Comic');
        end
    end
end



