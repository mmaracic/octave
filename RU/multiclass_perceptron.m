#samples
x=[0 2; 2 0; 0 -2];
#classes
cl=[1 2 3];
#decision
w = [0; 0; 0];
#learning constant
c = 1;

#expanding
xsam = ones(size(x) + [0 1]);
for i=1:size(x)(1)
  xsam(i,1:size(x)(2))=x(i,:);
endfor
xsam

#creating multiple decision functions
wmultiple = zeros([size(w)(1) max(cl)]);
for i=1:size(x)(2)
  wmultiple(:,i) = w;
endfor
wmultiple

function [result, wmultiple] =correction(x, sampleIndex, wmultiple, cl, c)
  result=0
  sampleClass = cl(sampleIndex)
  sampleValue = wmultiple(:,sampleClass)'*x'
  correctClass=0;
  for i=1:size(wmultiple)(2)
    if (i!=sampleClass)
      value = wmultiple(:,i)'*x'
      if (value>=sampleValue)
        result = 1;
        correctClass = 1;
        printf("There was correction in sample %d, class %d\n",sampleIndex, i);
        wmultiple(:,i) = wmultiple(:,i) - c*x';
      endif
    endif
  endfor
  if (correctClass == 1)
      printf("There was correction in sample %d, true class %d\n",sampleIndex, sampleClass);
      wmultiple(:,sampleClass) = wmultiple(:,sampleClass) + c*x';
      wmultiple
  endif
endfunction

epoch=1;
while(1)
  epoch
  #iteration through samples
  wasCorr = 0;
  for i=1:size(x)(1)
    sample=xsam(i,:);
    [corr, wmultiple] = correction(sample, i, wmultiple, cl, c);
    wasCorr += corr;
    #for criterion function -, for perceptron +
  endfor
  if (wasCorr==0)
    break;
  endif
  if (epoch>5)
    printf("Too many epochs %d\n",epoch);
    break;
  endif;
  epoch++;
endwhile;
printf("Done. Epochs:%d\n",epoch);
wmultiple
