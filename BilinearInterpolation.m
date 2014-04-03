%Dense Visual Odometry
%Functions: BilinearInterpolation
%2014.3.16
%Author: Ethan

function Result = BilinearInterpolation(SrcImg,x,y)
x0 = floor(x);
y0 = floor(y);
[rows cols] = size(SrcImg);

if x0 == cols
    x1 = x0;
else
x1 = x0+1;
end
if y0 == rows
    y1 = y0;
else
    y1 = y0+1;
end

x_weight = x - x0;
y_weight = y - y0;

interpolated = SrcImg(y0,x0)*x_weight+SrcImg(y0,x1)*(1-x_weight)+...
               SrcImg(y1,x0)*x_weight+SrcImg(y1,x1)*(1-x_weight)+...
               SrcImg(y0,x0)*y_weight+SrcImg(y1,x0)*(1-y_weight)+...
               SrcImg(y0,x1)*y_weight+SrcImg(y1,x1)*(1-y_weight);
Result = interpolated*0.25;
    
