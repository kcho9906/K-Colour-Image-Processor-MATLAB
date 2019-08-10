function [clusters, new_means] = KMeansRGB(image_array, seed_means, max_iterations)

%this function partitions the points in an image into k clusters, using the
%k means algorithm to do so.
%Author: Steven Ho
%Inputs: image_array: A 3D array containing an RGB image
%        seed_means: A 3D array containing the seed mean values which will
%                    be used to initialise the k-means algorithm.
%        max_iterations: the maximum number ofiterations to perform.
%Outputs: clusters: A 2D array specifying which cluster each pixel belongs
%                   to.
%         new_means: A 3D array where each row contains the mean colour
%                      values for the cluster corresponding to that row number.

%set up iterations
amount_of_clusters = size(seed_means, 1);
iterations = 0;
new_means = seed_means;
previous_means = zeros(size(seed_means));
identical_means = isequal(new_means, previous_means); %check if max iterations reached

%continue looping until max iterations reached or mean values identical
while ~identical_means && iterations <= max_iterations
    
    %assignment step
    previous_means = new_means;
    [clusters] = AssignToClusters(image_array, previous_means);
    
    iterations = iterations + 1; %increase iteration number by 1
    
    %update means
    new_means = UpdateMeans(image_array, amount_of_clusters, clusters);
    
    %if max iterations reached, stop code and return message to user
    if iterations == max_iterations
        disp('Maximum number of iterations reached before convergence was achieved')
        return
    end
    
    %update status of identical means
    identical_means = isequal(new_means, previous_means);
    
end




