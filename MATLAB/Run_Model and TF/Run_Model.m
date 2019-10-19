[t,v,delta] = Read_Drive_Cycle();
% Fetching values of time, speed and steering angles

[N_3,l_pwm] = Left_Pwm(t,delta,v);
% Getting the RPM and corresponding PWM for left rear wheel

open_loop_model % open_loop_model_second % 
% opening the model

sim('open_loop_model.slx')
% simulating the model