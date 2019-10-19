% T.F. = (w(s)/V(s)) = (1/Ke) / [(Tm*Tm s^2) + (Tm s) + 1]
% In this the damping force is coefficient is neglected

% R = 0.171; % Terminal Resistance phase to phase - ohm
% L = 0.56 * 10^(-3); % Terminal Inductance phase to phase - Henry
% Ke = 1.3; %0.0763 % Electrical Torque Constant, back emf constant - V-sec/rad
% Kt = 1.03; % Torque Constant - N-m/A
% J =  9.25 * 10^(-6); % Moment of Inertia - kg-m^2
% 
% Tm = (3*R*J)/(Ke*Kt); % Mechanical Time Constant
% 
% Te = (L/(3*R)); % Electrical Time Constant


[t,v,delta] = Read_Drive_Cycle();
% Fetching values of time, speed and steering angles

[N_3,l_pwm] = Left_Pwm(t,delta,v);
% Getting the RPM and corresponding PWM for left rear wheel

% open_loop_model
% % opening the model
% 
% sim('open_loop_model.slx')
% simulating the model