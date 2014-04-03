function ivalue = BilinearInterpolation(SrcImg,x,y)
% Project:   Dense Visual Odometry
% Functions: BilinearInterpolation
%
% Description:
%   Get the interpolation value at the point of (x,y) in the Input Image
%
% Example:
%   ivalue = BilinearInterpolation(SrcImg,x,y)
%
%   SrcImg: input image object
%   x,y   : x,y coordinate
%
% NOTE: The input image must have only one channel
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-16: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
ivalue = interpolated*0.25;
    
