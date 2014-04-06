function Result = WarpImage(SrcImg,DepthImg,G,Inparas)
% Project: Dense Visual Odometry
% Function: WarpImage
%
% Description:
%   Warp image.
%
% Example:
%   Result = WarpImage(SrcImg,DepthImg,G,Inparas)
%   
%   SrcImg: The source image I2.
%   DepthImg: The correspoding depth image.
%   G: The camera motion matrix.
%   Inparas: The intrinsic parameters of the proposed RGB-D camera.
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
[rows cols] = size(SrcImg);
Result = zeros(rows,cols);
for y = 1:rows
    for x = 1:cols
        z = DepthImg(y,x);
        if(isnan(z)~=1)
            [u v] = Warpping(G,x,y,z,Inparas);
            u = round(u);
            v = round(v);
            if(InImage(u,v,Result))                
                Result(y,x) = BilinearInterpolation(SrcImg,u,v);
            else
                Result(y,x) = NaN;
            end
        else
            Result(y,x) = NaN;
        end
    end
end


