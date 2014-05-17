function Mat = Vec2Mat(Vec,r)
[rows cols] = size(r);
length = rows*cols;
Mat = zeros(rows,cols);
for i = 1:length
    p2 = GetPosition(i,cols);
    x = p2(1);
    y = p2(2);
    Mat(y,x) = Vec(i);
end