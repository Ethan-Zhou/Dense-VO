function DownSampImg = PyraDownMean(SrcImg,rows,cols)
% Project: Dense Visual Odometry
% Function: PyraDownMean
%
% Description:
%   Get the down sampling (default down sample rate is 2, other down sample rate
%   like 4,8... can be realized by execute this func for multiple times) image of 
%   the input image.
%
% Example:
%   DownSampImg = PyraDownMean(SrcImg,rows,cols)
%   
%   SrcImg: The input image.
%   rows, cols: The size of the input image (rows*cols).
%
% NOTE: 
%      The input image must a single channel one (gray pic or depth pic can
%      be ok).
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-02: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
DownSampImg = zeros(rows/2,cols/2);
for y = 1:rows/2
    for x = 1:cols/2
        x0 = x * 2 - 1;
        x1 = x * 2;
        y0 = y * 2 - 1;
        y1 = y * 2;
        
        a = SrcImg(y0,x0) / 4;
        b = SrcImg(y0,x1) / 4;
        c = SrcImg(y1,x0) / 4;
        d = SrcImg(y1,x1) / 4;
        DownSampImg(y,x) = a+b+c+d;
    end
end
% 
% function DownSampImg = PyraDownMean(SrcImg,rows,cols)
% 
% DownSampImg = zeros(rows/2,cols/2,3);
% for y = 1:rows/2
%     for x = 1:cols/2
%         x0 = x * 2 - 1;
%         x1 = x * 2;
%         y0 = y * 2 - 1;
%         y1 = y * 2;
%         
%         DownSampImg(y,x,1) = (SrcImg(y0,x0,1)+SrcImg(y0,x1,1)+SrcImg(y1,x0,1)+SrcImg(y1,x1,1))/4;
%         DownSampImg(y,x,2) = (SrcImg(y0,x0,2)+SrcImg(y0,x1,2)+SrcImg(y1,x0,2)+SrcImg(y1,x1,2))/4;
%         DownSampImg(y,x,3) = (SrcImg(y0,x0,3)+SrcImg(y0,x1,3)+SrcImg(y1,x0,3)+SrcImg(y1,x1,3))/4;
%     end
% end