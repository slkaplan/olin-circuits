loadspice('Lab0.txt');
hold on;
data = [];
fit = [];

for I = 1:3
[first, last, m, b, n] = linefit(vin, vout(I,:), 5e-4);
data = [data plot(vin, vout(I,:), '.')];
fit = [fit plot(vin, m*vin + b, '--')];
disp(m);
end

axis fill;
axis([0 5 -0.5 5.5]);
xlabel('Vin (V)');
ylabel('Vout (V)');
title('Inverting Op Amp Behavior - Variable Vref');
grid('on');
legend([data, fit],'Vref = 1.5V - recorded','Vref = 1.5V - fit',...
                   'Vref = 2.5V - recorded','Vref = 2.5V - fit',...
                   'Vref = 3.5V - recorded','Vref = 3.5V - fit');