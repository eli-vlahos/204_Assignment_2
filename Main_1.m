%single resistance value
R = input("please enter resistance value \n");

%takes in the resistance value, returns temperature, error and counter
%first checks to see if appropriate value for R (must be above R_min and
%smaller than R_max. If it is larger than this value, then there are no roots
%R_max = 100*(1+(3.9083e-3)*800+(-5.775e-7)*800*800)=390.481125, just use
%390
%R_max = 100*(1+(3.9083e-3)*(-200)+(-5.775e-7)*(-200)(-200))=19.524, just use
%20

 if R < 20
     disp("Negative resistance not accepted")
 elseif R > 390
     disp("Resistance is too large, no solution")
 else
     [t, e, c] = Bisection_Method(R);
     [t_, e_, c_] = NR_Method(R)
 end