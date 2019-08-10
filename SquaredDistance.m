function [squared_distance] = SquaredDistance(first_point, second_point)

%this function calculates the square of the distance between two points in
%3D space
%Author: Steven Ho
%Inputs: first_point: an array containing three elements representing a
%                     point in 3D space
%        second_point: an array containing three elements representing a
%                      second point in 3D space
%Outputs: squared_distance: the square of the distance between the two
%                           points in 3D space


%find squared distance between two repsective points
squared_distance = sum((first_point - second_point) .^2);
end



