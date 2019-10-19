R = 0.1472;
Kt = 0.9852;
Ke = 1.278;

V = 72; %Voltage
T = 0:100; %Braking Torque
I_max = 40;
I = 0;
P = 0;
In = zeros(1,length(T));
Vn = zeros(1,length(T));
Pn = zeros(1,length(T));
Nn = zeros(1,length(T));

for i=1:length(T)
    if(I>I_max) %limiting the voltage if exceeds I_max
        V = P/I; 
    end
    N = ((V/Ke) - (T(i)*R)/(Kt*Ke))*(30/pi);

    E = Ke*N*pi/30;
    I = (V-E)/R;
    
    if(I<I_max) %checking if current exceeds I_max
        P = V*I;
        In(i) = I;
    else
        In(i)=I_max;
    end
    
    Pn(i) = P;
    Nn(i) = N;
    Vn(i) = V;
end
plot(T,Nn);
ylabel('Speed')
xlabel('Torque')
title('TS Characteristics')