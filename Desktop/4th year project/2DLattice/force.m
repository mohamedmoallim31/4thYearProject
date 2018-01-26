function force = force(ij, n, q, grad_u1, grad_u2)
    j = floor(ij/n);
    if (j - ij/n) == 0
        i = j;
        j = j - 1;
    else
        i = ij - j*n;
    end 
    
    force = 0;
    %middle 
    if (i > 1 && i < n) && (j > 0 && j < n - 1)
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n) - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = topleftContribution + topContribution + toprightContribution +...
        +  leftContribution + rightContribution + bottomleftContribution +...
        + bottomContribution + bottomRightContribution;
    %top left corner
    elseif i == 1 && j == 0
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n) - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = rightContribution + bottomContribution + bottomRightContribution;
    %top right corner
    elseif i == n && j == 0
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n) - q(:,i+j*n));
        
        force = leftContribution + bottomleftContribution + bottomContribution;
    %bottom left corner
    elseif i == 1 && j == n - 1
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        
        force = rightContribution + topContribution + toprightContribution;
    %bottom right corner
    elseif i == n && j == n - 1
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        
        force =  topContribution + leftContribution + topleftContribution;
    %top boundary 
    elseif j == 0 &&(i > 1 && i < n)
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomContribution      = -grad_u1( q(:,i+(j+1)*n) - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = leftContribution + rightContribution + bottomleftContribution + ...
            + bottomContribution + bottomRightContribution;
    %bottom boundary 
    elseif j == n - 1 &&(i > 1 && i < n)
        topleftContribution     = -grad_u2(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        
        force =  topleftContribution + topContribution + toprightContribution + ...
            + leftContribution + rightContribution;
    %left boundary 
    elseif i == 1 && (j > 0 && j < n - 1)
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        rightContribution       = -grad_u1(q(:,i+1+j*n) - q(:,i+j*n));
        toprightContribution    = -grad_u2(q(:,i+1+((j-1)*n)) - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = bottomleftContribution + topContribution + rightContribution + ...
            + toprightContribution + bottomRightContribution;
    %right boundary 
    elseif i == n  && (j > 0 && j < n - 1)
        topContribution         = -grad_u1(q(:,i+((j-1)*n)) - q(:,i+j*n));
        bottomContribution      = -grad_u1(q(:,i+(j+1)*n) - q(:,i+j*n));
        leftContribution        = -grad_u1(q(:,i-1+j*n) - q(:,i+j*n));
        bottomleftContribution  = -grad_u2(q(:,i-1+(j+1)*n) - q(:,i+j*n));
        bottomRightContribution = -grad_u2(q(:,i+1+(j+1)*n) - q(:,i+j*n));
        
        force = bottomContribution + bottomleftContribution + topContribution + leftContribution + ...
            + bottomRightContribution;
    end 
    
end

