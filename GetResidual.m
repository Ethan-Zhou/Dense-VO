function r = GetResidual(I1,I2)
% Project: Dense Visual Odometry
% Function: GetResidual
%
% Description:
%   Get the residual image of a registration pair. 
%
% Example:
%   r = GetResidual(I1,I2).
%
%   p2: A 1*2 point matrix which contains the x,y coordinate of the point;
%       x = p2(1); y = p2(2);
%   i: The index of the point in the linear space.
%   cols: The column of the processed image.
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-08: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rows cols] = size(I1);
r = zeros(rows,cols);
for y = 1:rows
    for x = 1:cols
        if isnan(I2(y,x)) == 0
            r(y,x) = I2(y,x) - I1(y,x);
        else
            r(y,x) = NaN;
        end
    end
end

