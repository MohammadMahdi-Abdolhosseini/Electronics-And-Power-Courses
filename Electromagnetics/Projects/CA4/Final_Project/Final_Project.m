clc; clear;
syms t
syms Vs(t) i(t) omega_R(t) theta_R(t)
Vmax = 40;
Imax = 5;
Kb = 0.07;
KT = 0.07;
J = 6*10^(-5);
R = 2;
L = 2*10^(-3);
f = 0.0004;
tau_L = 0;   % Load Torque = 0 , 0.1 , 0.2 , 0.3
Vs(t) = 10*heaviside(t);
ode1 = L*diff(i(t)) == -R*i(t) - Kb*omega_R(t) + Vs(t); % 0.002*d(I)/dt = -2*I(t) - 0.07*w(t) + 10*heaviside(t)
ode2 = J*diff(omega_R(t)) == KT*i(t) - f*omega_R(t) - tau_L;% 6*10^(-5)*d(w)/dt = 0.07*I(t) - 0.0004*w(t) - tau_L
ode3 = diff(theta_R(t)) == omega_R(t); % d(theta)/dt = w(t)
odes = [ode1; ode2; ode3];
cond1 = i(0) == 0;
cond2 = omega_R(0) == 0;
cond3 = theta_R(0) == 0;
conds = [cond1; cond2; cond3];
[iSol(t), omega_RSol(t), theta_RSol(t)] = dsolve(odes, conds);

figure
subplot(2,2,1)
fplot(Vs(t))
set(gca,'xtick', 0 : 0.2 : 1, 'xlim', [0,1])
set(gca,'ytick', 0 : 2 : 15, 'ylim', [0,15])
legend('V_{s}(t)')
grid on
subplot(2,2,2)
fplot(iSol(t),'r')
set(gca,'xtick', 0 : 0.2 : 1, 'xlim', [0,1])
set(gca,'ytick', 0 : 1 : 6, 'ylim', [-0.5,5])
legend('i(t)')
grid on
subplot(2,2,3)
fplot(omega_RSol(t),'r')
set(gca,'xtick', 0 : 0.2 : 1, 'xlim', [0,1])
set(gca,'ytick', 0 : 20 : 170, 'ylim', [-10,170])
legend('\omega_{R}(t)')
grid on
subplot(2,2,4)
fplot(theta_RSol(t),'r')
set(gca,'xtick', 0 : 0.2 : 1, 'xlim', [0,1])
set(gca,'ytick', 0 : 20 : 130, 'ylim', [-10,130])
legend('\theta_{R}(t)')
grid on