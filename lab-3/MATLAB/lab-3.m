%% Lab 3: Resistors & Bipolar Transistors
load('lab3exp1.mat');
U_T = .025; %V

%% Experiment 1: Bipolar Transistor Characteristics

% Semilong plot showing the collector current AND base current as a function of base voltage. 
% Should include appropriate theoretical fits (just use Curve Fit Tool I guess…) and extracted parameter values?

% Plot given data
figure(1);
hold on;
grid on;
title('I_b, I_c and V_b with Theoretical fits');
xlabel('V_{be} (V)'); ylabel('Current (A)');

plot(Vbe, Ib,'.');
plot(Vbe, Ic,'.');

% Plot theoretical of I_c
[xData, yData] = prepareCurveData( Vbe, Ic );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares');
opts.Display = 'Off';
opts.Normalize = 'on';
% opts.StartPoint = [5.00918741733474e-06 4.84284559039923];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult, xData, yData );

% theoretical from I_b
[xData2, yData2] = prepareCurveData( Vbe, Ib );

% Set up fittype and options.
ft2 = fittype( 'exp1' );
opts2 = fitoptions( 'Method', 'NonlinearLeastSquares');
opts2.Display = 'Off';
opts2.Normalize = 'on';
opts.StartPoint = [5.00918741733474e-06 4.84284559039923];

% Fit model to data.
[fitresult2, gof] = fit( xData2, yData2, ft, opts2 );

% Plot fit with data.
plot(fitresult2, xData2, yData2 );

% Extract fitted values
coeffs2 = coeffvalues(fitresult2);
beta = Ic./Ib;

U_T_fit2 = 1/coeffs2(2);
I_S_fit2 = mean(coeffs2(1)./beta);

str1 = sprintf('U_T = %f V', (U_T_fit));
str2 = sprintf('I_S = %.4s A', (I_S_fit));
% + newline + sprintf('I_S = %f', (I_S))
annotation('textbox',[0.15, 0.6, 0.1, 0.1],'String',str1,'FitBoxToText','on', 'BackgroundColor', 'w');
annotation('textbox',[0.15, 0.5, 0.1, 0.1],'String',str2,'FitBoxToText','on','BackgroundColor', 'w');

set(gca, 'yscale',  'log');
legend('I_b', 'I_c','I_b (fit)', 'I_c (fit)','Location','northwest');


%% Plot current gain (beta = Ic/Ib) as a function of the base current (FIG 2)
% (make the Ib axis logarithmic).

figure(2);
hold on;
grid on;
title('\beta as a function of I_b');
xlabel('I_b (A)'); ylabel('\beta');

beta = Ic./Ib;
plot(Ib,beta);
set(gca, 'yscale','log');

% Extract the incremental base resistance (rb) from the base current-voltage characteristic
% make a log-log plot (FIG 3) of rb vs. Ib WITH a theoretical fit.

% Assume forward active since collector current is held at 5V
figure(3);
hold on;
grid on;
title('r_d as a function of I_b');
xlabel('r_d'); ylabel('I_b (A)');

rd = U_T./Ib;
plot(Ib, rd);
set(gca, 'yscale','log');

% Theoretical fit

% extract gm

% Make a log-log plot (FIG 4) of gm vs. Ic, with theoretical fit

figure(4);
hold on;
grid on;
title('g_m as a function of I_c');
xlabel('I_c (A)'); ylabel('g_m');

gm = Ic/U_T;

plot(Ic, gm);
set(gca, 'yscale','log');
set(gca, 'xscale','log');

% Plot theoretical


%% Experiment 2: Emitter-Degenerated Bipolar Characteristics

%% Experiment 3: Follower Voltage Transfer Characteristics

%% Experiment 4: Inverter Voltage Transfer Characteristics
