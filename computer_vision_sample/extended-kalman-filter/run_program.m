%% PREPARE DIRECTORY
% clear all
clear init_script
close all
clc
curr_dir = pwd;
addpath(genpath([curr_dir,'/data']))

%% INITIALIZE THINGS
init_script
load studentdata1
% load studentdata4
% load studentdata9

%play images from camera mounted on quad 
figure 
for i=1:size(data,2) 
  imagesc(data(i).img);
  hold on;
  plot(data(i).p0(1,:),data(i).p0(2,:),'*g');
    drawnow
    hold off;
  
   
end
hold off; 



% data, time, vicon
dataL = length(data);
ts = zeros(dataL, 1);
vel = zeros(dataL, 3);
omg = zeros(dataL, 3);
tic
% from camera estimate quadrotor pos, vel, and angle
for i = 1:dataL
    sensor = data(i);
    ts(i) = sensor.t;
    [X, Z] = ekf2_handle(sensor);
    if ~isempty(X)
        pos(i, :) = X';
    end
   
end
t = toc;
disp(['Time to completion: ', num2str(t)])
time = time';
vicon = vicon';

% plot vicon data [x y z roll pitch yaw vx vy vz wx wy wz]'
% plot estimates
figure
subplot(3, 1, 1)
title(' Quadrotor Position EKF estimation'); 

hold on
plot(time, vicon(:,1), 'r', ts, pos(:, 1), 'b')
xlabel('Time [s]')
ylabel('X [m]')
legend('Vicon Measurement', 'Estimation');

hold off
subplot(3, 1, 2)
hold on
plot(time, vicon(:, 2), 'r', ts, pos(:, 2), 'b')
xlabel('Time [s]')
ylabel('Y [m]')
legend('Vicon Measurement', 'Estimation');

hold off
subplot(3, 1, 3)
hold on
plot(time, vicon(:, 3), 'r', ts, pos(:, 3), 'b')
xlabel('Time [s]')
ylabel('Z  [m]')
legend('Vicon Measurement', 'Estimation');

hold off

figure 
% title(' Quadrotor Velocity EKF estimation'); 

subplot(3, 1, 1)
title(' Quadrotor Velocity EKF estimation'); 

hold on
plot(time, vicon(:,7), 'r', ts, pos(:, 4), 'b')
xlabel('Time [s]')
ylabel('VX [m/s]')
legend('Vicon Measurement', 'Estimation');

hold off
subplot(3, 1, 2)
hold on
plot(time, vicon(:, 8), 'r', ts, pos(:, 5), 'b')
xlabel('Time [s]')
ylabel('VY [m/s]')
legend('Vicon Measurement', 'Estimation');
hold off
subplot(3, 1, 3)
hold on
plot(time, vicon(:, 9), 'r', ts, pos(:,6), 'b')
xlabel('Time [s]')
ylabel('VZ  [m/s]')
legend('Vicon Measurement', 'Estimation');

hold off

figure
subplot(3, 1, 1)
title(' Quadrotor Angle EKF estimation'); 

hold on
plot(time, vicon(:, 4), 'r', ts, pos(:,7), 'b')
xlabel('Time [s]')
ylabel('R [rad]')
legend('Vicon Measurement', 'Estimation');

hold off
subplot(3, 1, 2)
hold on
plot(time, vicon(:,5), 'r', ts, pos(:,8), 'b')
xlabel('Time [s]')
ylabel('P [rad]')
legend('Vicon Measurement', 'Estimation');

hold off
subplot(3, 1, 3)
hold on
plot(time, vicon(:, 6), 'r', ts, pos(:, 9), 'b')
xlabel('Time [s]')
ylabel('Y [rad]')
legend('Vicon Measurement', 'Estimation');

hold off
