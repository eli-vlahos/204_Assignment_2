function Y = Gaussian_Elimination(A,B)
    arguments
        %specifies the type of input
        A (:,:) {mustBeNumeric, mustBeFinite};
        B (1,:) {mustBeNumeric, mustBeFinite};
    end
%Matrix_Inversion:
%   This function is mean't to take a matrix A and a vector B and solve for
%   a vector x (form [A][X]=[B]. By taking the inverse of A and multiplying
%   it with B, the solutions for X are found.

    s = size(A)-1;
    s = s(1,1);
    
    for n = 1:s
        %switches largest row for current row
        %ignore M, just want size
        [M,I] = max(A(n:s,n));
        I = I-1+n;
        
        A([n,I],:) = A([I,n],:);
        B([n,I]) = B([I,n]);
        
        for w = n:s
            %eliminates each row below it
            operation = round(A(w+1,n)/A(n,n), 5, 'significant');

            A(w+1,:) = round(A(w+1,:)- A(n,:)*operation, 5, 'significant');
            B(w+1) = round(B(w+1)-B(n)*operation, 5, 'significant');
        end

    end
    
    %forward elimination is complete
    
    for n = 1:(s+1)
        %current row
        column = s+2-n;
        

        for i = (s+3-n):(s+1)
            %multiplies each value in A with appropriate x value
            A((column),i) = round(A((column),i)*B(i), 5, 'significant'); 
        end

        %takes the sum of numbers in a to the right of the diagonal, and
        %then divides B by the diagonal A
        summation_after = round(sum(A(column, column+1:s+1), 'all'), 5, 'significant');
        B(column) = round((B(column)-summation_after)/A(column,column), 5,'significant');
        
    end
    
    Y = B;

end

