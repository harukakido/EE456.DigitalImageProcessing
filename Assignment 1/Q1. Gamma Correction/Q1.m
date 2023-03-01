clear;
A = imread("forest_gray.png");
subplot(4, 2, 1);
imshow(A);
subplot(4, 2, 2);
imhist(A);

G1 = imadjust(A, [], [], 0.75);
subplot(4, 2, 3);
imshow(G1);
subplot(4, 2, 4);
imhist(G1);

G2 = imadjust(A, [], [], 0.5);
subplot(4, 2, 5);
imshow(G2);
subplot(4, 2, 6);
imhist(G2);

G3 = imadjust(A, [], [], 0.25);
subplot(4, 2, 7);
imshow(G3);
subplot(4, 2, 8);
imhist(G3);



