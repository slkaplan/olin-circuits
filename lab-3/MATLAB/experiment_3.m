%% Lab 3: Resistors & Bipolar Transistors
loadspice("exp3data.txt");
U_T = .025; %V

%% Experiment 3: Follower Voltage Transfer Characteristics

hold on;
grid on;
vout_theoretical = 0.98*vin - 0.6;

plot(vin, vout, '.', 'DisplayName', 'Measured')
plot(vin, vout_theoretical, '-', 'DisplayName', 'Theoretical')
axis([0 5 0 5])

legend();
title("Emitter Follower: Theoretical vs. Measured for R = 1k \Omega");
xlabel("V_{in} (V)");
ylabel("V_{out} (V)");

% gain is roughly \alpha_f (not quite sure on the math for this one -- it just makes graphical sense).
    % if we can't decide it's actually \alpha_f we just say it's one, not
    % that big of a difference
% The difference betweem V_{out} and V_{in} is V_{be}; obtained using Kirchoff's
% V_{be} is logarithmically affected by the emitter current I_e.