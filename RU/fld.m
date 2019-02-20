#broj uzoraka manji ili jednak od dimenzionalnosti uzoraka, inaèe SW singularna
x1=[1 0 1; 2 1 1]
x2=[0 1 1; 1 2 1]
m1 = sum(x1./3)
m2 = sum(x2./3)
s1temp = x1 - repmat(m1,2,1)
s2temp = x2 - repmat(m2,2,1)
s1 = s1temp' * s1temp
s2 = s2temp' * s2temp
sw=s1+s2
d=det(sw)
swinv = inv(sw)
w=swinv*(m1'-m2')
[V, lambda, W] = eig(sw)
y1=x1*w
y2=x2*w