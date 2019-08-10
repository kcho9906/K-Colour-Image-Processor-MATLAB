function [RGB_values] = GetRGBValuesForPoints(image_array, points)

%This function returns the RGB colour values for a list of specified points
%from an image
%Author: Steven Ho
%Inputs: image_array: A 3D image array from which to obtain RGB values from
%        points: A 2D array of k rows and 2 columns containing the points
%                to extract colour values for
%Outputs: RGB_values: A 3D array containing k rows, 1 column and 3 layers,
%                     representing a list of k points from the image.

%set up RGB_values array size
number_of_rows = size(points);
RGB_values = zeros(number_of_rows(1), 1, 3);

%cycle through each pixel and obtain their RGB values respectively
for row = 1:number_of_rows
    
    %saves the row and column data of 'points' to a 1x2 array 'position'.
    %This will be used for indexing.
    position = points(row,:);
    
    %extracts the RGB colour values of 'image_array' and stores in a 3D
    %array'colourValues'.
    RGB_values(row,1,:) = image_array(position(1),position(2),:);
    
end
