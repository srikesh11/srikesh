function V = d_profile(t1,t2,t3,t4,t5)
V = zeros((t1+t2+t3+t4+t5),1);
V(1:t1) = 0; %idle
V((t1+1):(t1+t2)) = linspace(0,60,abs(t2)); %acceleration
V((t1+t2+1):(t1+t2+t3)) = 60; %constant
V((t1+t2+t3+1):(t1+t2+t3+t4)) = linspace(60,0,abs(t4)); %deceleration
V((t1+t2+t3+t4+1):(t1+t2+t3+t4+t5)) = 0; %idle
end
