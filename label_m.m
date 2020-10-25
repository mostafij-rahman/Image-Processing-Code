clear all;
close all;
img=imread('E:\Raju 8th Semester\IP Class\IP Class 1\pennies.pgm');
connComp=0;
label=0;

[L, NUM] = bwlabeln(img, 4);
inputImage=img;
[col, row]=size(img);
Queue=zeros(col, row);
d = zeros(col,row);
outputImage = zeros(col,row);
flagEquivalent= zeros(col, row);
% inputImage=im2double(img);
for i=1:col
    for j=1:row
        if( inputImage(i,j)>70)
            inputImage(i,j)=255;
        else
            inputImage(i,j)=0;
        end
    end
end

figure(3);hold on; imshow(inputImage);
% for i=1:col
%     for j=1:row
%         if(m(i,j)==255 && outputImage(i,j)==255)
%             ++connComp;
%             label=connComp;
%             %findComponentDFS(inputImage, outputImage, i, j, label);
%             
%             Queue(i,j)=
%             
%            % findComponentBFS(inputImage, outputImage, i, j, label);
%         end
%     end
% end






% 1st Pass and for 4 connectivity

for i=1:col
    for j=1:row
        if(inputImage(i,j)==0)
            continue;
        elseif(inputImage(i,j)==255 )
            if((inputImage(i,j-1)==0 && inputImage(i-1,j)==0))
                label=label+1;
                d(i,j)=label;
            elseif((inputImage(i,j-1)==0 && inputImage(i-1,j)==255))% uporer ta zero and left ar ta 1
                d(i,j)=d(i-1,j);
            elseif((inputImage(i,j-1)==255 && inputImage(i-1,j)==0))
                d(i,j)=d(i,j-1);
            end
        
        elseif(inputImage(i,j)==255 && (inputImage(i,j-1)==255 && inputImage(i-1,j)==255))
            if(d(i,j-1)==d(i-1,j))
                d(i,j)=d(i,j-1);
            else
                d(i,j)=d(i,j-1); %assign one of the labels to p and make a note that the two labels are equivalent
                flagequivalent(i,j)=100;% for tracking that (i-1,j) and (i, j-1) are equivalent
            end
        end
    end
end
% 
% % 2nd Pass and for 4 connectivity
% 
% for i=1:col
%     for j=1:row
%         if(flagEquivalent(i,j)==100)
%             d(i-1,j)= d(i,j);     
%             d(i,j-1)= d(i,j);     
%         end
%     end
% end

figure(2);hold on; imshow(img);
% figure(3);hold on; imshow(inputImage);