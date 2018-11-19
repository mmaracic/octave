#samples
#x=[0 1; 0 2; 0 0];
x=[0 0 1 0 1; 0 0 0 0 0; 0 0 4 0 2];
#classes
#cl= [1 -1 -1];
cl=[1 -1 -1];
#decision
#w = [1; 1; 1];
w=[1; 1; 1; 1; 1; 1];
#learning constant
c = 1;

#expanding and multiplying with class
xsam = ones(size(x) + [0 1]);
for i=1:size(x)(1)
  xsam(i,1:size(x)(2))=x(i,:);
  xsam(i,:)=xsam(i,:)*cl(i);
endfor

function result=correction(x, w)
  #criterion function
  #result=0.125*2*x*(w'*x - abs(w'*x))*(1- sign(w'*x));
  #perceptron
  if (w'*x<=0)
    result = x;
  else
    result = zeros(size(x));
  endif
endfunction

function result = wasCorrection(w, correction, sampleNo)
  if (abs(sum(sum(correction))) > 0)
    result = 1;
    printf("There was correction in sample %d\n",sampleNo);
    correction
  else
    result = 0;
  endif
endfunction


epoch=1;
w
while(1)
  epoch
  #iteration through samples
  wasCorr = 0;
  for i=1:size(x)(1)
    sample=xsam(i,:);
    corr = correction(sample',w);
    wasCorr += wasCorrection(w, corr, i);
    #for criterion function -, for perceptron +
    w = w + c*corr;
  endfor
  if (wasCorr==0)
    break;
  endif
  if (epoch>10)
    printf("Too many epochs %d\n",epoch);
    break;
  endif;
  epoch++;
endwhile;
printf("Done. Epochs:%d\n",epoch);
w
