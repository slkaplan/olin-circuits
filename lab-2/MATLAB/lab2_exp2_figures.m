%% Semilog Plot 
loadspice("lab2_exp2_Iin100.txt")
loadspice("lab2_exp2_Iin1k.txt")
loadspice("lab2_exp2_Iin10k.txt")
semilogy(vin, Iin100, ".")
hold on
semilogy(vin, Iin1k, ".")
semilogy(vin, Iin10k, ".")
xlabel("Voltage(volts)")
ylabel("Current(amps)")
title ('Current Flowing Into Circuit vs. Input Voltage')
legend('100 ohm','1k ohm','10k ohm','Location','NorthEastOutside')

%% Linear Plot 100ohm resistor
plot(vin, Iin100, ".")
xlabel("Voltage(volts)")
ylabel("Current(amps)")
title('Linear Plot of 100ohm Resistor as a Function of Input Voltage')

%% Linear Plot 1kohm resistor
plot(vin, Iin1k, ".")
xlabel("Voltage(volts)")
ylabel("Current(amps)")
title ('Linear Plot of 1k ohm Resistor as a Function of Input Voltage')

%% Linear plot 10kohm resistor
plot(vin, Iin10k, ".")
xlabel("Voltage(volts)")
ylabel("Current(amps)")
title ('Linear Plot of 10k ohm Resistor as a Function of Input Voltage')

%% Single Plot Vin vs. Vdiode
loadspice("lab2_exp2_VinVdio100.txt")
loadspice("lab2_exp2_VinVdio1k.txt")
loadspice("lab2_exp2_VinVdio10k.txt")
plot(Vin, Vdio100, "r")
hold on
plot(Vin, Vdio1k, "g")
plot(Vin, Vdio10k, "b")
xlabel("Input Voltage(V)")
ylabel("Voltage Across Transistors")
title("Input Voltage vs. Voltage Across Diode")
legend('100 ohm','1k ohm','10k ohm','Location','NorthEastOutside')

%% Semilog Von vs R
% Ion = 




