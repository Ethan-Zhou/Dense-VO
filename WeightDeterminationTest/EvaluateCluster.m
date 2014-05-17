function score = EvaluateCluster(Sp,)
[CNum CDim] = size(C);
[LNum LDim] = size(L);
% 每种类型的元素书均大于threshold才能保证分类是最优的
count = 0;
for i = 1:CNum
    for j = 1:LNum
        if L(j) == i
            count = count + 1;
        end
    end
    if count < threshold
        score = 
    
    
    