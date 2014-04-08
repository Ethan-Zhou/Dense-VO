function p2 = GetPosition(i,cols)
% Project: Dense Visual Odometry
% Function: GetPosition
%
% Description:
%   Get the corresponding position of a point in a picture with its known 
%   index in the linear space and the colunm of the picture.  
%
% Example:
%   p2 = GetPosition(i,cols);
%
%   p2: A 1*2 point matrix which contains the x,y coordinate of the point;
%       x = p2(1); y = p2(2);
%   i: The index of the point in the linear space.
%   cols: The column of the processed image.
% NOTE: 
%     The parameters below are initialized as the TUM paper
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-09: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p2 = zeros(1,2);
p2(1) = mod(i,cols);
if p2(1) == 0
    p2(1) = cols;
end
p2(2) = ceil(i/cols);


