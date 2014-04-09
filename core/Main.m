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
% 2014-03-28: Complete
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;

%Get Input Information
dir1 = 'D:\MATLAB\code\rgbd_dataset_freiburg1_360\rgbd_dataset_freiburg1_360\rgb';%rgb iamge
dir2 = 'D:\MATLAB\code\rgbd_dataset_freiburg1_360\rgbd_dataset_freiburg1_360\depth';%depth image
FileType = '*.png';
[IntensityFileList DepthFileList] = GetInputInfo(dir1,dir2,FileType);

%Get Iterative Times
[rows cols] = size(IntensityFileList);
ImgNum = rows*cols;
ITimes = ImgNum - 1;

%Get Initial Parameters
%Iterative Parameters;Intrinsic Parameters
[epsilon,kmax,initial_sigma,default_dof,DSR,scalefactor] = GetInitialParas();
InParas = GetInParas('fr1',DSR);

%Record File direction
%CameraPoseSavePath = 'D:\MATLAB\code\DenseImageRealignment\CameraPose_freiburg1_360_jpg\';

%Result Initialization
ksi_result = zeros(ITimes,6)';
G_result = eye(4);
e = zeros(1,300);

%Optimizasiotn Iteration
% fid = fopen('ksi.txt','a+');


% Draw Camera Motion
    % figure(1);
    % set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 640 512]/200);
    % grid on;
    % axis([-3 3 -3 3 -3 3]);
    % cam = CentralCamera('name', ' ', 'default');
    % cam.plot_camera('Tcam',eye(4),'color','b','label');
    % saveas(gcf,[CameraPoseSavePath,'0','.jpg']);
    % hh = cam.h_camera3D;
    % delete(hh);

for i = 1:2%ITimes
[I1 D1 I2 D2 rows cols] = ReadSuccessiveFrames(IntensityFileList,DepthFileList,i,scalefactor,DSR);
G_initial = eye(4);%Also can use the raw IMU data to be the intitial motion parametes at each registration which will save conputation time.
[G e(1,i)]= EstimateCameraMotion(I1,D1,I2,D2,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,i);
G_result = G_result*G;
ksi_result(:,i) = LieLogrithm(G);

%plot camera in the 3D sapce
%Write each figure to a JPEG file
%     set(gcf, 'PaperUnits', 'inches', 'PaperPosition', [0 0 640 512]/200);
%     grid on;
%     axis([-3 3 -3 3 -3 3]);
%     cam = cam.move(G);
%     cam.plot_camera('color','r','label');
%     saveas(gcf,[CameraPoseSavePath,num2str(i),'.jpg']);
%     hh = cam.h_camera3D;
%     delete(hh);

%Write the resutl of ksi to a file
%     for j = 1:6
%         fprintf(fid,'%f',ksi_result(j,i));
%         fprintf(fid,' ');
%     end
%         fprintf(fid,'\n');
end
% fclose(fid);

