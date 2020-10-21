
%%
% EXPERIMENT 2

%% Semilog plot Ic vs. Vb for all R values

loadspice('exp2.txt')
sub_sample = 10
Vb_sub = downsample(vb,sub_sample)
Ic1 = Ic(1,:)
Ic1_sub = downsample(Ic1,sub_sample)
Ic2 = Ic(2,:)
Ic2_sub = downsample(Ic2,sub_sample)
Ic3 = Ic(3,:)
Ic3_sub = downsample(Ic3,sub_sample)
figure();
set(gca, 'YScale', 'log')
hold on


plot(Vb_sub, Ic1_sub, 'o', 'DisplayName','R = 100 Ohms')
plot(Vb_sub, Ic2_sub, 'o', 'DisplayName','R = 1000 Ohms')
plot(Vb_sub, Ic3_sub, 'o', 'DisplayName','R = 10000 Ohms')

legend
title('Ic vs. Vb Semilog ALL R-values')
xlabel('Volts (V)')
ylabel('Amps (A)')

% NEED COLLECTOR CURRENT CHARACTERISTIC AND THEORETICAL FIT FROM EXP !!!!!!

%% Linear plots for each R value

figure();
set(gca, 'YScale', 'linear')

subplot(3,1,1)
plot(Vb_sub, Ic1_sub, 'o', 'DisplayName','R = 100 Ohms')
title('Linear Ic Individual R-values')
legend
xlabel('Volts (V)')
ylabel('Amps (A)')

subplot(3,1,2)
plot(Vb_sub, Ic2_sub, 'o', 'DisplayName','R = 1000 Ohms')
legend
xlabel('Volts (V)')
ylabel('Amps (A)')

subplot(3,1,3)
plot(Vb_sub, Ic3_sub, 'o', 'DisplayName','R = 10000 Ohms')
legend
xlabel('Volts (V)')
ylabel('Amps (A)')

% ALL STILL NEED THEORETICAL FITS FUCKFACE !!!!!!!!!!!


%% Extract incremental resistance of base terminal Rb (with emitter degeneration)
% six lines on one graph , rb_1 vs. Ib1 etc... + theoretical fits using
% eqs. from prelab

Ib_1 = Ib(1,:)
rb_1 = diff(vb)./diff(Ib_1)

Ib_2 = Ib(2,:)
rb_2 = diff(vb)./diff(Ib_2)

Ib_3 = Ib(3,:)
rb_3 = diff(vb)./diff(Ib_3)

figure();
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

plot(Ib(1,1:1000), rb_1, 'o', 'DisplayName','R = 100 Ohms')
plot(Ib(2,1:1000), rb_2, 'o', 'DisplayName','R = 1000 Ohms')
plot(Ib(3,1:1000), rb_3, 'o', 'DisplayName','R = 10000 Ohms')

% plot theoretical

beta = Ic./Ib
Ut = 0.025
rb_100 = Ut./Ib_1
rb_1000 = Ut./Ib_2
rb_10000 = Ut./Ib_3

Rb_100 = rb_100 + (beta(1,:) + 1) * 100
Rb_1000 = rb_1000 + (beta(2,:) + 1) * 1000
Rb_10000 = rb_10000 + (beta(3,:) + 1) * 10000

plot(Ib(1,1:1001), Rb_100, '-', 'DisplayName','Theoretical, R = 100 Ohms')
plot(Ib(2,1:1001), Rb_1000, '-', 'DisplayName','Theoretical, R = 1000 Ohms')
plot(Ib(3,1:1001), Rb_10000, '-', 'DisplayName','Theoretical, R = 10000 Ohms')

legend
title('Incremental Resistance vs. Ib')
ylabel('Incremental Resistance (Ohms)')
xlabel('Ic (A)')




%% For each resistor extract incremental transconductance gain and do theoretical fits


gm_1 = diff(Ic1)./diff(vb)

Ib_2 = Ib(2,:)
gm_2 = diff(Ic2)./diff(vb)

Ib_3 = Ib(3,:)
gm_3 = diff(Ic3)./diff(vb)

figure();
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

plot(Ic(1,1:1000), gm_1, 'o', 'DisplayName','R = 100 Ohms')
plot(Ic(1,1:1000), gm_2, 'o', 'DisplayName','R = 1000 Ohms')
plot(Ic(1,1:1000), gm_3, 'o', 'DisplayName','R = 10000 Ohms')

% plot theoretical

Gm_100 = (1/100) * (1./(1 + Ut./(Ic1 * 100)))
Gm_1000 = (1/1000) * (1./(1 + Ut./(Ic2 * 1000)))
Gm_10000 = (1/10000) * (1./(1 + Ut./(Ic3 * 10000)))

plot(Ic(1,1:1001), Gm_100, '-', 'DisplayName','Theoretical, R = 100 Ohms')
plot(Ic(1,1:1001), Gm_1000, '-', 'DisplayName','Theoretical, R = 1000 Ohms')
plot(Ic(1,1:1001), Gm_10000, '-', 'DisplayName','Theoretical, R = 10000 Ohms')

legend
title('Incremental Transconductance vs. Ic')
ylabel('Incremental Transconductance (Mohs)')
xlabel('Ic (A)')


% STILL NEEDS THEORETICAL FITS



