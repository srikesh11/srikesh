function [timestamp,V,delta] = Read_Drive_Cycle()
    
    file_name = input('Enter the file name ', 's'); 
    % taking the filename as user input
    
    % data = csvread(strcat(file_name,'.csv')); % only works for data
    % without string headers
    % data has four columns corresponding to timestamp, PWM, Motor RPM
    % of 3 KW and Motor RPM of 2KW motors respectively
    
    data = readtable(strcat(file_name,'.csv'));
    data = data{:,:}; % converting table to matrix
    
    timestamp = data(:,1);
    delta = data(:,2); 
    V = data(:,3);
%     save('drive_cycle.mat')
end
