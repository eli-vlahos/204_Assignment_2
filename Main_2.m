syms x y z

%hardcoded input
% E =  ["x^3-10*x+y-z+3";
%     "y^3+10*y-2*x-2*z-5";
%     "x+y-10*z+2*sin(z)+5"];

E = ["3+2/r^2-1/8*(3-2v)/(1-v)*r^2*w^2";
"6v-1/2*v/(1-v)*r^2*w^2";
"3-2/r^2-1/8(1+2v)/(1-v)*w^2*r^2"]



E = str2sym(E);
jacobian(E)

[E, CE, Counter] = Equations_Solver(E);
