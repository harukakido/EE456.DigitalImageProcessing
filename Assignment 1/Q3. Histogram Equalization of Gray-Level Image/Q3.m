clear;
A = imread('pout.tif');
subplot(3, 2, 1);
imshow(A);
subplot(3, 2, 2);
imhist(A);
num_bin = 256;
B = reshape(A, [], 1);
B = double(B);
H2 = hist(B, 0:(num_bin)); 
C = H2/numel(A);
CS = cumsum(C);
EH = CS(A + 1);
EH = uint8(EH * (num_bin));
subplot(3, 2, 3);
imshow(EH);
subplot(3, 2, 4);
imhist(EH);

