function ksi = LieLogrithm(G)
% Project: Dense Visual Odometry
% Function: LieLogrithm
%
% Description:
%   Get the camera motion parameter ksi from its corresponding rigid body
%   motion matrix.
%
% Example:
%   ksi = LieLogrithm(G)
%   
%   ksi: The camera motion parameters (a 6*1 matrix (v1,v2,v3,w1,w2,w3)')
%   G: The rigid body motion matrix (a 4*4 matrix)
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-26: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R = G(1:3,1:3);
t = G(1:3,4);
theta = acos((trace(R)-1)/2);
if theta < 0.001
    w = (0.5*[R(3,2)-R(2,3),R(1,3)-R(3,1),R(2,1)-R(1,2)])';
else
    w = (0.5*theta/sin(theta)*[R(3,2)-R(2,3),R(1,3)-R(3,1),R(2,1)-R(1,2)])';
end
len_w = sqrt(dot(w,w));
Wx = TwistMatrix(w);
if len_w < 0.001
    V = eye(3) + 0.5*Wx + (Wx*Wx)/3;
else
    V = eye(3) + (1-cos(len_w))/len_w^2*Wx + (len_w-sin(len_w))/len_w^3*(Wx*Wx);
end
v = V\t;
ksi = [v',w']';