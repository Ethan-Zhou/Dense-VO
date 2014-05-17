function length = ShowWeight(W)
[rows cols] = size(W);
length = rows * cols;
W = W/1.2*255;
imshow(W,[0,255]);

