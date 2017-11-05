function C = huff(p)
%
% recursive function that computes the Huffman
% code corresponding to the probabilities in vector p.
% This is not intended % to be a computationally efficient 
% approach; it's purpose is educational, to illustrate the 
% recursive nature of Huffman's algorithm.
%
% Writen by: Mario Figueiredo
%            Instituto de Telecomunicacoes
%            Instituto Superior Tecnico
%            1049-001 Lisboa
%            Portugal

%
%            EMail:  mario.figueiredo@lx.it.pt
%
%            December 1999, October 2005.

if length(p) == 2
   % if the size of p is 2, the answer is trivial
   C = {'0','1'};
else
   % if the size of p is not 2, we must start by finding
   % the two smallest probabilities. We do this we the help
   % of the 'sort' function.
   % The two smallest values will be p(ind(1)) and p(ind(2))
   %
   [psort , ind] = sort(p);
   
   % Then, we need to find which of these two smallest values
   % occured first in the vector.
   first = min(ind(1),ind(2));
   second = max(ind(1),ind(2));
   
   % Now we build a new vector of probabilities, called paux, with 
   % length(p)-1 elements. 
   % The two smallest probabilities in p will be combined
   % and stored in paux(first)
   % Example: if  p=[0.2 0.1 0.2 0.05 0.2 0.25], 
   %          the two smallest probabilities are 0.1 and 0.05, and
   %          paux = [0.2 0.15 0.2 0.2 0.25]
   %
   paux(first) = psort(1) + psort(2);
   paux(1:first-1) = p(1:first-1);
   paux(first+1:second-1) = p(first+1:second-1);
   paux(second:length(p)-1) = p(second+1:length(p));
   
   % Now we ask for the Huffman code for this smaller
   % vector. For this purpose, we simply call the function itself,
   % which will return an optimal code for this smaller vector.
   Caux = huff(paux);
   
   % Now, we have the Huffman code for the vector of probabilities
   % paux, where the two smallest values in p where collapsed into a 
   % single value (a "super-symbol").
   % To obtain the Huffman code for the full vector p, we simply
   % have to split the "super-symbol" into its two original components,
   % and append '0' and '1' to their codewords
%    C(1:first-1) = Caux(1:first-1);
%    C(first) = cellstr(strcat(Caux(first),'0'));
%    C(first+1 : second-1) = Caux(first+1 : second-1);
%    C(second) = cellstr(strcat(Caux(first),'1'));
%    C(second+1:length(p)) = Caux(second:length(p)-1);
   C(1:second-1) = Caux(1:second-1);
   C(first) = cellstr(strcat(C(first),'0'));
   C(second) = cellstr(strcat(Caux(first),'1'));
   C(second+1:length(p)) = Caux(second:length(p)-1);
 end

 % That's it! 
 