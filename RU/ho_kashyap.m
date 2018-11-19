#samples
x=[0 2; -2 0; 0 -2; 2 0];
#x=[1 0; 0 1; -1 0; 0 -1]; #Fratricev primjer
#classes
cl= [1 1 -1 -1];
#learning constant
c = 1;
#constant vector - positive
b = [1; 1; 1; 1];

#expanding and multiplying with class
xsam = ones(size(x) + [0 1]);
for i=1:size(x)(1)
  xsam(i,1:size(x)(2))=x(i,:);
  xsam(i,:)=xsam(i,:)*cl(i);
endfor
xsam

#generalised inverse
multipl = xsam'*xsam
multiplInv = inv(multipl)
genInv = multiplInv*xsam'

function result = wasCorrection(correction)
  corrAmount  = sum(sum(abs(correction)));
  if (corrAmount > 0)
    result = 1;
    printf("There was correction %g\n",corrAmount);
    correction
  else
    result = 0;
  endif
endfunction


epoch=1;
while(1)
  epoch
  w = genInv*b;
  e = xsam * w - b;
  if (wasCorrection(e)==0)
    break;
  else
    b = b+c*(e+abs(e));
  endif
  if (epoch>20)
    printf("Too many epochs %d\n",epoch);
    break;
  endif;
  epoch++;
endwhile;
printf("Done. Epochs:%d\n",epoch);
w
