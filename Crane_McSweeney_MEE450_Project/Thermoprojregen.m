function [WorkNet,HeatIn,ThermEff] = Thermoprojregen()
%THERMOPROJ Solves for Net Work, Heat Input, and Thermal Efficiency
nt = 0.86;
nc = 0.78;
nreg = linspace(0.6,1,500);
T6=1200;
T7s=838.9;
T3 = 300;
T4s=429.11;
T8 = 1200;
T7 = T6 + (nt*(T7s-T6));
T4 = T3+((T4s-T3)/nc);
T5 = T4 + nreg.*(T7-T4);


WorkNet = abs(2*nt*519.02 - 2*(129.76/nc));
HeatIn = abs(1.005*((T5-T6)+(T7-T8)));
ThermEff = 100.*(WorkNet./HeatIn);

yyaxis left
title('Net Work/Heat Supplied/Thermal Efficiency vs. Regenerator Efficiency')
xlabel('Regenerator Efficency (0 to 1)')
hold on
ylabel('Work/Heat (kJ/kg)')
plot (nreg,WorkNet,'DisplayName','Work')
plot (nreg,HeatIn,'DisplayName','Heat')
yyaxis right
ylabel('Overall Thermal Efficiency (%)')
plot (nreg,ThermEff,'DisplayName','Efficiency')
legend('Work','Heat','Efficiency')
end

