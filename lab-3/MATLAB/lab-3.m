%% Lab 3: Resistors & Bipolar Transistors
load('lab3exp1.mat');

%% Experiment 1: Bipolar Transistor Characteristics

% Semilong plot showing the collector current AND base current as a function of base voltage. 
% Should include appropriate theoretical fits (just use Curve Fit Tool I guess…) and extracted parameter values?

% Plot given data
figure(1);
hold on;
grid on;
title('I_b, I_c and V_b with Theoretical fits');
xlabel('V_be (V)'); ylabel('Currents (A)');

plot(Vbe, Ib);
plot(Vbe, Ic);
set(gca, 'yscale','log');

% Plot theoretical fits



%% Experiment 2: Emitter-Degenerated Bipolar Characteristics

%% Experiment 3: Follower Voltage Transfer Characteristics

%% Experiment 4: Inverter Voltage Transfer Characteristics
