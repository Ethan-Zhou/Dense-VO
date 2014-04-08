function J_w = ComputeJw(p2,depth,InParas)
% Project:   Dense Visual Odometry
% Functions: ComputeJw
%
% Description:
%   Get the Jacobian matrix J_w of a pixel
%
% Example:
%   J_w = ComputeJw(p2,depth,InParas)
%   
%   p2: The coordinate object of the input pixel, x = p2(1),y = p2(2)
%   depth: The depth value of the input pixel
%   InParas: A struct object which contains necessary intrinsic parameters
%            of the RGB-D camera
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-24: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fx = InParas(1);
fy = InParas(2);
x = p2(1);
y = p2(2);
[X Y Z] = InvPiProjection(x,y,depth,InParas);
if (isnan(Z) ~= 1)
    J_w = [fx/Z 0 -fx*X/Z^2 -fx*X*Y/Z^2 fx*(1+(X/Z)^2) -fx*Y/Z;...
        0 fy/Z -fy*Y/Z^2 -fy*(1+(Y/Z)^2) fy*X*Y/Z^2 fy*X/Z];
else
    J_w = [NaN NaN NaN NaN NaN NaN;...
            NaN NaN NaN NaN NaN NaN];
end