close all; clear all; clc;
imagen = imread('pout.tif'); % Cargamos la imagen
[fil,col] = size(imagen);
total_pixels = fil * col;
 
% Variable a utilizar asignandole ceros
imagen_eq = zeros(fil,col); %histo = zeros(1,256);
hist = imhist(imagen); % Histograma de la imagen
imagen = double (imagen); % ajuste de la variable imagen(uint8) en una variable de doble precision

% Vector de  255 elementos nulos a la variable probabilidad, acumulada y ecualizador
probabilidad = zeros (1,256);
acumulada = zeros(1,256);
ecualizador= zeros(1,256);

% Calculamos la probabilidad de que se  presenten cada uno de los niveles
% de gris  (Frecuencia relativa)
for k=1:256
probabilidad(k)=hist(k)/total_pixels;
end

% La probabilidad acumulada que tiene el pixel 0 es la probabilidad de 0
acumulada(1) = probabilidad(1);

% Calculo de la acumulada(k) como la suma de la acumulada anterior mas %
% la probabilidad de nivel de gris que existe en k. No empieza en 1 ya %
% que la acumulada del primer pixel es igual a la probabilida de este  %
for k = 2:256
acumulada(k) = acumulada(k-1) + probabilidad(k);
end

% Ecualizador va a contener la transformacion del nivel de gris        %
for k=1:256
ecualizador(k) = acumulada(k)*256;
end


%Sustitucion de los niveles de gris en base a ecualizador
for i=1:fil
    for j=1:col
        k = imagen(i,j);
        imagen_eq(i,j)=ecualizador(k+1);
    end
end


imagen = uint8(imagen);% Ajuste de variables a formato uint8
imagen_eq = uint8(imagen_eq);

%Representacion Grafica
figure(5), subplot(2,2,1);imshow(imagen); colorbar; title('Imagen Original');
subplot(2,2,2);imhist(imagen);title('Histograma Imagen Original');
subplot(2,2,3);imshow(imagen_eq); colorbar; title('Imagen Ecualizada');
subplot(2,2,4);imhist(imagen_eq);title('Histograma Imagen Ecualizada');