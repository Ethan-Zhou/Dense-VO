% Script: To compare the groud truth and the estimation value

% Translate the ground truth Q4 to ksi
%1.4600 -3.0426 1.5504 0.8332 0.2139 -0.1581 -0.4848
%1.4591 -3.0419 1.5539 0.8320 0.2134 -0.1588 -0.4869
%1.4588 -3.0419 1.5540 0.8317 0.2134 -0.1597 -0.4871

q1 = [0.8332 0.2139 -0.1581 -0.4848];
q2 = [0.8320 0.2134 -0.1588 -0.4869];
q3 = [0.8317 0.2134 -0.1597 -0.4871];

t1 = [1.4600 -3.0426 1.5504];
t2 = [1.4591 -3.0419 1.5539];
t3 = [1.4588 -3.0419 1.5540];

[theta1 v1] = Quaternion2Rv(q1);
[theta2 v2] = Quaternion2Rv(q2);
[theta3 v3] = Quaternion2Rv(q3);

Q1 = Quaternion(theta1,v1);
Q2 = Quaternion(theta2,v2);
Q3 = Quaternion(theta3,v3);

M1 = Q1.T;
M2 = Q2.T;
M3 = Q3.T;
M1(1:3,4) = t1';
M2(1:3,4) = t2';
M3(1:3,4) = t3';

G1 = M2\M1;
G2 = M3\M2;

ksi1 = LieLogrithm(G1);
ksi2 = LieLogrithm(G2);

%ksi1    0.0006    0.0036    0.0007   -0.0051    0.0002   -0.0003
%ksi2    0.0003    0.0001   -0.0001   -0.0010    0.0015   -0.0007

