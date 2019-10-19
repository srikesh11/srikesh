R = 0.1472;
Kt = 0.9852;
Ke = 1.278;

V = 72; %Voltage
T = 70; %Braking Torque
I_max = 40;
I = 0;
P = 0;
In = zeros(1,length(T));
Vn = zeros(1,length(T));
Pn = zeros(1,length(T));
Nn = zeros(1,length(T));
t = 0:0.1:length(T);

% E = Ke*w;
% I = (V-E)/R;
% dwdt = (Kt*I - T - b*w)/J;

[t,w] = ode45(@(t,w) dcmot(t,w,Kt,Ke,b,J,V,R,T), [0:0.5:10], [623 0]);
   
    
    if(I<I_max) %checking if current exceeds I_max
        P = V*I;
        In(i) = I;
    else
        In(i)=I_max;
    end
    
   
plot(T,Nn);
ylabel('Speed')
xlabel('Torque')
title('TS Characteristics')
