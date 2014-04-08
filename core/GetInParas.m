function InParas = GetInParas(InstrumentName,DSR)
% Project: Dense Visual Odometry
% Function: GetInParas
%
% Description:
%   Get the intrinsic parameters of the RGB-D camera
%
% Example:
%   InParas = GetInParas(InstrumentName,DSR)
%   
%   InParas: Includes focal length in both x and y direction (fx, fy);
%            and the pixle coordinate of the principal point (ox, oy).
%   InstrumentName: The name of the proposed RGB-D camera (see details on 
%             https://vision.in.tum.de/data/datasets/rgbd-dataset/download)
%   DSR: Down sampling rate (The raw size of the input iamge is always too 
%        big which takes a long time to estimate the camera motion parameters)
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-10: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch InstrumentName
    case 'sROS'
        InParas = [525.0/DSR 525.0/DSR 319.5/DSR 239.5/DSR];
    case 'fr1'
        InParas = [517.3/DSR 516.5/DSR 318.6/DSR 255.3/DSR];
end
        