clear all;
close all;

clc;

img = imread('4.jpg');
figure, imshow(img);
res = ruleOfThirds(img);
if (res == true)
    disp('The input image satisfies the rule of thirds');
else
    disp('The input image does not satisfy the rule of thirds');
end
