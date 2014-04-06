function D = ReadDepth(file,ScaleFactor)
% Project: Dense Visual Odometry
% Function: ReadDepth
%
% Description:
%   Read Depth information of a pic with known scalefactor.
%
% Example:
%   D = ReadDepth(file,ScaleFactor)
%   
%   file: Depth image file (U8), png.
%   scalefactor: The real depth information should be recovered by timing raw
%   data a scalefactor.
%
% NOTE: 
%      The raw depth data is mixed with invalid data (exceed the range of 
%       measurement) which should be set as NaN. 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-11: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D = imread(file);
D= double(D);
D = D/ScaleFactor;
D(D == 0) = nan;
