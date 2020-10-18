loadspice('Vdev_mc.txt')

gains = [];
intercepts = [];
for i = 1:500 
    [first, last, m, b, n] = linefit(vin, vout(i,:), 1e-4);
    gains = [gains,m];
    intercepts = [intercepts, b];
end
meangain = mean(gains);
meanintercept = mean(intercepts);
%subplot(2,1,1)
% hold on
% plot(vin, vin * meangain + meanintercept, '-k','LineWidth',3)
% plot(vin,vout,'.b')
% xlabel("Vin(V)")
% ylabel("Vout(V)")
% legend('LoBF, Slope = 0.3338', 'VTC Monte-Carlo Scatter plot')
% title('Resistive Voltage Divider VTC, 500 Run Monte Carlo Simulation, Vin vs Vout, Resistor Cv = 0.2%');
% subplot(2,1,2)
histogram(gains, 15)
xlabel("Extracted Gains")
ylabel("Frequency")
title('Resistive Voltage Divider Extracted Gains Histogram, Gain vs Frequency');
% , Resistor Cv = 0.2%, Extracted Cv = 0.18%

extracted_cv = std(gains)./mean(gains);
theoretical_cv = sqrt((-2/3).^2 .*(0.002).^2 + (2/3).^2 .*(0.002).^2)