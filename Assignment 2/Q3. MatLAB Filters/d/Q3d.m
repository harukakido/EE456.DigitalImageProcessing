clear;
A = imread('lena_gray.jpg');

B = imsharpen(A);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);
