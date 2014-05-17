function In = InMovingRegion(p2,centers,radius)
[CNum CDim] = size(centers);
x = p2(1);
y = p2(2);
for i = 1:CNum
    if (x-centers(i,1))^2 + (y-centers(i,2))^2 <= radius(i)^2
        In = 1;
        break;
    else 
        In = 0;
    end
end