function GrayImg = RGB2Gray(SrcImg)
% Project: Dense Visual Odometry
% Function: RGB2Gray
%
% Description:
%   Convert RGB image to Gray image.
%
% Example:
%   GrayImg = RGB2Gray(SrcImg)
%   
%   SrcImg: The input RGB image.
%   GrayImg: The output Gray image.
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-02: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ImgSize = size(SrcImg);
    rows = ImgSize(1);
    cols = ImgSize(2);
    GrayImg = zeros(rows,cols);
    for y = 1:rows
        for x = 1: cols
            a = SrcImg(y,x,1)/3;
            b = SrcImg(y,x,2)/3;
            c = SrcImg(y,x,3)/3;
            GrayImg(y,x) = a+b+c;
        end
    end
