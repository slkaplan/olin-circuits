loadspice('InvAmp.txt')


[first1, last1, m1, b1, n1] = linefit(vin, vout(2,:), 5e-3);
[first2, last2, m2, b2, n2] = linefit(vin, vout(1,:), 5e-3);
[first3, last3, m3, b3, n3] = linefit(vin, vout(3,:), 5e-3);

hold on 
plot(vin, vout, '*');
plot(vin, m1 * vin + b1, '-k');
plot(vin, m2 * vin + b2, '-g');
plot(vin, m3 * vin + b3, '-b');

axis([ 0 5 0 5]);
xlabel("Vin(V)")
ylabel("Vout(V)")
legend('Vref = 0.5V', 'Vref = 2.5V', 'Vref = 4.5V', 'LoBF Vref = 2.5V', 'LoBF Vref = 0.5V','LoBF Vref = 4.5V')
title('Inverting Amplifier, Vin vs Vout, Vref Sweep');