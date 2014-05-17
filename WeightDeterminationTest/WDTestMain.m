%Test Weight Determination
clc;
clear;

%RGB consecutive frames
%1311870469.173755.png 1311870469.205815.png 1311870469.237980.png
%Depth
%1311870469.159847.png 1311870469.190211.png 1311870469.222215.png
[epsilon,kmax,initial_sigma,default_dof,DSR,scalefactor] = GetInitialParas();
InParas = GetInParas('fr1',DSR);
G_initial = eye(4);
ScaleFactor = 5000;

% The first registration pair, weight determined by TUM proposed method.
[I1 D1 I2 D2 rows cols] = ReadSuccessiveFrame('1311870469.173755.png','1311870469.205815.png','1311870469.159847.png','1311870469.190211.png',ScaleFactor,DSR);
[G1 e1 r1 W1]= EstimateCameraMotion(I1,D1,I2,D2,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,0);

% The second registration pair, weight determined by TUM or FIS method.
% Comparison
[I2 D2 I3 D3 rows cols] = ReadSuccessiveFrame('1311870469.205815.png','1311870469.237980.png','1311870469.190211.png','1311870469.222215.png',ScaleFactor,DSR);
[G2 e2 r2 W2]= EstimateCameraMotion(I2,D2,I3,D3,G_initial,InParas,epsilon,kmax,initial_sigma,default_dof,1);
W2 = vec2mat(W2,cols);
figure(1);
ShowWeight(W2)
[G2_FIS e2_FIS r2_FIS W2_FIS] = CME_FIS(I2,D2,I3,D3,G_initial,InParas,epsilon,kmax,1,r1);
figure(2);
ShowWeight(W2_FIS);



