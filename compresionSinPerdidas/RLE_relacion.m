function relacioncompresion = RLE_relacion(numero)

switch numero
    case 1 
        imagen =  imread('images/Texto_Impreso_Binario_384x512.png');
   
    case 2 
        imagen = imread('images/Racimo_Flores_Grises_384x512.png');
   
    case 3 
        imagen = imread('images/Sede_Central_Grises_384x512.png');
   
    case 4 
        imagen =  imread('images/TextoManuscritoBinario2.png');
          
    case 5 
        imagen = imread('images/Mamografia_Grises_384x512.png');
    case 6 
        imagen = imread('images/Avion_Volando_Grises_384x512.png');
    case 7
        imagen = imread('images/HuellaDigitalBinaria_384x512.png');
        
    end

DATA = rle(imagen);
[L1,L2]=size(DATA{1});
[L3,L4]=size(DATA{2});
bits = log2(double(max(DATA{1})));
bits2 = round(log2(double(max(DATA{2}))));

tamanototal = L2*bits + L4*bits2;
[x y]= size(imagen);
if max(max(double(imagen))) == 1
tamanoreal = x*y;

else
tamanoreal = x*y * round(log2(max(max(double(imagen)))));
    
end
%calculo de compresion
tamanosincompresion = tamanoreal;
tamanocomprimida = tamanototal;
figure, imshow(imagen);
relacioncompresion = tamanosincompresion/tamanocomprimida
