function [C,lengths,L,H] = huffman(p)
%
% Usage:  [C,lengths,L,H] = huffman(p)
%    p is a vector of probabilities 
%    C is the obtained Huffman code (in a cell array)
%    L is the expected value of the length of the obtained code
%    H is the entropy of the source
%    
%
% builds a Huffman code from the probablity vector p
% This function is just an interface for the 
% function huff.m which obtains the Huffman code 
% using a recursive procedure. This is not intended
% to be a computationally efficient approach; it's
% purpose is educational, to illustrate the recursive
% nature of Huffman's algorithm.
%
% The result is returned in a cell array of strings
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
%

% firs, we need to find the length of p, and check 
% that it is a vector
[r , c] = size(p);
if (r~=1)&(c~=1)
   disp('Error: p is not a vector of probabilities');
   C = {''};
   return
else
   % here, we find the length of the vector
   nn = max(r,c);
end

% now we need to check is all probabilities are non-negative
if (min(p)<0)
   disp('Error: negative probabilities');
   C = {''};
   return
end

% now we check if the probablities sum to one
if (abs(sum(p) - 1.0) > eps)
   disp('Warning: probabilities not normalized!')
   disp('I will normalize them')
   p = p/sum(p);
end
   
% Now we can start.
% We simply call huff, which proceeds recursively
C = huff(p);

% Now we can compute the length of each code word
for i=1:length(C)
    lengths(i) = length(char(C(i)));
end

% and the expected value of the length
L = sum(p(:).*lengths(:));

% finally, we compute the source entropy
H = -sum(log2(p).*p);

