% add additional inputs after sensor if you want to
% Example:
% your_input = 1;
% estimate_pose_handle = @(sensor) estimate_pose(sensor, your_input);
% We will only call estimate_pose_handle in the test function.
% Note  this will only create a function
% handle, but not run the function at all.

%calculate world points 
world_points; 

%Camera param matrix 
K = [314.1779 0         199.4848; ...
0         314.2218  113.7838; ...
0         0         1];

estimate_pose_handle = @(sensor) estimate_pose(sensor,Wp,K);
