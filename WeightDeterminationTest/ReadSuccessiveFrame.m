%Dense Visual Odometry
%Functions: RGB-D Image PreProcess
%2014.3.10
%Author: Ethan

function [I1 D1 I2 D2 rows cols] = ReadSuccessiveFrame(file1,file2,dfile1,dfile2,ScaleFactor,DSR)

I1 = imread(file1);
D1 = ReadDepth(dfile1,ScaleFactor);
I2 = imread(file2);
D2 = ReadDepth(dfile2,ScaleFactor);
[rows cols] = size(D1);

I1 = RGB2Gray(I1);
I2 = RGB2Gray(I2);

for i = 1:log2(DSR)
I1 = PyraDownMean(I1,rows,cols);
I2 = PyraDownMean(I2,rows,cols);
D1 = PyraDownMean(D1,rows,cols);
D2 = PyraDownMean(D2,rows,cols);
[rows cols] = size(D1);
end