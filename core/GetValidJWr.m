function [Je We re num Jn Wn rn] = GetValidJWr(J,W,r)
% Project: Dense Visual Odometry
% Function: GetValidJWr
%
% Description:
%   Get the valid Jacobian matrix, Weight set and residual from raw J,W and r.  
%
% Example:
%   [Je We re num Jn Wn rn] = GetValidJWr(J,W,r)
%
%   Je, We, re: Valid Jacobian matrix (size:Jn*6), weigth (size:Wn*1) and
%               residual(size:rn*1)
%   num: The length of the valid set. num = max {Jn, Wn, rn}.
%   Jn Wn rn: The correspoding row numver of the Je, We, re.(Just use for debug)
%
% NOTE: 
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-03-16: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[rows cols] = size(r);
length = rows*cols;
num = 0;
Jn = 0;
Wn = 0;
rn = 0;
for i = 1:length
    p2 = GetPosition(i,cols);
    y = p2(2);
    x = p2(1);
    J0 = (J(i,1)==0 && J(i,2)==0 && J(i,3)==0 && J(i,4)==0 && J(i,5)==0 && J(i,6)==0);
    if isnan(J(i,1))~=1 &&  isnan(r(y,x))~=1 && isnan(W(i))~=1 && J0 ~= 1
        num = num + 1;
        Je(num,:) = J(i,:);
        We(num) = W(i);
        re(num) = r(y,x);
    end
    if isnan(J(i,1))~=1 && J0 ~= 1
        Jn = Jn +1;
    end
    if isnan(W(i))~=1
        Wn = Wn + 1;
    end
    if isnan(r(y,x))~=1
        rn = rn+1;
    end
end

