function [G e]= EstimateCameraMotion(I1,Z1,I2,Z2,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i)
% Project:   Dense Visual Odometry
% Function: EstimateCameraMotion
%
% Description:
%   Get the camera motion matrix G and the weighted error e of the registration
%
% Example:
%   [G e]= EstimateCameraMotion(I1,Z1,I2,Z2,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i)
%   
%   I1,I2: The input image pair, both are gray
%   Z1,Z2: The input depth image pair
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
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-07: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = G_initial;
% d_ksi = [0 0 0 0 0 0]';
% ksi = [0 0 0 0 0 0]';

e = inf;
k = 0;
l = 0;

while 1
    [J W r] = ComputeJacobianAndError(I1,Z1,I2,Z2,G,InParas,initial_sigma,default_dof);
    [Je We re num Jn Wn rn] = GetValidJWr(J,W,r);
%     plot(re,We,'*');
    e_last = e;
    e = GetError(re,We);
    if e > e_last
        break
    else
        d_ksi = Get_dksi(Je,We,re);
        G = G*RBMotion(d_ksi);
    end
    k=k+1;   
    ee = e_last-e;
    if abs(ee) < epsilon || kmax < k
        break;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%Write residual to jpeg file
I22 = WarpImage(I2,Z2,G,InParas);
r = GetResidual(I1,I22);
figure(i);
set(gcf,'Position',[100 100 320 240]);
set(gca,'units','pixels');
set(gca,'units','normalized','position',[0 0 1 1]);
set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 640/1.5 480/1.5]/200);
% set(gca,'xcolor','w','ycolor','w','xtick',[],'ytick',[])
% set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 640 512]/200);
% set (gcf,'Position',[0,0,500,500]);
imshow(r,[0 255]);
saveas(gcf,['D:\MATLAB\code\DenseImageRealignment\Residual_freiburg1_360_jpg\',num2str(i),'.jpg']);
close(figure(i));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        
    



