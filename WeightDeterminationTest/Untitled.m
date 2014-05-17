% FIS Parameter Determination Test
% clear;
% clc;

% Read Input
% r1 = importdata('r1.mat');
% r2 = importdata('r2.mat');
% rr2 = importdata('rr2.mat');
% W2 = importdata('W2.mat');
% WW2 = importdata('WW2.mat');
figure(1);
imshow(r2,[0,255]);
figure(2);
imshow(rr2,[0,255]);
figure(3);
imshow(abs(rr2-r1),[0,255]);

[rows cols] = size(r1);
W2_img = vec2mat(W2,cols);
figure(4);
showweight(W2_img);

WW2_img = vec2mat(WW2,cols);
figure(5);
showweight(WW2_img);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %白色代表噪声
% NImg1 = valuethresh(abs(r2),20);
% figure(5);
% imshow(NImg1,[0,255]);
% 
%白色代表动态噪声
dr2 = abs(rr2 - r1);
[NImg2 IP2] = Judge(abs(r2),dr2,10,100);
[centers radius] = GetMovingRegions(IP2);
figure(6);
imshow(NImg2,[0,255]);

hold on;
axis([0 320 0 240]);
plot(IP2(:,1),IP2(:,2),'ro');
plot(centers(:,1),centers(:,2),'b+');
[cnum cdim] = size(centers);
for i = 1:cnum
    CIRCLE(centers(i,:),radius(i));
end
hold off;


% 
% NImg3 = NImg2 + NImg1;
% figure(7);
% imshow(NImg3,[0,255]);

% k = 4;
% [L re] = kmeans(IP2,k);

% figure(8);
% hold on;
% axis([0 320 0 240])
% [m n] = size(re);
% plot(IP2(:,1),IP2(:,2),'ro');
% plot(re(:,1),re(:,2),'b+');

% grid on;
% figure(8);
% img = imread('1311870469.173755.png');
% img = rgb2gray(img);
% imshow(img,[0,255]);

