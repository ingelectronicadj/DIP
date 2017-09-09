clear all; clc; close all;
I = imread('handicapSign.jpg');
roi = [360 118 384 560];

ocrResults = ocr(I, roi);
Iocr = insertText(I,roi(1:2),ocrResults.Text,'AnchorPoint','RightTop','FontSize',16);
figure; imshow(Iocr);