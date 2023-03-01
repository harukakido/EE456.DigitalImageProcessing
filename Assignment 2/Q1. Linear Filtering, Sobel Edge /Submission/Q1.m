A = imread('cameraman.tif');

%sets test filter
kernel = [0 1 0;
          1 -4 1; 
          0 1 0];

%initializes row and col of image      
img_row = size(A, 1);
img_col = size(A, 2);

%initializes row and col of filter  
numofrows = size(kernel, 1);
numofcols = size(kernel, 2);      

%borders of filter
row = numofrows - 1;
col = numofcols - 1;

filteredA = uint8(zeros(size(A)));

%input for linear filter convolution
input = zeros(img_row + row, img_col + col);
m = floor(numofrows/2);
n = floor(numofcols/2);
rowsize = size(input, 1) - row;
colsize = size(input, 2) - col;

for r = 1:img_row
    for c = 1:img_col
        input(r + m, c + n) = A(r, c);
    end
end

%Application of 3x3 filter
for r = 1:rowsize
    for c = 1:colsize
        m = r;
        n = c;
        sum = 0; %initializes sum to 0 during shift
        for u = 1:numofrows
            for v = 1:numofcols
                %summation of convolution
                sum = sum + (input(m, n) * kernel(u, v)); 
                n = n + 1;                    
            end
        m = m + 1;
        n = c;
        end
        %sobel edge linear filtering output image
        filteredA(r, c) = sum;
    end
end

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(filteredA, []);

