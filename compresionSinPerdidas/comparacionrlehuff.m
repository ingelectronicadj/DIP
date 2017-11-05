clear all, close all;
for i=1:7
tamano(i,1) = RLE_relacion(i);
tamano(i,2) = huffman_relacion(i);
end
disp(tamano)