function [cluster_mean_array] = UpdateMeans(image_array, amount_of_clusters, cluster_array)

%this function calculates the mean values for each cluster group.
%Author: Steven Ho
%Inputs: image_array: A 3D array of an RGB image
%        amount_of_clusters: single value of how many clusters there are
%        cluster_array: A 2D array specifying which cluster each pixel
%                       belongs to.
%Outputs: cluster_mean_array: A 3D array containing mean values for each
%                             cluster.

%preallocate cluster_mean_array size
cluster_mean_array = zeros(amount_of_clusters, 1, 3);

%set up cluster_number array for vectorisation
cluster_number = 1:amount_of_clusters;
[~, column] = size(cluster_number);
cluster_number = reshape(cluster_number, [1, 1, column]);

%find every point in each cluster
logical_array = (cluster_array == cluster_number);
double_array = double(logical_array); %convert logical array to double array

for i = 1:amount_of_clusters %cycle through values of each cluster
    new_array = double_array(:, :, i) .* image_array;
    number_of_points = length(find(logical_array(:, :, i)));
    layer_means = sum(new_array) ./ number_of_points; %find new mean for each layer
    cluster_mean_array(i, :, :) = sum(layer_means);%find new mean for each cluster
end

end



