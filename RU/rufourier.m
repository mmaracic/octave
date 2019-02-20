#Fourier

x=[2 3 4 1 2 2 6 4]

function [R,I]=rufourier_matrix(d)
  R=zeros(d);
  I=zeros(d);
  for i=0:d-1
    for j=0:d-1
      c=e^(-i*(2*pi/d)*i*j)
      R(j+1,i+1) = real(c)
      I(j+1,i+1) = imag(c)      
    endfor
  endfor
endfunction

[R,I] =rufourier_matrix(8)
#y=F*x'
#rez=y(1:4)

