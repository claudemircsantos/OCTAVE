## Copyright (C) 2022 Instituto Poincaré
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## Author: Claudemir Costa Santos claudemircsantos@gmail.com
## Created: 20-abril-2022


% Carrega biblioteca 'image'
pkg load image;

% Carrega imagem para variável I
I = imread('impressao.tif');

%Extrai o tamanho da matriz I
[m n] = size(I);

%Inverte os tons de cinza, cria um negativo da imagem
I = 255-I;

%Binariza a imagem I
binarizado = im2bw(I);

%Reduz a espessura das linha e novamente cria um negativo 
ex=bwmorph(binarizado,'thin',inf);
ex=imcomplement(ex);
rcb=ex;

%Cria uma barra de progresso
h=waitbar(0,"Processando...");

%Corre a imagem e cria janelas para investigar por minúcias
for i=1:m-2
  for j=1:n-2

%Esta janela será comparada com o padrão de minúcia  
janelah = [ex(i,j) ex(i,j+1) ex(i,j+2) ; ex(i+1,j) ex(i+1,j+1) ex(i+1,j+2)];

 if ((janelah(1,1)==1) && (janelah(1,2)==0) && (janelah(1,3)==1) && ... 
   (janelah(2,1)==0) && (janelah(2,2)==0)   && (janelah(2,3)==0)) || ...
   % próxima minúcia
   ((janelah(1,1)==0) && (janelah(1,2)==0) && (janelah(1,3)==0) && ...
   (janelah(2,1)==1) && (janelah(2,2)==0)  && (janelah(2,3)==1)) || ... 
   % próxima minúcia
   ((janelah(1,1)==0) && (janelah(1,2)==1) && (janelah(1,3)==1) && ... 
   (janelah(2,1)==0) && (janelah(2,2)==0)   && (janelah(2,3)==0)) || ...
   % próxima minúcia
   ((janelah(1,1)==0) && (janelah(1,2)==0) && (janelah(1,3)==0) && ... 
   (janelah(2,1)==0) && (janelah(2,2)==1)   && (janelah(2,3)==1)) || ...
   % próxima minúcia
   ((janelah(1,1)==1) && (janelah(1,2)==1) && (janelah(1,3)==0) && ... 
   (janelah(2,1)==0) && (janelah(2,2)==0)   && (janelah(2,3)==0)) || ...
   % próxima minúcia
   ((janelah(1,1)==0) && (janelah(1,2)==0) && (janelah(1,3)==0) && ... 
   (janelah(2,1)==1) && (janelah(2,2)==1)   && (janelah(2,3)==0)) 
   
    if (i>2) && (j>4)
 %Desenha os losangos nas minúcias encontradas 
  I(i-2,j-2)=255; I(i-1,j-1)=255; I(i,j)=255;     I(i+1,j-1)=255; I(i+2,j-2)=255;
  I(i+1,j-3)=255; I(i,j-4)=255;   I(i-1,j-3)=255;
  rcb(i-2,j-2)=0; rcb(i-1,j-1)=0; rcb(i,j)=0; rcb(i+1,j-1)=0;rcb(i+2,j-2)=0;
  rcb(i+1,j-3)=0; rcb(i,j-4)=0;  rcb(i-1,j-3)=0;
    endif
 endif 

%Esta janela será comparada com o padrão de minúcia, ela é vertical
janelav = [ex(i,j) ex(i,j+1); ex(i+1,j) ex(i+1,j+1); ex(i+2,j) ex(i+2,j+1)];

 if ((janelav(1,1)==0) && (janelav(1,2)==1) && ...
     (janelav(2,1)==0) && (janelav(2,2)==0) && ...
     (janelav(3,1)==0) && (janelav(3,2)==1)) || ...
      % próxima minúcia
    ((janelav(1,1)==1) && (janelav(1,2)==0) && ...
     (janelav(2,1)==0) && (janelav(2,2)==0) && ...
     (janelav(3,1)==1) && (janelav(3,2)==0)) || ...
     % próxima minúcia
     ((janelav(1,1)==0) && (janelav(1,2)==0) && ...
     (janelav(2,1)==0) && (janelav(2,2)==1) && ...
     (janelav(3,1)==0) && (janelav(3,2)==1)) || ...
      % próxima minúcia
    ((janelav(1,1)==0) && (janelav(1,2)==0) && ...
     (janelav(2,1)==1) && (janelav(2,2)==0) && ...
     (janelav(3,1)==1) && (janelav(3,2)==0)) || ...
   % próxima minúcia
     ((janelav(1,1)==1) && (janelav(1,2)==0) && ...
     (janelav(2,1)==1) && (janelav(2,2)==0) && ...
     (janelav(3,1)==0) && (janelav(3,2)==0)) || ...
      % próxima minúcia
    ((janelav(1,1)==0) && (janelav(1,2)==1) && ...
     (janelav(2,1)==0) && (janelav(2,2)==1) && ...
     (janelav(3,1)==0) && (janelav(3,2)==0))
     
    if (i>2) && (j>4)
    I(i-2,j-2)=255;I(i-1,j-1)=255;I(i,j)=255;I(i+1,j-1)=255;I(i+2,j-2)=255;
  I(i+1,j-3)=255; I(i,j-4)=255;  I(i-1,j-3)=255;
  
  rcb(i-2,j-2)=0;rcb(i-1,j-1)=0;rcb(i,j)=0;rcb(i+1,j-1)=0;rcb(i+2,j-2)=0;
  rcb(i+1,j-3)=0; rcb(i,j-4)=0;  rcb(i-1,j-3)=0;

     endif

   endif 
    
   endfor
waitbar(i/(m-1),h,"Processando ...");
endfor


% Encerra a barra de progresso
delete(h);

subplot(1,2,1), imshow(rcb);
subplot(1,2,2), imshow(I);




