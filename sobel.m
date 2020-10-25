close all;% clear max; 
clear all;
Original_Image=imread('F:\Education\8th semester\Paper\Shanto Paperf\Original\girl.jpg');
Gray_Edge_Image = rgb2gray (Original_Image);
Temp_Image = double (Gray_Edge_Image) ;
max_value = -1 ;
%Start iterate from first corner to last corner
% size(Temp_Image,1) gives number of rows; we subtract 2 bec. of leaving  boundry
Gray_Edge_Image=padarray(Temp_Image,[1 1]);
for i = 2 : size(Temp_Image,1) - 1
    for j = 2 : size (Temp_Image, 2) - 1
                
        %calculating gradient in X direction % Here, i use sobel operator 3*3
        X_Gradient = ( ( Temp_Image( i + 1 , j-1 ) + 2*Temp_Image(i+1,j)+ Temp_Image (i+1,j+1) ) - ( Temp_Image(i-1,j-1) + 2*Temp_Image(i-1,j) + Temp_Image (i-1,j+1) ) );
        %calculating gradient in Y direction
        Y_Gradient = ( ( Temp_Image(i-1,j+1) + 2*Temp_Image(i,j+1) + Temp_Image (i+1,j+1) ) - ( Temp_Image(i-1,j-1) + 2*Temp_Image(i,j-1) + Temp_Image (i+1,j-1)));
        %display(' X_Gradient= ' + i + ' Y_Gradient = ' +j );
        distance=  abs(Y_Gradient)+ abs(X_Gradient) ;
       %display(' i= ' + i + ' j= ' +j);
        Gray_Edge_Image(i-1 , j-1) = distance;
        
        if (max_value < Gray_Edge_Image ( i-1, j-1 ) )
            max_value = Gray_Edge_Image ( i-1 ,j-1 )  ;
        end
    end
end

%converting whole image value in between 0 to 255; division makes it in range of [0,1]
for i = 2 : size(Temp_Image,1)-1 
    for j = 2 : size (Temp_Image, 2)-1
        Gray_Edge_Image ( i-1 ,j-1 ) = ((Gray_Edge_Image ( i-1 ,j-1 )/ max_value ) * 255 );
       
    end
end
figure, imshow(Original_Image), figure, imshow(Gray_Edge_Image);
                              