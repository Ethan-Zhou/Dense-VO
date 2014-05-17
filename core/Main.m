% Project: Dense Visual Odometry
% Functions: Main
%
% Description:
%   Script to run the algorithm.
%
% NOTE: 
%      Change the input directory to where you save them.
%
% Author: Ethan Zhou
% Email: cavatina@yeah.net
% Website: https://github.com/Ethan-Zhou/Dense-VO
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% log:
% 2014-05-15: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;

%Get Input Information
dir1 = 'D:\MATLAB\code\rgbd_dataset_freiburg2_desk_with_person\rgbd_dataset_freiburg2_desk_with_person\rgb';%rgb iamge
dir2 = 'D:\MATLAB\code\rgbd_dataset_freiburg2_desk_with_person\rgbd_dataset_freiburg2_desk_with_person\depth';%depth image
FileType = '*.png';
% [IntensityFileList DepthFileList] = GetInputInfo(dir1,dir2,FileType);
IntensityFileList = importdata('D:\MATLAB\code\rgbd_dataset_freiburg2_desk_with_person\rgbd_dataset_freiburg2_desk_with_person\rgb_ass.txt');
DepthFileList = importdata('D:\MATLAB\code\rgbd_dataset_freiburg2_desk_with_person\rgbd_dataset_freiburg2_desk_with_person\depth_ass.txt');

%Get Iterative Times
[rows cols] = size(IntensityFileList);
ImgNum = rows*cols;
ITimes = ImgNum - 1;

%Get Initial Parameters
%Iterative Parameters;Intrinsic Parameters
[epsilon,kmax,initial_sigma,default_dof,DSR,scalefactor] = GetInitialParas();
InParas = GetInParas('fr1',DSR);

%Result Initialization
ksi_result_TUM = zeros(ITimes,6)';
ksi_result_New = zeros(ITimes,6)';
G_initial = eye(4);
G_result_TUM = eye(4);
G_result_New = eye(4);
% e = zeros(1,300);

% Record the result ksi
fid1 = fopen('ksi_TUM.txt','a+');
fid2 = fopen('ksi_New.txt','a+');

first = 1231;
%Initial camera motion estimation using TUM method 
[I1 D1 I2 D2 rows cols] = ReadSuccessiveFrames(IntensityFileList,DepthFileList,first,scalefactor,DSR);
[G1 e1 r1 W1]= EstimateCameraMotion(I1,D1,I2,D2,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,1);
rr1 = r1;
G_result_TUM = G1;
G_result_New = G1;
ksi_result_TUM(:,1) = LieLogrithm(G_result_TUM);
ksi_result_New(:,1) = LieLogrithm(G_result_New);

for j = 1:6
    fprintf(fid1,'%f',ksi_result_TUM(j,1));
    fprintf(fid1,' ');
    fprintf(fid2,'%f',ksi_result_New(j,1));
    fprintf(fid2,' ');
end
fprintf(fid1,'\n');
fprintf(fid2,'\n');

%Subsequent calculation using my proposed method and TUM mehtod at the same
%tiem for the sake of comparison
for i = 1232:1232%ITimes
% My Proposed Method
[I2 D2 I3 D3 rows cols] = ReadSuccessiveFrames(IntensityFileList,DepthFileList,i,scalefactor,DSR);
[G2 e2 r2 W2] = EstimateCameraMotion(I2,D2,I3,D3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i);
[GG2 ee2 rr2 WW2] = CME_New(rr1,I2,D2,I3,D3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i);
rr1 = rr2;

% Incremental
G_result_TUM = G_result_TUM*G2;
G_result_New = G_result_New*GG2;
ksi_result_TUM(:,i) = LieLogrithm(G_result_TUM);
ksi_result_New(:,i) = LieLogrithm(G_result_New);

%Write the resutl of ksi to a file
    for j = 1:6
        fprintf(fid1,'%f',ksi_result_TUM(j,i));
        fprintf(fid1,' ');
        fprintf(fid2,'%f',ksi_result_New(j,i));
        fprintf(fid2,' ');
    end
        fprintf(fid1,'\n');
        fprintf(fid2,'\n');
end

fclose(fid1);
fclose(fid2);

