clear all
im1= imread('images/FigurasGeometricasDiferentes.png'); %FigurasGeometricasGrandes.png ImagenFlorAgapanto.png
figure, imshow(im1,[]);
mi= min(min(im1));
ma= max(max(im1));

[f,c]=size(im1);

h(1:(ma+1)) = 0;

for i=1:f
       for j=1:c
           k = im1(i,j);
           h(k+1) = h(k+1)+1;
       end
end
figure, plot(h);
vmax= max(h((mi+1):(ma+1)));
valfmax= find(h==vmax);
hcopia= h;

for i=1:(ma+1)
   D(i)= 0;
end   
p= 1;
while vmax>0
  
  valfmaxd= valfmax(1);
    
  D(valfmaxd)= p;
  h(valfmaxd)= 0;
  p= p+1; 
  vmax= max(h((mi+1):(ma+1)));
  valfmax= find(h==vmax);
end


for i=1:f
       for j=1:c
           k = im1(i,j);
           improb(i,j)= D(k+1);
       end
end

map= max(max(improb));
hp(1:(map)) = 0;
 
for i=1:f
       for j=1:c
           k = improb(i,j);
           hp(k) = hp(k)+1;
       end
end
figure, plot(hp);
thpx= size(hp);
thp= thpx(2);
tablax(1,(1:thp))= hp/sum(hp);   
tablax2((1:(thp-2)),(1:thp))= 0; 
r= 1;
 for i=2:(thp-1); 
    tablax(i,(1:thp))= tablax((i-1),(1:thp));
 
    tablax(i,(thp+1-i))= (tablax((i-1),(thp+2-i)))+(tablax((i-1),(thp+1-i)));
    tablax(i,(thp+2-i))= 0;
    
    [tablax(i,(1:thp)),tablaxI(i,(1:thp))]= sort(tablax(i,(1:thp)),'descend');
    estado= 0;
    for j=1:(thp-1)
       a= tablaxI(i,j);
       b= tablaxI(i,(j+1));
       if (((b-a)>=2))&&(estado==0)
           ps= j+1;
           estado= 1;
       end 
       if (((a-b)>=1))&&(estado==0)
           ps= j;
           estado= 1;
       end 
       if (estado==0)&&(j==(thp-1))
          ps = thp+1-i; 
       end    
    end    
    tablax2((i-1),(thp+1-i))= ps;
    tablax2((i-1),(thp+2-i))= ps;
 end
 
 tablax3((1:(thp-1)),(1:thp))= 0;
 tablax3((thp-1),1)= 1;
 tablax3((thp-1),2)= 8;
 for i=0:(thp-3)
   
    estado= 0;
    ps= 0;
    for j=1:(thp-1)
       a= tablaxI((thp-1-i),j);
       b= tablaxI((thp-1-i),(j+1));
       if (((b-a)>=2))&&(estado==0)
           ps= j+1;
           estado= 1;
       end 
       if (((a-b)>=1))&&(estado==0)
           ps= j;
           estado= 1;
       end 
       if (estado==0)&&(j==(thp-1))
          ps = thp+1-i; 
       end    
    end   
    tablax3((thp-2-i),(1:ps))= tablax3((thp-1-i),(1:ps));
    tablax3((thp-2-i),(ps:i+1))= tablax3((thp-1-i),((ps+1):i+2));
    
    a= tablax2((thp-2-i),(i+2));
    COD= tablax3((thp-1-i),a);
    tablax3((thp-2-i),(i+2))= (COD*10)+1;
    tablax3((thp-2-i),(i+3))= (COD*10)+8;
   
 end    
 
 veccodif= tablax3(1,(1:thp));
for i=1:thp
    nx(i)= numel(find(veccodif==tablax3(1,i)));
end
pos= 1;
for i=1:f
       for j=1:c
           k = improb(i,j);
           vecimg(pos)= veccodif(k);
           pos= pos+1;
       end
end

[t,z]= size(vecimg);


for i=1:z
    u= vecimg(1,i);
    ustr= num2str(u);
    vecimg(2,i)= length(ustr);
end    
tamanobits= sum(vecimg(2,(1:z)));
tamanobits



    

