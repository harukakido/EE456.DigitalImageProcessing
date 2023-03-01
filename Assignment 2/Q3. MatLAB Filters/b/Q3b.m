clear;
A = imread('lena_gray.jpg');

gaussianfiltA = fspecial('gaussian', 7, 5);
B = imfilter(A, gaussianfiltA);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);



