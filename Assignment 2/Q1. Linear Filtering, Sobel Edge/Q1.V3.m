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

if(numofrows == 1)
    B = zeros(img_row, img_col + col);
    m = 0;
    n = floor(numofcols/2);
    rowsize = size(B, 1);
    colsize = size(B, 2) - col;
elseif(numofcols == 1)
    B = zeros(img_row + row, img_col);
    m = floor(numofrows/2);
    n = 0;
    rowsize = size(B, 1) - row;
    colsize = size(B,2);
else
    B = zeros(img_row + row, img_col + col);
    m = floor(numofrows/2);
    n = floor(numofcols/2);
    rowsize = size(B, 1) - row;
    colsize = size(B, 2) - col;
end

for r = 1:img_row
    for c = 1:img_col
        B(r + m, c + n) = A(r, c);
    end
end

for r = 1:rowsize
    for c = 1:colsize
        m = r;
        n = c;
        sum = 0; %initializes sum to 0
        for u = 1:numofrows
            for v = 1:numofcols
                sum = sum + (B(m, n) * kernel(u, v)); %sum of neighboring pixels
                n = n + 1;                    
            end
            m = m + 1;
            n = c;
        end
        filteredA(r, c) = sum; %equates the linearly-filtered matrix to the new sum without taking the average
    end
end

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(filteredA, []);