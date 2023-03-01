clear;
A = imread('cameraman.tif');

sobelhfilterA = fspecial('sobel');
B = imfilter(A, sobelhfilterA);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);

