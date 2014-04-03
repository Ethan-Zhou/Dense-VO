%Dense Visual Odometry
%Functions: CalcDerivative
%2014.3.2
%Ethan
function funs = CalcDerivative
    funs.fun1=@CalcDerivativeX;
    funs.fun2=@CalcDerivativeY;
end

function ResultX = CalcDerivativeX(SrcImg)
    ImgSize = size(SrcImg);
    rows = ImgSize(1);
    cols = ImgSize(2);
    ResultX = zeros(rows,cols); 
    for y = 1:rows
        for x = 1:cols
            prev = max(x-1,1);
            next = min(x+1,cols);
            ResultX(y,x) = (SrcImg(y,next) - SrcImg(y,prev))*0.5;
        end
    end
end

function ResultY = CalcDerivativeY(SrcImg)
    ImgSize = size(SrcImg);
    rows = ImgSize(1);
    cols = ImgSize(2);
    ResultY = zeros(rows,cols);
    for y = 1:rows
        for x = 1:cols
            prev = max(y-1,1);
            next = min(y+1,rows);
            ResultY(y,x) = (SrcImg(next,x) - SrcImg(prev,x))*0.5;
        end
    end
end