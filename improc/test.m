%reference
%graph example - https://octave.sourceforge.io/octave/function/text.html
%3d plot - http://www.malinc.se/math/octave/threeden.php
%filtering - http://nullprogram.com/blog/2008/02/22/

%startup
close all;
pkg load image;
clc;

%test on image processing functions
I = imread('rose-flower.jpeg');
fig1 = figure(1);
set(fig1,'name', 'Original image'); %Window name
imshow(I);
title('Original image'); %Figure title, set after drawing

%grayscale
G1 = rgb2gray(I);
fig2 = figure(2);
set(fig2,'name', 'Grayscale image');
imshow(G1);
colorbar(); %Figure colorbar, set after drawing
title('Grayscale image') %Figure title, set after drawing
s2 = size(G1);
axis ([0 s2(2)+1 0 s2(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');
 
%fourier
I1 = fft2(G1);
fig3 = figure(3);
set(fig3,'name', 'Fourier transform');
I2 = log(abs(I1));
minI2 = min(min(I2));
maxI2 = max(max(I2));
imagesc(fftshift(I2));
colormap('jet');
colorbar('westoutside');
title('Fourier transform');
s3 = size(I2);
axis ([0 s3(2)+1 0 s3(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');

%mask
mask_size = 11;
f_gauss = fspecial("gaussian", mask_size, 3);

fig4 = figure(4);
set(fig4,'name', 'Gauss filter');

x=linspace(1,mask_size,mask_size);
y=linspace(1,mask_size,mask_size);
[xx,yy]=meshgrid(x,y);
mesh(xx,yy,f_gauss);

colorbar(); %Figure colorbar, set after drawing
title('Gauss filter') %Figure title, set after drawing
s4 = size(f_gauss);
axis ([0 s4(2)+1 0 s4(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');

%fourier of the mask
M1 = fft2(f_gauss);
fig5 = figure(5);
set(fig5,'name', 'Mask Fourier transform');
M2 = log(abs(M1));
imagesc(fftshift(M2));
colormap('jet');
colorbar('westoutside');
title('Mask Fourier transform');
s5 = size(M2);
axis ([0 s5(2)+1 0 s5(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');

%filtering
F1 = conv2(I1,M1);

%filtered fourier domain
fig6 = figure(6);
set(fig6,'name', 'Filtered Fourier transform');
F2 = log(abs(F1));
imagesc(fftshift(F2));
colormap('jet');
colorbar('westoutside');
title('Filtered Fourier transform');
s6 = size(F2);
axis ([0 s6(2)+1 0 s6(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');

%filtered original
I3 = ifft2(I1);
I4 = log(abs(I3));

fig7 = figure(7);
set(fig7,'name', 'Filtered Original image');
imagesc(I4);
colormap('jet');
colorbar('westoutside');
title('Filtered Original image');
s7 = size(I4);
axis ([0 s7(2)+1 0 s7(1)+1]);
xlabel ('X axis');
ylabel ('Y axis');
