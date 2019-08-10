function [cluster_array] = AssignToClusters(image_array, colour_array)

%this function assigns each pixel in an image to a cluster, based on which
%mean that point is closest to.
%Author: Steven Ho
%Input: RGB_image_array: A 3D array with m rows, n columns and 3 layers,
%                        containing an RGB image
%       colour_array: A 3D array containing k rows, 1 column and 3 layers
%                     containing the colour information of each of k means.
%Outputs: cluster_array: A 2D array with m rows and n columns, containing
%                        the corresponding cluster number for each pixel in
%                        the image.

%obtain dimensions of image_array
[rows, columns, ~] = size(image_array);

%rearrange arrays for vectorization
permute_image_array = permute(image_array, [3 2 1]);

reshaped_image_array = reshape(permute_image_array, [3, rows * columns]);

rearranged_colour_array = permute(colour_array, [3 2 1]);

%calculate squared distance between point and selected mean point
distance_squared_array = (reshaped_image_array - ...
    rearranged_colour_array).^2;

%find total squared distance between each point
total_distance = sum(distance_squared_array);

%rearrange total_distance array into a 2D array
distance_array = permute(total_distance, [3 2 1]);

%find designated cluster for each point
[~, index] = min(distance_array, [], 1);

cluster = index; %in event of tie, assign to smallest cluster

%rearrange array back into original form
cluster_array = reshape(cluster, [columns, rows]);
cluster_array = permute(cluster_array, [2 1]);


end









