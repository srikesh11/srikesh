 		MODELLING OF ELECTRONIC DIFFERENTIAL

The electronic differential would be required to maintain 
necessary RPM of the rear wheels in different driving scenarios.
In this exercise the model for the rear left wheel is developed
and the performance against a model of the actual system is 
also presented using SIMULINK.

The following are the steps to run the set of code and the 
SIMULINK model - 

1. Call 'Read_Drive_Cycle()' as [t,v,delta] = Read_Drive_Cycle(); 
   Enter the name of the file (without extension, generally .csv);
   This will fetch the time (t), speed (v), and the steering angle
   (delta) to be used to find RPM of left rear wheel.

2. Call 'Left_Pwm()' as [N_3,l_pwm] = Left_Pwm(t,delta,v);
   This will provide us with the desired RPM and corresponding 
   PWM signal to be fetched to the rear left wheel motor.

3. Run the 'open_loop_model.slx' file for 't' seconds.
   This will plot the response of the system in terms of actual 
   RPM achieved along with the Desired RPM, Vehicle speed, and
   PWM signal provided.