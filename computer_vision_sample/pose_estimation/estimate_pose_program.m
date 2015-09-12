%testing pose estimation against VICON readings 

load('data/studentdata4.mat');
init_script; 
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

%% plot estimated pose vs actual measured from vicon
for i = 1:length(data)
    sensor = data(i); 
    [pos,eul]=estimate_pose_handle(sensor); 
   P(i,:) = pos; 
   E(i,:) = eul; 
   T(i) = sensor.t; 
end

figure 


subplot(3,1,1);
plot(time, vicon(1,:),'r'); 
hold on 
plot(T, P(:,1),'b'); 
legend('Actual X pos ','Vision estimated X pos ');
xlabel('Time (s)'); 
ylabel('X (m)'); 

subplot(3,1,2);
plot(time,vicon(2,:),'r'); 
hold on
plot(T,P(:,2),'b'); 
legend('Actual Y pos ','Vision estimated Y pos '); 
xlabel('Time (s)'); 
ylabel('Y (m)'); 

subplot(3,1,3); 
plot(time,vicon(3,:),'r');
hold on; 
plot(T,P(:,3),'b');
legend('Actual Z pos ','Vision estimated Z pos '); 
xlabel('Time (s)'); 
ylabel('Z (m)'); 



figure 
subplot(3,1,1);
plot(time, vicon(4,:),'r'); 
hold on 
plot(T, E(:,1),'b'); 
legend('Actual Roll ','Vision estimated Roll ');
xlabel('Time (s)'); 
ylabel('Roll (degrees)'); 


subplot(3,1,2);
plot(time,vicon(5,:),'r'); 
hold on
plot(T,E(:,2),'b'); 
legend('Actual Pitch ','Vision estimated Pitch '); 
xlabel('Time (s)'); 
ylabel('Pitch (degrees)'); 


subplot(3,1,3); 
plot(time,vicon(6,:),'r');
hold on; 
plot(T,E(:,3),'b');
legend('Actual Yaw ','Vision estimated Yaw '); 
xlabel('Time (s)'); 
ylabel('Yaw (degrees)'); 



