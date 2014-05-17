function [Output,SP] = CheckMotion(r,dr,thresh1,thresh2)
[rows cols] = size(r);
length = rows*cols;
Output = zeros(rows,cols);
j = 0;
for i = 1:length
    p2 = GetPosition(i,cols);
    x = p2(1);
    y = p2(2);
    if r(y,x)<=thresh1 && dr(y,x) >= thresh2
        Output(y,x) = 255;
        j = j + 1;
        SP(j,:) = [x y];
    end
end

%TODO：利用直方图分布的方法求出thresh1，thresh2而不是手动设置