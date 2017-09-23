% ALGORITMO DE RELLENO

for k=1:100
    Xk1=and(imdilate(Xk,sel),not(im6));
    figure(3),imshow(Xk1);
    xlabel(num2str(k));
    %pause;
    sum(sum(xor(Xk,Xk1)))
    if (sum(sum(xor(Xk,Xk1)))==0)
        
        break;
    end
    Xk=Xk1;
end