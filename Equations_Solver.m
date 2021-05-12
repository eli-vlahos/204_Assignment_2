function [S,CE,Counter] = Equations_Solver(E)
    arguments
        %specifies the type of input
        E (1,3);
    end
    syms x y z
    
    
   
    
    %creating a matrix of 1s to be used for solutions and last set of
    %solutions
    S = repmat([1],[1 3]);
    L = S;
    %taking size of matrix
    size = 3;
    
    %initializaing error matrix, error, bool to exit and counter
    CE = repmat([1],[1 3]);
    Percentage_Error = 0.001;
    bool = 1;
    Counter = 0;
    
    %taking jacobian of matrix
    J = jacobian(E,[x,y,z]);
    
    %while the bool is value continue loop
    while bool
        
        %substitute values into the matrix and vector to get numerical
        %matrix and vector
        A = double(subs(J, [x,y,z],S));
        B = double(subs(E,[x,y,z],S));
        
        %use gaussian elimination solver and find new S
        S = S - Gaussian_Elimination(A,B);
        
        %use a loop to check to see if errors are small enough
        for n = 1:size
            %if counter is 3, then there will be an exit
            temp_count = 0;
            
            CE(1,n) = abs((S(1,n)-L(1,n))/S(1,n));
            if CE(1,n) < Percentage_Error
                temp_count = temp_count +1;
                
                if temp_count == n
                    bool = 0;
                    
                end
            end
        end
        
        %update last value and add to counter
        L = S;
        Counter = Counter + 1;
        
    end
    
    
end
