function [N_3, l_pwm, N_4, r_pwm]  = mdiff(n_left,n_right)
    
    T_pinion = 16;
    T_ring = 48;
    T_right = 20;
    T_left = 20;
    T_bevel = 14;
    
    a1 = T_ring/T_pinion; %also known as axle ratio
    a2 = T_right/(2*T_bevel);
    
    n_bevel = (n_left - n_right).*a2;
    n_ring = (n_left + n_right)./2;
    
    V = V*(5/18); % converting speed to m/s from kmph
    L = zeros(size(V));
    d_r = zeros(size(V));
    r = zeros(size(V));
    l_r = zeros(size(V));
    
    L(1:length(V)) = 2.1;
    d_r(1:length(V)) = 0.75;
    r(1:length(V)) = 0.254; %20 inches dia now %0.1524 earlier
    l_r(1:length(V)) = L/2; % distance of rear wheel axis from C.G. of vehicle
    % It is assumed that C.G. is at centre of a normal line joining 
    % front and rear wheel axes 
    
    R3 =  ((L./tand(delta)) - (d_r/2)); 
    % R3 is the distance of the left rear wheel from centre of rotation for
    % left turn for positive delta
    
    R4 =  ((L./tand(delta)) + (d_r/2)); 
    % R3 is the distance of the left rear wheel from centre of rotation for
    % left turn
    
    Rcg = sqrt(((R3+(d_r/2)).^2) + (l_r.^2));
    % Rcg is the distance of the C.G. from centre of rotation
    
    if (delta ~= 0)
        w_3 = (V.*R3)./(Rcg.*r); % angular velocity of the left rear wheel
        w_4 = (V.*R4)./(Rcg.*r); % angular velocity of the right rear wheel
    else
        w_3 = (V./r); % taking equal to maximum angular velocity
        w_4 = (V./r); % taking equal to maximum angular velocity
    end
    
    N_3 = (w_3*60)/(2*pi);  % rpm of the left rear wheel 1 rpm = (2pi/60) rad/s
    N_4 = (w_4*60)/(2*pi);  % rpm of the right rear wheel 1 rpm = (2pi/60) rad/s
    
    l_pwm = N_3*(255/720); % Ideal PWM considering maximum RPM to be 720
    r_pwm = N_4*(255/720); % Ideal PWM considering maximum RPM to be 720
    
%     l_pwm = [t.' l_pw.'];
%     N_3 = [t,N3];
%     l_pwm = [t,l_pw];
    %left_pwm = (-0.000145856156227676*(N_3)^3) + (0.0773978753444711*(N_3)^2) - (8.30000114823278*N_3) + 322.304468538437;
    % Above relation is obtained after fitting a third order polynomial
    % using transfer characteristics between RPM and PWM
end
