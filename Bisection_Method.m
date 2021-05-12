function [t, e, c] = Bisection_Method(R)
    arguments
        %specifies the type of input
        R double;
    end
    
    %percentage error, current and boundary
    %counter starts at 1 because the program iterates once before the loop
    Percentage_Error = 0.0005;
    Current_Percentage_Error = 1;
    Counter = 0;
  
    %upper and lower bound for the temperatures
    Upper_Bound = 850;
    Lower_Bound = -200;
    
    %boolean value to evaluate whether or not to exit
    bool = 0;
    
    %values to be used for the first iteration
    Average_Value = (Upper_Bound-Lower_Bound)/2;
    Previous_Value = Average_Value;

    %constants to be used for the expression
    R_0 = 100;
    A = 3.9083e-3;
    B = -5.775e-7;
    C = -4.183e-12;

    % to loop while error is not sufficient
    while Current_Percentage_Error >= Percentage_Error 
        
        %checks to see which function it should use then evalutes value
        if Lower_Bound < 0
            f_l = R_0*(1+A*Lower_Bound+B*Lower_Bound^2+C*(Lower_Bound-100)*Lower_Bound^3)-R;
        else
            f_l = R_0*(1+A*Lower_Bound+B*Lower_Bound^2)-R;
        end
        
        %checks to see what function it should use then evalutes value
        if Average_Value < 0
            f_m = R_0*(1+A*Average_Value+B*Average_Value^2+C*(Average_Value-100)*Average_Value^3)-R;  
        elseif Average_Value >= 0
            f_m = R_0*(1+A*Average_Value+B*Average_Value^2)-R;
        end

        
        %checks to see if the multiple of the two is positive or negative
        if f_l*f_m < 0
            Upper_Bound = Average_Value;
        elseif f_l*f_m > 0
            Lower_Bound = Average_Value;
        else
            Current_Percentage_Error = 0.0;
            break;
        end
        
        %updates average, previous, counter and error
        Average_Value = (Upper_Bound + Lower_Bound)/2;
        Current_Percentage_Error = abs((Average_Value-Previous_Value)/Average_Value);
        Previous_Value = Average_Value;  
        Counter = Counter+1;
        
    end
    
    %returns values
    t = Average_Value;
    e = Current_Percentage_Error;
    c = Counter;
    
    
    
end
