function W2 = GetWeight_FIS(FIS,r1,r2)
r = abs(r2);
dr = abs(abs(r1)-abs(r2));
[rows cols] = size(r);
len = rows*cols;
W2 = zeros(rows,cols);
fis = readfis(FIS);
for i = 1:len
p2 = GetPosition(i,cols);
x = p2(1);
y = p2(2);
W2(y,x) = evalfis([r(y,x) dr(y,x)],fis);
end
