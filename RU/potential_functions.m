#samples
#x=[0 0; 1 1; 0 1; 1 0];
x = [0 -1; 0 0; 0 1]
#classes
#cl= [1 1 -1 -1];
cl= [-1 1 -1];
#criterion function constant
alpha = 1;

function coeffs=correction(x, xindex, cl, coeffs, alpha)
  current = evaluateFunction(coeffs, alpha, x)
  sampleClass = cl(xindex);
  if (sampleClass==1 && current<=0)
    coeffsrow=zeros([1 size(x)(2)+1]);
    coeffsrow(1) = 1;
    coeffsrow(2:size(coeffsrow)(2))=x;
    coeffs = [coeffs; coeffsrow]
    printf("There was correction in sample %d\n",xindex);
  elseif (sampleClass==-1 && current>=0)
    coeffsrow=zeros([1 size(x)(2)+1]);
    coeffsrow(1) = -1;
    coeffsrow(2:size(coeffsrow)(2))=x;
    coeffs = [coeffs; coeffsrow]    
    printf("There was correction in sample %d\n",xindex);
  endif
endfunction

function value = evaluateFunction(coeffs, alpha, x)
  value = 0;
  for i=1:size(coeffs)(1)
    component = coeffs(i,:);
    compsum = 0;
    for j = 2:size(component)(2);
      compsum+=((x(j-1)-component(j)))^2;
    endfor
    value += component(1)*e^(-alpha*compsum);
  endfor
endfunction


epoch=1;
coeffs= [];
#result of a potential function
#row has n+1 conponents, signum and n components depending on sample size
while(1)
  epoch
  #iteration through samples
  wasCorr = 0;
  for i=1:size(x)(1)
    sample=x(i,:);
    coeffsRows = size(coeffs)(1);
    coeffs = correction(sample,i,cl,coeffs,alpha);
    wasCorr += size(coeffs)(1) - coeffsRows;
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
coeffs
