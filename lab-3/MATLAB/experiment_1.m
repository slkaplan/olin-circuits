%% Lab 3: Resistors & Bipolar Transistors
% Experiment 1: Bipolar Transistor Characteristics
load('lab3exp1.mat');
% Vbe_spice = loadspice('exp3data.txt');
% Ib_spice = loadspice('exp3data.txt');
% Ic_spice = loadspice('exp3data.txt');

U_T = .025; %V

%% Semilog plot of collector current AND base current as a function of base voltage. 
% Should include appropriate theoretical fits (just use Curve Fit Tool I guess…) and extracted parameter values?

% Plot given data
figure(1);
hold on;
grid on;
title('Bipolar: I_b, I_c vs V_b');
xlabel('V_{be} (V)'); ylabel('Current (A)');

% plot(Vbe, Ib,'.');
% plot(Vbe, Ic,'.');

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
% plot(fitresult, xData, yData );
    plot(xData, yData, '.');

I_s_t = 3e-15;
I_c_t = I_s_t.*exp(xData./U_T);
plot(xData, I_c_t);

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
% plot(fitresult2, xData2, yData2);
plot(xData2, yData2, '.');

beta = Ic./Ib;

I_b_t = I_c_t./beta';
plot(xData2, I_b_t);

% Extract fitted values
coeffs = coeffvalues(fitresult);
coeffs2 = coeffvalues(fitresult2);
beta = Ic./Ib;

U_T_f = 1/(10*coeffs(2));
I_S_f = mean(coeffs2(1)./beta);

str1 = sprintf('U_T = %.4f V', (U_T_f));
str2 = sprintf('I_S = %.4s A', (I_S_f));
% + newline + sprintf('I_S = %f', (I_S))
annotation('textbox',[0.15, 0.8, 0.1, 0.1],'String',str1,'FitBoxToText','on', 'BackgroundColor', 'w');
annotation('textbox',[0.15, 0.7, 0.1, 0.1],'String',str2,'FitBoxToText','on','BackgroundColor', 'w');

set(gca, 'yscale',  'log');
legend('I_b', 'I_b (fit)', 'I_c', 'I_c (fit)','Location','southeast');

% The collector current follows an exponential relationship with the base
% voltage

%% Plot current gain (beta = Ic/Ib) as a function of the base current (FIG 2)
% (make the Ib axis logarithmic).

figure(2);
hold on;
grid on;
title('Bipolar: \beta vs I_b');
xlabel('I_b (A)'); ylabel('\beta');

beta = Ic./Ib;
plot(Ib,beta);
set(gca, 'xscale','log');

legend('\beta (measured)', 'Location', 'southeast');
    
% Question:
% Current gain is not constant with base current across the entire
% response, but it is reasonable to assume that it's 

% If not, under what circumstances would it be reasonable to assume it to be constant?

%% Extract the incremental base resistance (rb) from the base current-voltage characteristic
% make a log-log plot (FIG 3) of rb vs. Ib WITH a theoretical fit.

% Assume forward active since collector current is held at 5V
figure(3);
hold on;
grid on;
title('Bipolar: r_b vs I_b');
xlabel('I_b (A)'); ylabel('r_b');

rb_f = U_T_f./Ib;
rb_t = U_T./Ib;

plot(Ib, rb_f, '.'); F3L1 = 'r_b (measured)';
plot(Ib, rb_t); F3L2 = 'r_b (theoretical)';

set(gca, 'yscale','log');
legend(F3L1, F3L2);

% Theoretical fit

% extract gm

%% log-log plot (FIG 4) of gm vs. Ic, with theoretical fit

figure(4);
hold on;
grid on;
title('g_m as a function of I_c');
xlabel('I_c (A)'); ylabel('g_m');

gm_f = Ic./U_T_f;
gm_t = Ic./U_T;

plot(Ic, gm_f, '.'); F4L1 = 'g_m (measured)';
plot(Ic, gm_t); F4L2 = 'g_m (theoretical)';
set(gca, 'yscale','log');
set(gca, 'xscale','log');

legend(F4L1, F4L2, 'Location', 'southeast');

%% Theoretical Gummel Plot

% Plot measured data
figure(6);
hold on;
grid on;
title('Bipolar: I_b, I_c vs V_b - LTSpice');
xlabel('V_{be} (V)'); ylabel('Current (A)');

% plot(Vbe, Ib,'.');
% plot(Vbe, Ic,'.');

% Plot theoretical of I_c
[xData, yData] = prepareCurveData( Vbe_spice, Ic_spice );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares');
opts.Display = 'Off';
opts.Normalize = 'on';
% opts.StartPoint = [5.00918741733474e-06 4.84284559039923];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% plot(fitresult, xData, yData );
    plot(xData, yData, '.');

I_s_t = 3e-15;
I_c_t = I_s_t.*exp(xData./U_T);
plot(xData, I_c_t);

% theoretical from I_b
[xData2, yData2] = prepareCurveData( Vbe_spice, Ib_spice );

% Set up fittype and options.
ft2 = fittype( 'exp1' );
opts2 = fitoptions( 'Method', 'NonlinearLeastSquares');
opts2.Display = 'Off';
opts2.Normalize = 'on';
opts.StartPoint = [5.00918741733474e-06 4.84284559039923];

% Fit model to data.
[fitresult2, gof] = fit( xData2, yData2, ft, opts2 );

% Plot fit with data.
% plot(fitresult2, xData2, yData2);
plot(xData2, yData2, '.');

beta_spice = Ic_spice./Ib_spice;

I_b_t = I_c_t./beta_spice';
plot(xData2, I_b_t);

% Extract fitted values
coeffs = coeffvalues(fitresult);
coeffs2 = coeffvalues(fitresult2);

U_T_f = 1/(10*coeffs(2));
I_S_f = mean(coeffs2(1)./beta_spice);

str1 = sprintf('U_T = %.4f V', (U_T_f));
str2 = sprintf('I_S = %.4s A', (I_S_f));
% + newline + sprintf('I_S = %f', (I_S))
annotation('textbox',[0.15, 0.8, 0.1, 0.1],'String',str1,'FitBoxToText','on', 'BackgroundColor', 'w');
annotation('textbox',[0.15, 0.7, 0.1, 0.1],'String',str2,'FitBoxToText','on','BackgroundColor', 'w');

set(gca, 'yscale',  'log');
legend('I_b', 'I_b (fit)', 'I_c', 'I_c (fit)','Location','southeast');

%% log-log plot (FIG 7) of our gm vs. Ic, with theoretical fit

figure(7);
hold on;
grid on;
title('Bipolar: g_m vs I_c - LTSpice');
xlabel('I_c (A)'); ylabel('g_m');

gm_f = Ic./U_T_f;
gm_t = Ic./U_T;

plot(Ic_spice, gm_f, '.'); F7L1 = 'g_m (measured)';
plot(Ic_spice, gm_t); F7L2 = 'g_m (theoretical)';
set(gca, 'yscale','log');
set(gca, 'xscale','log');

legend(F7L1, F7L2, 'Location', 'southeast');