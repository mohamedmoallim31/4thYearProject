function force = force(ij, n, q, grad_u1, grad_u2)
    j = ceil(ij/n)-1; % row index, starting from 0
    i = ij - j*n;
    
    force = 0;    
   
    %middle 
    if (i > 1 && i < n) && (j > 0 && j < n - 1)
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n)); 
        topContribution         = -grad_u1(q(:,i+((j-1)*n))   - q(:,i+j*n)); 
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n)       - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n)       - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n)   - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)     - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n)   - q(:,i+j*n));
        
        force = topleftContribution + topContribution + toprightContribution +...
        +  leftContribution + rightContribution + bottomleftContribution +...
        + bottomContribution + bottomRightContribution;
    %top left corner
    elseif i == 1 && j == 0
        rightContribution       = -grad_u1(q(:,i+1+j*n)     - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)   - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = rightContribution + bottomContribution + bottomRightContribution;
    %top right corner
    elseif i == n && j == 0
        leftContribution        = -grad_u1(q(:,i-1+j*n)     - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)   - q(:,i+j*n));
        
        force = leftContribution + bottomleftContribution + bottomContribution;
    %bottom left corner
    elseif i == 1 && j == n - 1
        rightContribution       = -grad_u1(q(:,i+1+j*n)       - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n))   - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        
        force = rightContribution + topContribution + toprightContribution;
    %bottom right corner
    elseif i == n && j == n - 1
        topContribution         = -grad_u1(q(:,i+((j-1)*n))   - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n)       - q(:,i+j*n));
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        
        force =  topContribution + leftContribution + topleftContribution;
    %top boundary 
    elseif j == 0 && (i > 1 && i < n)
        leftContribution        = -grad_u1(q(:,i-1+j*n)     - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n)     - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)   - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = leftContribution + rightContribution + bottomleftContribution + ...
            + bottomContribution + bottomRightContribution;
    %bottom boundary 
    elseif j == n - 1 && (i > 1 && i < n)
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n))   - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n)       - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n)       - q(:,i+j*n));
        
        force =  topleftContribution + topContribution + toprightContribution + ...
            + leftContribution + rightContribution;
    %left boundary 
    elseif i == 1 && (j > 0 && j < n - 1)
        topContribution         = -grad_u1(q(:,i+((j-1)*n))   - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n)       - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n)   - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)     - q(:,i+j*n));
        
        force = topContribution + rightContribution + ...
            + toprightContribution + bottomRightContribution + ...
            bottomContribution;
    %right boundary 
    elseif i == n  && (j > 0 && j < n - 1)
        topContribution         = -grad_u1(q(:,i+(j-1)*n)   - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n)   - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n)     - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        topleftContribution     = -grad_u2(q(:,i-1+(j-1)*n) - q(:,i+j*n));
        
        force = bottomContribution + bottomleftContribution + topContribution + leftContribution + ...
            + topleftContribution;
    end 
    
    force = -force;
    
end

