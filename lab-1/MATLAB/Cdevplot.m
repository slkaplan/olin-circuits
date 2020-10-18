loadspice('Cdev_mc.txt')
[first, last, m, b, n] = linefit(iin, A1, 5e-4);

plot(iin, A1, '*', iin, iin*m + b,'-k')
axis([ 0 5.5e-3 0 3.5e-3]);

xlabel("Iin (A)")
ylabel("Iout (A)")
legend('Iout Measured', 'Iout Best Fit', 'Location', 'southeast')
title('Resistive Current Divider, Iin vs Iout, Iin Sweep');
