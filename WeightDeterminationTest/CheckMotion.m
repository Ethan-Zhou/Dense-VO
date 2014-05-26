function [Output,SP] = CheckMotion(r,dr,thresh1,thresh2)
% Project: Dense Visual Odometry
% Function: CheckMotion
%
% Description:
%   Check the moving region in the image. 
%
% Example:
%   [Output,SP] = CheckMotion(r,dr,thresh1,thresh2)
%   
%   Output: A grayscale image which clearly show the motion region (surrounded by a series white point)
%   SP: The suspected points (above-mentioned white points)
%   r: The residual of current image pair(i.e.r2).
%   dr: The residual of current residual r2 and the previous residual (dr = abs(r2 -r1))
%   thresh1,thresh2: Thresholds determine if a pixel belongs to the
%                    boundary of a moving region. At this time, the value
%                    of the thresholds are set by experience and may vary
%                    from different dataset.
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-03: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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