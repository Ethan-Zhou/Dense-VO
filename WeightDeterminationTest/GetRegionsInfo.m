function [centers radius] = GetRegionsInfo(Sp,L,C)
[CNum CDim] = size(C);
[SpNum SpDim] = size(Sp)
centers = C;
radius = zeros(CNum,1);
for i = 1:CNum
    CX = C(i,1);
    CY = C(i,2);
    r_max = 0;
    for j = 1:SpNum
        if L(j) == i
            r = (Sp(j,1) - CX)^2 + (Sp(j,2)-CY)^2;
            if r > r_max
                r_max = r;
            end
        end
    end
    radius(i) = floor(sqrt(r_max));
end
    

