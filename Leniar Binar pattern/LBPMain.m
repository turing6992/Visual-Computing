close all;
clear all;
clc;

img = imread('ud1.jpg');
feat = lbp(img);
figure, bar(feat);


img = imread('vatican.jpg');
feat = lbp(img);
figure, bar(feat);


img = imread('tower.jpg');
feat = lbp(img);
figure, bar(feat)