% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% This function takes steering angle - 'delta' (deg) and speed of vehicle %
% 'V' (kmph) as inputs and provides the ideal PWM value for left motor    %                                                                         %
% Length of the car (~wheelbase) is taken as L = 2100 mm = 2.1 m          %
% Rear Track of the car is taken to be d_r = 715 mm = 0.715 m             %
% Radius of the tire is taken as r = (20/2) in = 0.254 m     %
% All values are according to the feasibility report for phase 1          %
%                                                                         %
% 1, 2, 3 and 4 represent left front wheel, right front wheel,            %
% left rear wheel, and the right rear wheel respectively.                 %
% All conventions to represent variables and formulae for calculation     %
% are adapted from ediff paper.                                           %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

function [N_3, l_pwm]  = Left_Pwm(t,delta,V)
    
    V = V*(5/18); % converting speed to m/s from kmph
    L = zeros(size(V));
    d_r = zeros(size(V));
    r = zeros(size(V));
    l_r = zeros(size(V));
    
    L(1:length(V)) = 2.1;
%     L=L';
    d_r(1:length(V)) = 0.75;
%     d_r=d_r';
    r(1:length(V)) = 0.254; %20 inches dia now %0.1524 earlier
%     r=r';
    l_r(1:length(V)) = L/2; % distance of rear wheel axis from C.G. of vehicle
%     l_r=l_r'
    % It is assumed that C.G. is at centre of a normal line joining 
    % front and rear wheel axes 
    
    R3 =  ((L./tand(delta)) - (d_r/2)); 
    % R3 is the distance of the left rear wheel from centre of rotation
    
    Rcg = sqrt(((R3+(d_r/2)).^2) + (l_r.^2));
    % Rcg is the distance of the C.G. from centre of rotation
    
    if (delta ~= 0)
        w_3 = (V.*R3)./(Rcg.*r); % angular velocity of the left rear wheel
    else
        w_3 = (V./r); % taking equal to maximum angular velocity
    end
    
    N3 = (w_3*60)/(2*pi);  % rpm of the left rear wheel 1 rpm = (2pi/60) rad/s
    N_3 = [t.' N3.'];
    l_pw = N3*(255/720); % Ideal PWM considering maximum RPM to be 720
    l_pwm = [t.' l_pw.'];
%     N_3 = [t,N3];
%     l_pwm = [t,l_pw];
    %left_pwm = (-0.000145856156227676*(N_3)^3) + (0.0773978753444711*(N_3)^2) - (8.30000114823278*N_3) + 322.304468538437;
    % Above relation is obtained after fitting a third order polynomial
    % using transfer characteristics between RPM and PWM
end
