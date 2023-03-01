clear;
A = imread('lena_gray.jpg');

avgfilterA = fspecial('average', 7);
B = imfilter(A, avgfilterA);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);

