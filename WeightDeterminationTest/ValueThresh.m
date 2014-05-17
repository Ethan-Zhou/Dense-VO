function output = ValueThresh(input,threshold)
[rows cols] = size(input);
length = rows * cols;
output = zeros(rows,cols);
for i = 1:length
    p2 = GetPosition(i,cols);
    x = p2(1);
    y = p2(2);
    if input(y,x) >= threshold
        output(y,x) = 255;
    end
end
        