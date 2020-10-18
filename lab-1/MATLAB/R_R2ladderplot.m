clear all
loadspice('R_R2ladder.txt')
position = [1,2,3,4];
p1 = polyfit(vin, V1,1);
V1fit = polyval(p1,vin);
p2 = polyfit(vin, V2,1);
V2fit = polyval(p2,vin);
p3 = polyfit(vin, V3,1);
V3fit = polyval(p3,vin);
p4 = polyfit(vin, V4,1);
V4fit = polyval(p4,vin);
% hold on
% plot(vin, V1,'*', vin, V2,'*', vin, V3,'*', vin, V4, '*')
% plot(vin,V1fit,vin,V2fit,vin,V3fit,vin,V4fit,'-k')
I_measured = zeros(4,3);
I_measured(1,:) = V1
I_measured(2,:) = V2
I_measured(3,:) = V3
I_measured(4,:) = V4
I_theory = zeros(4,3);
for j = 1:3
    for i = 1:4 
    Iout = vin(j)/(10000* 2^(i+1));
    I_theory(i,j) = Iout ;
    end
end
hold on 
set(gca,'yscale','log')
semilogy(position, I_measured(:,1),'*b')
semilogy(position, I_theory(:,1))
semilogy(position, I_measured(:,2),'*k')
semilogy(position, I_theory(:,2),'MarkerFaceColor','#0072BD')
semilogy(position, I_measured(:,3),'*r')
semilogy(position, I_theory(:,3),'MarkerFaceColor','#A2142F')

xlabel("Branch position (1-4)")
ylabel("Iout (A), log base-10")
legend('Vin = 0.5V Iout Measured', 'Vin = 0.5V Iout Theoretical','Vin = 2.5V Iout Measured', 'Vin = 2.5V Iout Theoretical','Vin = 4.5V Iout Measured', 'Vin = 4.5V Iout Theoretical', 'Location', 'northeast')
title('R-2R Current Divider, Branch Position vs Iout, Iin Sweep');
