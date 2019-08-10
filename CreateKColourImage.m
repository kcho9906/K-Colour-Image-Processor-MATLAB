function [final_image] = CreateKColourImage(cluster_array, mean_values)

%this function creates a k-colour image that has its pixels divided into k
%clusters. All pixels in a given cluster will be recoloured using the mean
%colour values for that cluster
%Author: Steven Ho
%Inputs: cluster_array: A 2D array specifying which cluster each pixel
%                       belongs to.
%        mean_values: A 3D array where each row contains the mean colour
%                     values for the cluster corresponding to that row number.
%Outputs: final_image: A 3D array of unsigned 8-bit integers representing
%                      an RGB image. The colour of each pixel is determined
%                      by the colour associated with that cluster.

%obtain cluster array dimensions
number_of_rows = size(cluster_array, 1);
number_of_columns = size(cluster_array, 2);

%set up dimensions for final_image
final_image = zeros(number_of_rows, number_of_columns, 3);

%cycle through each pixel and convert to repsective cluster RGB value
for row = 1:number_of_rows
    for column = 1:number_of_columns
        for layer = 1:3
            cluster = cluster_array(row, column);
            final_image(row, column, layer) = mean_values(cluster, 1, layer);
            
        end
    end
end

%convert to 8-bit unsigned intergers
final_image = uint8(final_image);
end


