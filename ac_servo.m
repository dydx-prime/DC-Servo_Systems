% varibables for simulation
amplitude = 2 * pi;
period = .1;
input_delay = period / 4; 

% parameters
Km = 0.8; %
Ra = 1.5; % 
Jt = 1.2e-5 + 1e-4; % motor inertia + disk inertia
B = 0.25; % friction coefficient
Kb = 0.25; % 

% Lead screw conversion
L = .5; % lead of screw (in/turn)
L_new = (L * 0.0254) / (2 * pi); % gain m/rads

% inertias
inertia_motor = 1.2e-5;
inertia_screw = 4.71e-3;
inertia_cart = 0.150 * (L_new)^2;

% total inertia
Jtt = inertia_motor + inertia_screw + inertia_cart;

% load data
t_cart = out.cart_data.time;
x_cart = out.cart_data.signals.values;

t_disk = out.disk_data.time;
theta_disk = out.disk_data.signals.values;

% Plot cart position and disk angle
figure;

subplot(2,1,1);
plot(t_cart, x_cart, 'b');
title('Cart Position');
xlabel('Time (s)');
ylabel('Position (m)');
grid on;

subplot(2,1,2);
plot(t_disk, theta_disk, 'r');
title('Disk Angle');
xlabel('Time (s)');
ylabel('Angle (rad)');
grid on;

% data export

% cart_data = [t_cart, x_cart];
% disk_data = [t_disk, theta_disk];

% writematrix(cart_data, 'cart_data.csv');
% writematrix(disk_data, 'disk_data.csv');
