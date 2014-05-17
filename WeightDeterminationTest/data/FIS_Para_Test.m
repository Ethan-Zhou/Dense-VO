% FIS Parameter Determination Test
clear;
clc;
r1 = importdata('r1.mat');
r2 = importdata('r2.mat');
W2 = importdata('W2.mat');
W2_FIS = GetWeight_FIS(r1,r2);