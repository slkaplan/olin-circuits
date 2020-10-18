clear;
clf;
% voltage-current = voltage with respect to current

%% Plot Current Voltage & Voltage-Current, and exponential theoretical fit
% need multiple sides axes on plot!

load('lab2exp1.mat');

f1 = figure(1);
hold on
grid on;
% ylabel2()
title('Current-Voltage, Voltage-Current, and Theoretical Fit')

% Plot measured data
plot(VdIV,IdIV,'.r'); % current-voltage
plot(VdVI,IdVI,'.b'); % voltage-current

% Set up fittype and options.
[xData, yData] = prepareCurveData( VdIV, IdIV);
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [4.16279722551985e-15 38.2688371518049];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult,'g');
% legend( h, 'IdIV vs. VdIV', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );

% set Y scale
set(gca, 'YScale', 'log')

ylabel('Current (A)')
xlabel('Voltage (V)')
legend('I_{\delta I}','I_{\delta V}','I_{theoretical}','Location','northwest');

coeffs = coeffvalues(fitresult)

U_T = 1/coeffs(2)
I_S = coeffs(1)

str1 = sprintf('U_T = %f V', (U_T))
str2 = sprintf('I_S = %.4s A', (I_S))
% + newline + sprintf('I_S = %f', (I_S))
annotation('textbox',[0.15, 0.6, 0.1, 0.1],'String',str1,'FitBoxToText','on', 'BackgroundColor', 'w');
annotation('textbox',[0.15, 0.5, 0.1, 0.1],'String',str2,'FitBoxToText','on','BackgroundColor', 'w');

%% Incremental Resistance vs. current
f2 = figure(2);
hold on
grid on;
title('R_d vs I, and Theoretical Fit')
set(gca, "xscale", "log");
set(gca, "yscale", "log");
r_d_measured = diff(VdIV)./diff(IdIV);
IdIV_f = IdIV(2:end);

% Plot experimental
plot(IdIV(2:end),r_d_measured,'.');

[xData2, yData2] = prepareCurveData( IdIV_f, r_d_measured );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% opts.StartPoint = [0.00232201801820555 -9.18240074428805e-07];

% Fit model to data.
[fitresult2, gof] = fit( xData2, yData2, ft, opts );

% Plot fit with data.
plot(xData2, yData2);xData2, yData2
plot( fitresult2 );

set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

xlabel('Current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('r_d (measured)','r_d (theoretical)','Location','northeast')


%% Measured Plot Current Voltage & Voltage-Current, and exponential theoretical fit
% need multiple sides axes on plot!

clear;


loadspice('voltage_current_ex1.txt');
loadspice('current_voltage_ex1.txt');

f3 = figure(3);
hold on
grid on;
% ylabel2()
title('Measured Current-Voltage, Voltage-Current, and Theoretical Fit')

% Plot measured data
plot(vin,Iout,'.r'); % current-voltage
plot(vt,iin,'.b'); % voltage-current

% Set up fittype and options.
[xData, yData] = prepareCurveData( vt, iin);
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% opts.StartPoint = [4.16279722551985e-15 38.2688371518049];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
plot(fitresult,'g');
% legend( h, 'IdIV vs. VdIV', 'untitled fit 1', 'Location', 'NorthEast', 'Interpreter', 'none' );

% set Y scale
set(gca, 'YScale', 'log')

ylabel('Current (A)')
xlabel('Voltage (V)')
legend('I_{\delta I}','I_{\delta V}','I_{theoretical}','Location','northwest');

coeffs = coeffvalues(fitresult)

U_T = 1/coeffs(2)
I_S = coeffs(1)

str1 = sprintf('U_T = %f V', (U_T))
str2 = sprintf('I_S = %.4s A', (I_S))
% + newline + sprintf('I_S = %f', (I_S))
annotation('textbox',[0.15, 0.6, 0.1, 0.1],'String',str1,'FitBoxToText','on', 'BackgroundColor', 'w');
annotation('textbox',[0.15, 0.5, 0.1, 0.1],'String',str2,'FitBoxToText','on','BackgroundColor', 'w');

%% Measured Incremental Resistance vs. current
f4 = figure(4);
hold on
grid on;
title('Measured R_d vs I, and Theoretical Fit')
set(gca, "xscale", "log");
set(gca, "yscale", "log");
r_d_measured = diff(vin)./diff(Iout);
IdIV_f = Iout(2:end);

% Plot experimental
plot(Iout(2:end),r_d_measured,'.');

[xData2, yData2] = prepareCurveData( IdIV_f, r_d_measured );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
% opts.StartPoint = [0.00232201801820555 -9.18240074428805e-07];

% Fit model to data.
[fitresult2, gof] = fit( xData2, yData2, ft, opts );

% Plot fit with data.
plot(xData2, yData2);xData2, yData2
plot( fitresult2 );

set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')

xlabel('Current (A)')
ylabel('Incremental Resistance (\Omega)')
legend('r_d (measured)','r_d (theoretical)','Location','northeast')
