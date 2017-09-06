close all; clear all; clc;
im1 = imread('cameraman.png');
im1 = double(im1)/255;
im2 = im1(1:2:end , 1:2:end); % #1:incr:#2 me hace una secuencia sucesiva
% tomando el primer numero seguido del #1+incremento
% En este caso tendriamos para 1:2:end --> 1,3,5,7,9...end
figure(1), imshow([im1, [im2,im2; im2,im2]]);

im3 = zeros(150,180);
for m=1:150 
    for n=1:180 
        im3(m,n) = im1(round(m*256/150), round(n*256/180));
    end
end
figure(2), imshow(im3);

im4 = zeros(347,207); %Cambio las dimensiones de la imagen a 207*347 pixeles
for m=1:347 
    for n=1:207 
        im4(m,n) = im1(round(m*256/347), round(n*256/207));
    end
end
figure(3), imshow(im4); 

im5 = zeros(765,765);% 255*3 = 765
for m=2:765
    for n=2:765
        im5(m,n) = im1(round(m*256/765), round(n*256/765));
    end
end
figure(4), imshow(im5);

for m=2:765
    for n=2:765
        im6(m,n) = im1(ceil(m*256/765), ceil(n*256/765));
    end
end
figure(5), imshow(im6);