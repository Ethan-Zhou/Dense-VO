function [I1 D1 I2 D2 rows cols] = ReadSuccessiveFrames(IntensityFile,DepthFile,index,ScaleFactor,DSR)
% Project: Dense Visual Odometry
% Function: ReadSuccessiveFrames
%
% Description:
%   Read raw RGB and depth input image, and get their size. 
%
% Example:
%   [I1 D1 I2 D2 rows cols] = ReadSuccessiveFrames(IntensityFile,DepthFile,index,ScaleFactor,DSR)
%   
%   I1,I2: Gray images of the raw RGB images, which will be used for registration.
%   D1,D2: Depth images with respect to I1,I2.
%   rows, cols: The size of the I1,I2,D1,D2(same) after down sampling
%   proces.
%   IntensityFile: A list which contains all the names of the RGB images.
%   DepthFile: A list which contains all the names of the depth images.
%   index: Index of the current proposed registration pair.
%   ScaleFactor: A coefficient which will be used in the process of real depth
%   recovering. (See ReadDepth)
%   DSR: Down sampling rate.
%
% NOTE: 
%      The input image (both intensity information and correspondig depth
%      image)will be down sampled by a coefficient called DSR, and the RGB 
%      image will be convert to gray onefor the sake of saving computation time.
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-28: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Read Input
I1 = imread(cell2mat(IntensityFile(index)));
D1 = ReadDepth(cell2mat(DepthFile(index)),ScaleFactor);
I2 = imread(cell2mat(IntensityFile(index+1)));
D2 = ReadDepth(cell2mat(DepthFile(index+1)),ScaleFactor);
[rows cols] = size(D1);
%Preprocess
I1 = RGB2Gray(I1);
I2 = RGB2Gray(I2);
%Down sampling
for i = 1:log2(DSR)
I1 = PyraDownMean(I1,rows,cols);
I2 = PyraDownMean(I2,rows,cols);
D1 = PyraDownMean(D1,rows,cols);
D2 = PyraDownMean(D2,rows,cols);
[rows cols] = size(D1);
end
