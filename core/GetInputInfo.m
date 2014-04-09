function [IntensityFileList DepthFileList] = GetInputInfo(dir1,dir2,FileType)
% Project: Dense Visual Odometry
% Function: GetInputInfo
%
% Description:
%   Save all the names of the files in direction 1 and 2 to corresponding name list object. 
%
% Example:
%   IntesnsityFileList: A list object which contains the name of a set of
%   rgb images in dir1.
%   DepthFileList: A list object which contains the name of a set of
%   depth images in dir2.
%   dir1,dir2: The directions where the rgb and depth images are located.
%   FileType: The type of the input iamge. (e.g. png)
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-28: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileFolder1=fullfile(dir1);
dirOutput1=dir(fullfile(fileFolder1,FileType));
IntensityFileList={dirOutput1.name}';
fileFolder2=fullfile(dir2);
dirOutput2=dir(fullfile(fileFolder2,FileType));
DepthFileList={dirOutput2.name}';