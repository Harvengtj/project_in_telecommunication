%% FRIIS FORMULA
clc; clear, close all;

% === Parameters ===
beta = 0:0.1:1;
BER_beta = [0.01937, 0.02034, 0.002255, 0.00169, 0.0008138, 0.0009428, 0.0008622, 0.0001544, 0.0005597, 0.0003359, 0.0002094]
BW_beta = [596.0999, 549.0253, 565.1651, 602.4452, 636.3917, 679.9635, 718.9483, 764.4765, 800.2511, 845.1479, 875.1860]

d = 0.2:0.2:1  % Distance between antennas
BER_distance = [0.0004094, 0.000985, 0.05978, 0.003273, 0.08209]
Prx = zeros(1, length(d));  % Received power
Ptx = 0.001;  % Transmitted power
Gtx = 10^(25/10);  % Linear gain at transmitter
Grx = 10^(35/10);  % Linear gain at receiver
f = 2.4e9;  % Center frequency
lambda = 300e6/f;  % Wave length

% === Formula ===
for i = 1:length(d)
    Prx(i) = Ptx*Gtx*Grx*(lambda/(4*pi*d(i)))^2;
end

% === Plot ===
% Friis estimation
figure('Name','Friis');
plot(d, Prx);
xlabel('Distance [m]');
ylabel('Received power [W]');
title('Received power VS distance');

% Beta
figure('Name','Beta');
subplot(1,2,1);
plot(beta, BER_beta);
xlabel('Roll-off [/]');
ylabel('BER [s^-1]');
title('BER VS Roll-off');
subplot(1,2,2);
plot(beta, BW_beta);
xlabel('Roll-off [/]');
ylabel('BW [kHz]');
title('Bandwidth VS Roll-off');

% Distance
figure('Name','Distance');
plot(d, BER_distance);
hold on;
plot(d, BER_distance, '*');
hold off;
xlabel('distance [m]');
ylabel('BER [s^-1]');
title('BER VS Distance');





