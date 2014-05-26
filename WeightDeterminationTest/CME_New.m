function [G2 e2 r2 W2] = CME_New(r1,I2,Z2,I3,Z3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i)
% Project:   Dense Visual Odometry
% Functions: CME_New
%
% Description:
%   Camera motion estimation, using new method.
%
% Example:
%   CME_New(r1,I2,Z2,I3,Z3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i)
%
%   r1: The residual of the previous image pair.
%   I2,I3: The input image pair, both are gray
%   Z2,Z3: The input depth image pair
%   G_initial: Initial camera motion matrix; If there is no other input
%              data like IMU data (which can greatly help increase the 
%              efficiency of the optimizaiton process), it will be set as
%              eye(4).
%   InParas: A struct object which contains necessary intrinsic parameters
%            of the RGB-D camera
%   epsilon: useful initial parameter used in optimization process
%   kmax: useful initial parameter used in optimization process
%   initial_sigma: useful initial parameter used in optimization process
%   default_dof: useful initial parameter used in optimization process
%   i: index of the residual image (useless if you do not need record residual
%      image to file)
%
% NOTE: The input image must have only one channel
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-05-26: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G2 = G_initial;
e2 = inf;
k = 0;

while 1
    [J2 r2] = ComputeJacobianAndError_New(I2,Z2,I3,Z3,G2,InParas);
    W2 = WeightDetermination(r2,abs(r1-r2),initial_sigma,default_dof,10,100);
    [Je We re num Jn Wn rn] = GetValidJWr(J2,W2,r2);
    e_last = e2;
    e2 = GetError(re,We);
    if e2 > e_last
        break
    else
        d_ksi = Get_dksi(Je,We,re);
        G2 = G2*RBMotion(d_ksi);
    end
    k=k+1;   
    ee = e_last-e2;
    if abs(ee) < epsilon || kmax < k
        break;
    end
end