clear;
A = imread("pout.tif");
subplot(2, 2, 1);
imshow(A);
subplot(2, 2, 2); 
H1 = histogram(A);
subplot(2, 2, 3);
imshow(A);
subplot(2, 2, 4);
H2 = histogram(A, 'Normalization', 'probability');

