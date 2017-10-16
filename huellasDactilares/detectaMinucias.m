close all, clc, clear all;
im1 = imread('images/diego1.bmp');
im2 = histeq(im1); 
im3 = imsharpen(im2,'Radius',2,'Amount',2);
% figure, imshow(im1);
% figure, imshow(im3);
im4 = im3 > 50;
figure, imshow([im1,im3,im4]);
im5 = bwmorph(~im4,'thin',400);
figure, imshow(~im5);
propied=regionprops(im1,'BoundingBox');
numero =0;
sumas = ~im5;
se = ones(3);

[m,n] = size(im5);
for i=1:m-20
    
    for j=1:n-20
    
    for h=1:3
    for k =1:3
    numero1= ~im5(i+h,j+k);
    numero2 = se(h,k);
    
    numero3 = numero1 * numero2;
    numero = numero + numero3;
 
    
    end
    end
%     sumas(i,j)= numero;
    if numero == 5 && ~im5(i+1,j+1)==0
    sumas(i,j)= 0;
    line([j-1,j+1+2],[i+1+2,i+1-2])
     line([j,j+1+1],[i,i+1+1])
    else
    sumas(i,j)= 1; 
    end
    numero = 0;
    
    end; 
end;