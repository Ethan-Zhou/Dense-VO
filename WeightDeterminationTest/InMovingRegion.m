function In = InMovingRegion(p2,centers,radius)
% Project: Dense Visual Odometry
% Function: InMovingRegion
%
% Description:
%   Check each pixel is in a moving region or not.
%
% Example:
%   In = InMovingRegion(p2,centers,radius)
%   
%   p2: The coordinate of the checked pixel
%   centers, radiuses: The location and scope of the moving regions.
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-05-27: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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