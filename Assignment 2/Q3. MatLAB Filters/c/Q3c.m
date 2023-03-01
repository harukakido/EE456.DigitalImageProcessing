clear;
A = imread('noisy_img.png');

B = medfilt2(A, [5 5]);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);

