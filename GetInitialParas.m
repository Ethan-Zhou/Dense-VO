function [epsilon,kmax,initial_sigma,default_dof,DSR,scalefactor] = GetInitialParas()
% Project: Dense Visual Odometry
% Function: GetInitialParas
%
% Description:
%   Get the initial parameters with respect to the algorithm
%
% Example:
%   [epsilon,kmax,initial_sigma,default_dof,DSR,scalefactor] = GetInitialParas()
%
% NOTE: 
%     The parameters below are initialized as the TUM paper
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-12: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
epsilon = 1e-8;
kmax = 500;
initial_sigma = 5;
default_dof = 5;
DSR = 4;%降采样率
scalefactor = 5000;%图像采集设备的比例系数