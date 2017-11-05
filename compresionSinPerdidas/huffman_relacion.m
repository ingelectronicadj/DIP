function relacioncompresion = huffman_relacion(numero)

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

vectorprobabilidad = imhist(imagen);
vectorprobabilidadNormalizado = vectorprobabilidad / max(vectorprobabilidad);%vector normalizado
[C,len,L,H] = huffman(vectorprobabilidadNormalizado);
%calculo de compresion
tamanosincompresion = sum(vectorprobabilidad) * log2(length(vectorprobabilidad));
tamanocomprimida = len*vectorprobabilidad;
figure, imshow(imagen);
relacioncompresion = tamanosincompresion/tamanocomprimida
