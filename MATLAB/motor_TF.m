% T.F. = (w(s)/V(s)) = (1/Ke) / [(Tm*Tm s^2) + (Tm s) + 1]
% In this the damping force is coefficient is neglected

R = 1.2; % Terminal Resistance phase to phase - ohm
L = 0.56 * 10^(-3); % Terminal Inductance phase to phase - Henry
Ke = 0.9549; %0.0763 % Electrical Torque Constant, back emf constant - V-sec/rad
Kt = 25.5 * 10^(-3); % Torque Constant - N-m/A
J =  9.25 * 10^(-6); % Moment of Inertia - kg-m^2

Tm = (3*R*J)/(Ke*Kt); % Mechanical Time Constant

Te = (L/(3*R)); % Electrical Time Constant



% T.F. = (w(s)/V(s)) = K / [(Js+b)(Ls+R) +K^2]
% This takes every parameter into account

% J = 0.00000925;
% b = 0;
% K = 0.9549;%0.01;
% R = 1.2;
% L = 0.56 * 10^(-3);
% % 
