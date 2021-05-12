function [t, e, c] = NR_Method(R)
    arguments
        %specifies the type of input
        R double;
    end
    
    %percentage error, current and boundary
    %counter starts at 1 because the program iterates once before the loop
    Percentage_Error = 0.0005;
    Current_Percentage_Error = 1;
    Counter = 0;
  
    %value to be used for the first iteration
    Guess = 300;
    Average_Value = Guess;
    Previous_Value = Average_Value;

    %constants to be used for the expression
    R_0 = 100;
    A = 3.9083e-3;
    B = -5.775e-7;
    C = -4.183e-12;
    
    
    % to loop while error is not sufficient
    while Current_Percentage_Error >= Percentage_Error
        
        %checks to see which function to use
        %then evaluates function and its respective derivative

        if Average_Value < 0
            f_x = R_0*(1+A*Average_Value+B*Average_Value^2+C*(Average_Value-100)*Average_Value^3)-R;
            f_d = R_0*(A+2*B*Average_Value+C*Average_Value^3+3*C*(Average_Value-100)*Average_Value^2);  
        elseif Average_Value >= 0
            f_x = R_0*(1+A*Average_Value+B*Average_Value^2)-R;
            f_d = R_0*(A+2*B*Average_Value);
        end
        
        %updates average, previous, counter and error
        Average_Value = Previous_Value - (f_x/f_d);
        Current_Percentage_Error = abs((Average_Value-Previous_Value)/Average_Value);
        Previous_Value = Average_Value;  
        Counter = Counter +1;
        
    end
    
    %returns value
    t = Average_Value;
    e = Current_Percentage_Error;
    c = Counter;
    
    
    
end

