clear;
A = imread('cameraman.tif');

numOfRows = size(A, 1);
numOfCols = size(A, 2);

A_d = double(A);
A_out = A;

for row = 2:numOfRows - 1
    for col = 2:numOfCols - 1
        sum = 0;
        for u = -1:1
            for v = -1:1
                sum = sum + A_d(row + u, col + v);
            end
        end 
        avrg = sum/9.0;
        A_out(row, col) = avrg;
    end
end

subplot(1, 2, 1);
imshow(A);
subplot(1, 2, 2);
imshow(A_out, []);