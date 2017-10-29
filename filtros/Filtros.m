close all
im1=double(imread('FigurasGeometricasGrandes.png'))/255;
IM1=fft2(im1);
[M N]=size(im1);
magIM1=fftshift(log(1+abs(IM1)));%calcula el logaritmo de la magnitud
figure, imshow([im1, mat2gray(magIM1)],[])
%IM1(1,1)=0;%elimina el nivel dc de la imagen
im2=ifft2(IM1);
%figure, imshow(im2)
h=fspecial('gaussian',15,3);%crea el filtro gaussiano
h1=fspecial('gaussian',15,7);
im3=imfilter(im1,h,'circular');%decide que la imagen sera periodica
figure, imshow(im3)
H=freqz2(h,size(im1));
H1=freqz2(h1,size(im1));
figure, imshow([H H1])
h2=fspecial('sobel');%crea el filtro de sobel vertical
h2=h2';%crea el filtro de sobel horizontal
im4=imfilter(im1,h2,'circular');%filtro en el espacio
figure, imshow([im1, mat2gray(im4)])
H2=fftn(h2,[M N]);
IM2=IM1.*H2;%multiplicacion en freq
figure,imshow(mat2gray(ifft2(IM2)))
h3=fspecial('laplacian');
im5=imfilter(im1,h3);
figure, imshow(mat2gray(im5))