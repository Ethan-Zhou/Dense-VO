function score = EvaluateCluster(Sp,)
[CNum CDim] = size(C);
[LNum LDim] = size(L);
% ÿ�����͵�Ԫ���������threshold���ܱ�֤���������ŵ�
count = 0;
for i = 1:CNum
    for j = 1:LNum
        if L(j) == i
            count = count + 1;
        end
    end
    if count < threshold
        score = 
    
    
    