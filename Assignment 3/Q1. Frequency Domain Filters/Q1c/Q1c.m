clear;
A = imread('lena_gray.jpg');
subplot(1, 6, 1);
imshow(A); %show original image

[r, c] = size(A);
%fft of original image
A_fft = fftshift(fft2(A));
subplot(1, 6, 2);
imshow(log(1 + abs(A_fft)), []); %show fft transform of original image

%15x15 gaussian filter to filter image in frequency domain
sizefilt = 3
half_sizefilt = floor(sizefilt/2);

%high-boost filtering with constant > 1 as constant = 1.1
SHARP = [-1.1 -1.1 -1.1; 
         -1.1 11 -1.1; 
         -1.1 -1.1 -1.1];
%B = conv2(A, SHARP, 'valid'); %convolution
%C = uint8(B);

mask = zeros(r, c);
%dimensions of white-centered box in filter set to 1
mask(r/2 - half_sizefilt:r/2 + half_sizefilt, c/2 - half_sizefilt:c/2 + half_sizefilt) = SHARP; 
subplot(1, 6, 3);
imshow(mask); %show filter

%fft of filter
fft_mask = fftshift(fft2(mask));
subplot(1, 6, 4);
imshow(log(1 + abs(fft_mask)), []); %show fft transform of filter

%application of filter to image
%multiplies transformed image and transformed filter element by element through .* operator
filtered_img_freq = A_fft .* fft_mask;
subplot(1, 6, 5);
imshow(log(1 + abs(filtered_img_freq)), []); %show filtered image in frequency domain

%inverse fft
%puts filtered image in freq domain to filtered image in spatial domain
filtered_img_spatial = ifft2(filtered_img_freq);
subplot(1, 6, 6);
imshow(log(1 + abs(fftshift(filtered_img_spatial))), []); %show filtered image in spatial domain

