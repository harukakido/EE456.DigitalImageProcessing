clear;
A = imread('lena_gray.jpg');

%high-boost filtering with constant > 1 as constant = 1.1
SHARP = [-1.1 -1.1 -1.1; 
         -1.1 11 -1.1; 
         -1.1 -1.1 -1.1];
B = conv2(A, SHARP, 'valid'); %convolution
C = uint8(B);

%high-boost filtering with constant > 1 as constant = 1.3
SHARP = [-1.3 -1.3 -1.3; 
         -1.3 11 -1.3; 
         -1.3 -1.3 -1.3];
D = conv2(A, SHARP, 'valid'); %convolution
E = uint8(D);

subplot(1, 3, 1);
imshow(A);
subplot(1, 3, 2);
imshow(C);
subplot(1, 3, 3);
imshow(E); 



