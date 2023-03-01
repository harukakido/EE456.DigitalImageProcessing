clear;
A = imread('periodicNoisecar.png');

r = size(A, 1);
c = size(A, 2);
subplot(1, 4, 1);
imshow(A); %show original image

%fft of original image
A_fft = log(1 + abs(fftshift(fft2(A))));
subplot(1, 4, 2);
imshow(A_fft, []); %show fft transform of original image

%filter that gives 0 outputs in locations of noise frequency components
f = ones(r, c);
f(62:66, 68:72) = 0;
f(104:108, 68:72) = 0;
f(186:190, 70:74) = 0;
f(228:232, 72:76) = 0;
f(60:64, 128:132) = 0;
f(100:104, 128:132) = 0;
f(180:184, 128:132) = 0;
f(222:226, 130:134) = 0;

%application of filter to image
%multiplies transformed image and transformed filter element by element through .* operator
subplot(1, 4, 3);
imshow(log(1 + abs(fftshift(fft2(A)) .* f)), []); %show filtered image in frequency domain

%inverse fft
%puts filtered image in freq domain to filtered image in spatial domain
subplot(1, 4, 4);
imshow(log(1 + abs(ifft2(fftshift(fft2(A)) .*f))), []); %show filtered image in spatial domain

