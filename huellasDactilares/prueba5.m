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
im11=~im10;


%se crea una matrix de 3x3
parte=ones(3);
%%se crea una matriz con valores logicos para marcar las posiciones que
%%posean minucias.
mascara=ones(size(im1));
%%%%acontinuacion se definen los elementos esctructurantes que usaremos
%%%%para definir minucias
min1=ones(3);
min1(1,1)=0; min1(2,2)=0; min1(3,3)=0; min1(1,3)=0;
min2=ones(3);
min2(1,1)=0; min2(2,2)=0; min2(3,3)=0; min2(3,1)=0;
min3=ones(3);
min3(1,3)=0; min3(2,2)=0; min3(3,3)=0; min3(3,1)=0;
min4=ones(3);
min4(1,3)=0; min4(2,2)=0; min4(1,1)=0; min4(3,1)=0;
min5=ones(3);
min5(1,1)=0; min5(1,3)=0; min5(2,2)=0; min5(3,2)=0;
min6=ones(3);
min6(3,1)=0; min6(3,3)=0; min6(2,2)=0; min6(1,2)=0;
min7=ones(3);
min7(1,1)=0; min7(2,2)=0; min7(2,3)=0; min7(3,2)=0;
min8=ones(3);
min8(1,2)=0; min8(2,2)=0; min8(3,1)=0; min8(2,3)=0;
min9=ones(3);
min9(1,2)=0; min9(2,1)=0; min9(3,2)=0; min9(2,3)=0;
min10=ones(3);
min10(1,3)=0; min10(2,1)=0; min10(2,2)=0; min10(3,2)=0;
min11=ones(3);
min11(1,2)=0; min11(2,1)=0; min11(2,2)=0; min11(3,3)=0;
min12=ones(2,3);
min12(1,2)=0; min12(2,1)=0; min12(2,3)=0;
min13=ones(2,3);
min13(1,1)=0; min13(2,2)=0; min13(1,3)=0; 
min14=ones(3);
min14(1,1)=0; min14(3,1)=0; min14(2,2)=0; min14(2,3)=0;
min15=ones(3);
min15(2,1)=0; min15(2,2)=0; min15(1,3)=0; min15(3,3)=0;
min16=ones(3,2);
min16(1,1)=0; min16(2,1)=0; min16(3,2)=0; min16(1,2)=0;
min17=ones(3,2);
min17(1,1)=0; min17(1,2)=0; min17(2,2)=0; min17(3,1)=0;
min18=ones(3);
min18(1,1)=0; min18(1,2)=0; min18(1,3)=0; min18(2,2)=0; min18(3,1)=0;

%%se procedera a recorrer la imagen , para descomponera en elementos de 3x3
%%los cuales se compararan con las minucias
[m,n]=size(im11);
contador=0;
conteoE1=0;conteoE2=0;conteoE3=0;conteoE4=0;conteoE5=0;conteoE6=0;
conteoE7=0;conteoE8=0;conteoE9=0;conteoE10=0;conteoE11=0;conteoE12=0;
conteoE13=0;conteoE14=0;conteoE15=0;conteoE16=0;conteoE17=0;conteoE18=0;

for i=1:m-10
    for j=1:n-50
%%se rellena una matriz de 3x3 por cada pixel que se recorra
         for h=1:3
            for k=1:3
               parte(h,k)=im11(i+h,j+k);
            end
         end
         %%%los valores a,b,d,e,f determina cunado una minucia coincide con
         %%%lo almancenado en la matriz "parte" que corresponde a una parte
         %%%de la imagen recortada con dimensiones de 3x3
         e1=isequal(parte,min1);
         e2=isequal(parte,min2);
         e3=isequal(parte,min3);
         e4=isequal(parte,min4);
         e5=isequal(parte,min5);
         e6=isequal(parte,min6);
         e7=isequal(parte,min7);
         e8=isequal(parte,min8);
         e9=isequal(parte,min9);
         e10=isequal(parte,min10);
         e11=isequal(parte,min11);
         e12=isequal(parte,min12);
         e13=isequal(parte,min13);
         e14=isequal(parte,min14);
         e15=isequal(parte,min15);
         e16=isequal(parte,min16);
         e17=isequal(parte,min17);
         e18=isequal(parte,min18);
         if(e1==true), conteoE1 = conteoE1+1;end
         if(e2==true), conteoE2 = conteoE2+1;end
         if(e3==true), conteoE3 = conteoE3+1;end
         if(e4==true), conteoE4 = conteoE4+1;end
         if(e5==true), conteoE5 = conteoE5+1;end
         if(e6==true), conteoE6 = conteoE6+1;end
         if(e7==true), conteoE7 = conteoE7+1;end
         if(e8==true), conteoE8 = conteoE8+1;end
         if(e9==true), conteoE9 = conteoE9+1;end
         if(e10==true), conteoE10 = conteoE10+1;end
         if(e11==true), conteoE11 = conteoE11+1;end
         if(e12==true), conteoE12 = conteoE12+1;end
         if(e13==true), conteoE13 = conteoE13+1;end
         if(e14==true), conteoE14 = conteoE14+1;end
         if(e15==true), conteoE15 = conteoE15+1;end
         if(e16==true), conteoE16 = conteoE16+1;end
         if(e17==true), conteoE17 = conteoE17+1;end
         if(e18==true), conteoE18 = conteoE18+1;end
         
         if(e1==true||e2==true||e3==true||e4==true||e5==true...
                 ||e6==true||e7==true||e8==true||e9==true...
                 ||e10==true||e11==true||e12==true||e13==true...
                 ||e14==true||e15==true||e16==true||e17==true||e18==true)
            %%contador indica el numero de minucias en total
             contador=contador+1;
             mascara(i+1,j+1)=false;
             line([j-1,j+1+2],[i+1+2,i+1-2],'Color','red','Marker','.')
             line([j,j+1+1],[i,i+1+1],'Color','red','Marker','.')
         end
    end
end
%%se crea un vector que contiendra las coordenadas de cada miinucia ubicada

figure, imshow(mascara);
post=ones([2,contador]);
post=post.';
%%se procede a rrecorrer la matriz mascara para asi donde haya un uno
%%almacenar la posicion 
cont=0;
%%se determina de forma manuel el centro de la huella 
%%posicion donde hya un cetro ubicado en mascara135 178
for i=1:m-50
    for j=1:n-50
        opcional=mascara(i,j);
        if(opcional==0)
            cont=cont+1;
            X =[145,144;i,j];
            distancia = pdist(X,'euclidean');
            angulo=atan(j/i)*180/pi;
            post(cont,1)=distancia;
            post(cont,2)=angulo;
        end
    end
end
post
