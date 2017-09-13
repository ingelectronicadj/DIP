close all; clear all; clc;

im1 = imread('FigurasGeometricasDiferentes.png');
im1 = double(im1)/255;
im2 = edge(im1,'sobel');

figure(1), imshow([im1 im2]); title('Deteccion de bordes usando el comando EDGE')

% Defino dos matrices (horizontal y vertical)
s1 = [-1 0 1; -2 0 2; -1 0 1];
s2 = [-1 -2 -1; 0 0 0; 1 2 1];
im3 = filter2(s1,im1); %filter2 es la convolucion entre la imagen y la matriz
im4 = filter2(s2,im1); %derivada vertical
% Con la derivada lo que se busca es encontrar las variaciones
figure(2), imshow([im3 im4],[]), title('Derivada Horizontal y Vertical')

im5 = abs(im3)  + abs(im4); % Gradiente
figure(3), imshow(im5,[])%[] -- [min--0 max--1] Mejora la presentacion de la imagen
% debes tener en cuenta que si la imagen es double y no se le aplica esto []
% Matlab tomar� una escala de grises pobre

l = linspace(0, 4.6, 100);
figure
for k=1:100,
    im6 = im5 >= l(k); 
    imshow(im6), xlabel(num2str(l(k))); pause(0.1);
end


