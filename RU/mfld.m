#mfld
#broj uzoraka manji ili jednak od dimenzionalnosti uzoraka, inaèe SW singularna
x1=[2 -2;4 -4]
x2=[4 0; 6 0]
x3=[0 -2; 0 -4]
m1 = sum(x1./2)
m2 = sum(x2./2)
m3 = sum(x3./2)
m = (m1.*2+m2.*2+m3.*2)./6
s1temp = x1 - repmat(m1,2,1)
s2temp = x2 - repmat(m2,2,1)
s3temp = x3 - repmat(m3,2,1)

s1 = s1temp' * s1temp
s2 = s2temp' * s2temp
s3 = s3temp' * s3temp
sw=s1+s2+s3

sb = 2.*(m1-m)'*(m1-m)+2.*(m2-m)'*(m2-m)+2.*(m3-m)'*(m3-m)

d=det(sw)
swinv = inv(sw)
[v, lambda, w] = eig(sw*sb)
y1=x1*w(:,2)
y2=x2*w(:,2)
y3=x3*w(:,2)