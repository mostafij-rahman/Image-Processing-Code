close all;
I=imread('F:\Education\7th semester\paper\Code_date_18_APril\Code_Today5\Original\Life\395547_247488961999326_424454890_n.jpg');
% I=rgb2gray(I);
% J = imnoise(I,'salt & pepper',0.02);
% 
mask = ones(3, 3); 


% 
% 
% K = medfilt2(J);
% imshow(J), figure, imshow(K);

% I=imread('super.jpeg');
A = im2double(I);
B = imnoise(A,'salt & pepper',0.02);
A = imnoise(A,'salt & pepper',0.02);
[m n] = size(A);
Med = [];
%Modified filter 
for i=2:m-1
    for j=2:n-1
            Med(1) = A(i-1,j-1);
            Med(2) =A(i-1,j) ;
            Med(3) = A(i-1,j+1);
            Med(4) = A(i,j-1);
            Med(5) = A(i,j+1);
            Med(6) = A(i+1, j-1);
            Med(7) = A(i+1,j);
            Med(8) = A(i+1,j+1);

            A(i,j) = median(Med);
    end
end 
imshow(I);
figure;imshow(B);
figure; imshow(A);