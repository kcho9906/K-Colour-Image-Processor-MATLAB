function [unique_pixels_array] = SelectKRandomPoints(image_array, number_of_points)

%This function, SelectKRandomPoints generates a list of randomly
%selected pixels from an image array.

%Inputs: image_array: 3D image from which to select points from
%        number_of_points: number of points to randomly select
%Output: selected_pixels_array: 2D array containing 'number_of_points'
%        rows and 2 columns, representing the randomly selected points.

%Reads the size of the image data
[rows, columns,~] = size(image_array);

%out of rows*columns combinations, selects 'number_of_points' unique points
%and saves into variable 'p'
unique_points_array = randperm(rows*columns, number_of_points);

%searches for indexes (i, j)for the unique integers generated 
%in unique_points_array
[i, j] = ind2sub([rows,columns], unique_points_array);

%merges 'i' and 'j' into a 2D array 'points' containing k rows and 2
%columns by using transpose operator
unique_pixels_array = [(i)',(j)'];
end

