function G = RBMotion(ksi)
% Project: Dense Visual Odometry
% Function: RBMotion
%
% Description:
%   Rigid Body Motion Calculation (Lie Algebra)
%
% Example:
%   G = RBMotion(ksi)
%   
%   G: Rigid body motion matrix (4*4), which describe the camera motion
%   between the two successive snapshot.
%   ksi: A 6*1 matrix which includes camera motion parameters (ksi = (v1 v2
%   v3 w1 w2 w3)').
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
G = eye(4);
v = ksi(1:3);
w = ksi(4:6);

len_w = sqrt(dot(w,w));
Wx = TwistMatrix(w);
if len_w < 0.0001
    R = eye(3) + Wx + 0.5*Wx*Wx;
    V = eye(3) + 0.5*Wx + Wx*Wx/3;
else
    R = eye(3) + sin(len_w)/len_w*Wx + (1-cos(len_w))/len_w^2*(Wx*Wx);
    V = eye(3) + (1-cos(len_w))/len_w^2*Wx + (len_w-sin(len_w))/len_w^3*(Wx*Wx);
end
t = V*v;

G(1,1:3) = R(1,:);
G(2,1:3) = R(2,:);
G(3,1:3) = R(3,:);
G(1:3,4) = t;