function force = force(ij, n, q, deriv_u1, deriv_u2)
    i = mod(ij, n) + 1;
    j = (ij - i)/n;
    
    %middle 
    if (i > 1 && i < n) && (j > 1 && j < n)
        topleftContribution     = deriv_u2(q(i-1+((j-1)*n)) - q(i+j*n));
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        toprightContribution    = deriv_u2(q(i+1+((j-1)*n)) - q(i+j*n));
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        bottomleftContribution  = deriv_u2(q(i-1+(j+1)*n) - q(i+j*n));
        bottomContribution      = deriv_u1(q(i+(j+1)*n) - q(i+j*n));
        bottomRightContribution = deriv_u2(q(i+1+(j+1)*n) - q(i+j*n));
        force = topleftContribution + topContribution + toprightContribution +...
        +  leftContribution + rightContribution + bottomleftContribution +...
        + bottomContribution + bottomRightContribution;
    %top left corner
    elseif i == 1 && j == 1
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        bottomContribution      = deriv_u1(q(i+(j+1)*n) - q(i+j*n));
        bottomRightContribution = deriv_u2(q(i+1+(j+1)*n) - q(i+j*n));
        force = rightContribution + bottomContribution + bottomRightContribution;
    %top right corner
    elseif i == n && j == 1
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        bottomleftContribution  = deriv_u2(q(i-1+(j+1)*n) - q(i+j*n));
        bottomContribution      = deriv_u1(q(i+(j+1)*n) - q(i+j*n));
        force = leftContribution + bottomleftContribution + bottomContribution;
    %bottom left corner
    elseif i == 1 && j == n
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        toprightContribution    = deriv_u2(q(i+1+((j-1)*n)) - q(i+j*n));
        force = rightContribution + topContribution + toprightContribution;
    %bottom right corner
    elseif i == n && j == n
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        topleftContribution     = deriv_u2(q(i-1+((j-1)*n)) - q(i+j*n));
        force =  topContribution + leftContribution + topleftContribution;
    %top boundary 
    elseif j == 1 &&(i > 1 && i < n)
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        bottomleftContribution  = deriv_u2(q(i-1+(j+1)*n) - q(i+j*n));
        bottomContribution      = deriv_u1(q(i+(j+1)*n) - q(i+j*n));
        bottomRightContribution = deriv_u2(q(i+1+(j+1)*n) - q(i+j*n));
        force = leftContribution + rightContribution + bottomleftContribution + ...
            + bottomContribution + bottomRightContribution;
    %bottom boundary 
    elseif j == n &&(i > 1 && i < n)
        topleftContribution     = deriv_u2(q(i-1+((j-1)*n)) - q(i+j*n));
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        toprightContribution    = deriv_u2(q(i+1+((j-1)*n)) - q(i+j*n));
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        force =  topleftContribution + topContribution + toprightContribution + ...
            + leftContribution + rightContribution;
    %left boundary 
    elseif i == 1 &&(j > 1 && j < n)
        bottomleftContribution  = deriv_u2(q(i-1+(j+1)*n) - q(i+j*n));
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        rightContribution       = deriv_u1(q(i+1+j*n) - q(i+j*n));
        toprightContribution    = deriv_u2(q(i+1+((j-1)*n)) - q(i+j*n));
        bottomRightContribution = deriv_u2(q(i+1+(j+1)*n) - q(i+j*n));
        force = bottomleftContribution + topContribution + rightContribution + ...
            + toprightContribution + bottomRightContribution;
    %right boundary 
    elseif i == n &&(j > 1 && j < n)
        topContribution         = deriv_u1(q(i+((j-1)*n)) - q(i+j*n));
        bottomContribution      = deriv_u1(q(i+(j+1)*n) - q(i+j*n));
        leftContribution        = deriv_u1(q(i-1+j*n) - q(i+j*n));
        bottomleftContribution  = deriv_u2(q(i-1+(j+1)*n) - q(i+j*n));
        bottomRightContribution = deriv_u2(q(i+1+(j+1)*n) - q(i+j*n));
        force = bottomContribution + bottomleftContribution + topContribution + leftContribution + ...
            + bottomRightContribution;
    end 
    
end

