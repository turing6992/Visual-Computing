close all;
clear all;
clc;
%read image
img = imread('deer.jpg');
figure, imshow(img);
%apply gaussian kernel
gaussian_kernel = fspecial('gaussian', [25 25], 5);
img_gaussian = imfilter(img, gaussian_kernel, 'replicate');
figure, imshow(img_gaussian);

%Convert image to lab format
lab = rgb2lab(img_gaussian);

imshow(lab);

%compute factors L & A & B seprately
l = double(lab(:,:,1));
lm = mean(mean(l));

a = double(lab(:,:,2));
am = mean(mean(a));

b = double(lab(:,:,3));
bm = mean(mean(b));

%Compute saliency map for the image
sm = (l-lm).^2 + (a-am).^2 + (b-bm).^2;
figure, imshow(sm,[]);

%computing binary map 
mean_value = mean(sm(:));
sm(sm < 0.9 * mean_value) = 0;
sm(sm >= 0.9 * mean_value) = 1;
figure, imshow(sm,[]);

%Extracting salient portions of the image

for c = 1:3
img(:,:,c) = img(:,:,c) .* uint8(sm);
end
figure, imshow(img);

