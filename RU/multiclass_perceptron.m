#samples
x=[0 2; 2 0; 0 -2];
#classes
cl=[1 2 3];
#decision
w = [1; 1; 1];
#learning constant
c = 1;

#expanding and multiplying with class
xsam = ones(size(x) + [0 1]);
for i=1:size(x)(1)
  xsam(i,1:size(x)(2))=x(i,:);
endfor

#creating multiple decision functions
wmultiple = zeros([size(w)(1) max(cl)]);
for i=1:size(x)(2)
  wmultiple(:,i) = w;
endfor
wmultiple;

function result=correction(x, sampleIndex, wmultiple, cl, c)
  result=0
  classAssign = wmultiple'*x';
  sampleClass = cl(sampleIndex);
  for i=1:size(wmultiple)(2)
    if (i==sampleClass && classAssign(sampleClass)<=0)
      result = 1;
      printf("There was correction in sample %d\n",sampleIndex);
      wmultiple(:,i) = wmultiple(:,i) + c*x';
      wmultiple
    elseif (i!=sampleClass && classAssign(sampleClass)>0)
      result = 1;
      printf("There was correction in sample %d\n",sampleIndex);
      wmultiple(:,i) = wmultiple(:,i) - c*x';
      wmultiple
    endif
  endfor
endfunction

epoch=1;
w
while(1)
  epoch
  #iteration through samples
  wasCorr = 0;
  for i=1:size(x)(1)
    sample=xsam(i,:);
    wasCorr += correction(sample, i, wmultiple, cl, c);
    #for criterion function -, for perceptron +
  endfor
  if (wasCorr==0)
    break;
  endif
  if (epoch>20)
    printf("Too many epochs %d\n",epoch);
    break;
  endif;
  epoch++;
endwhile;
printf("Done. Epochs:%d\n",epoch);
w
