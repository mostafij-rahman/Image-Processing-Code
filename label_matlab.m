close all;
BW=imread('E:\Raju 8th Semester\IP Class\IP Class 1\pennies.pgm');
cc = bwconncomp(BW);
labeled = labelmatrix(cc);
[L,num] = bwlabel(BW, 8);
imshow(labeled);

