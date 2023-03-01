clear;
A = imread('cameraman.tif');

sobelhfilterA = fspecial('sobel');
sobelvfilterA = transpose(sobelhfilterA);
B = imfilter(A, sobelvfilterA);

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(B);



