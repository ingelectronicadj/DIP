close all; clear all; clc;

im1 = imread('cameraman.tif');
im1 = double(im1)/255;

x = [0,1]; y = [1,0];
xp = [-3,1]; yp = [-2,5];

%Cuando se genera una transformacion Matlab crea una estructura
%ToDo--> https://www.mathworks.com/help/images/ref/fitgeotrans.html
T = maketform('projective', [1 1; 256 1; 256 256; 1 256],...
    [5,100; 1 300; 100,350; 120, 20]) % maketform(tipode transformacion)
% En Command Window ejecuta:
% T.tdata
% T.tdata.T
% T.tdata.Tinv
im2 = imtransform(im1,T);
figure(1), subplot(1,2,1), imshow(im1);
subplot(1,2,2), imshow(im2)

