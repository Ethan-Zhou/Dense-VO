function result = InImage(x,y,SrcImg)
% Project: Dense Visual Odometry
% Function: InImage
%
% Description:
%   Judge whether the point is in the image after warping
%
% Example:
%   result = InImage(x,y,SrcImg)
%   
%   result: 0 if out; 1 if in.
%   x,y: The x,y coordinate of the point.
%   SrcImg: The input image.
%
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
[rows cols] = size(SrcImg);
if(x >= 1 && x <=cols && y >=1 && y <= rows)
    result = 1;
else
    result = 0;
end

