function force = force(ij, n, q, deriv_u1, deriv_u2)
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
        vec = q(:,i-1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(q(:,i-1+((j-1)*n)) - q(:,i+j*n));
        topleftContribution     = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(q(:,i+((j-1)*n)) - q(:,i+j*n));
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        toprightContribution    = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        rightContribution       = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomleftContribution  = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomContribution      = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomRightContribution = (vec/normv)*deriv_u2(normv);
        
        force = topleftContribution + topContribution + toprightContribution +...
        +  leftContribution + rightContribution + bottomleftContribution +...
        + bottomContribution + bottomRightContribution;
    %top left corner
    elseif i == 1 && j == 0
        vec = q(:,i+1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        rightContribution       = (vec/normv)*deriv_u1(normv);

        vec = q(:,i+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomContribution      = (vec/normv)*deriv_u1(normv);
        
        
        vec = q(:,i+1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomRightContribution = (vec/normv)*deriv_u2(normv);
        
        force = rightContribution + bottomContribution + bottomRightContribution;
    %top right corner
    elseif i == n && j == 0
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomleftContribution  = deriv_u2(normv);
        
        vec = q(:,i+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomContribution      = (vec/normv)*deriv_u1(normv);
        force = leftContribution + bottomleftContribution + bottomContribution;
    %bottom left corner
    elseif i == 1 && j == n - 1
        
        vec = q(:,i+1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        rightContribution       = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        toprightContribution    = (vec/normv)*deriv_u2(normv);
        force = rightContribution + topContribution + toprightContribution;
    %bottom right corner
    elseif i == n && j == n - 1
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topleftContribution     = (vec/normv)*deriv_u2(normv);
        force =  topContribution + leftContribution + topleftContribution;
    %top boundary 
    elseif j == 0 &&(i > 1 && i < n)
        
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        rightContribution       = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomleftContribution  = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomContribution      = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomRightContribution = (vec/normv)*deriv_u2(normv);
        force = leftContribution + rightContribution + bottomleftContribution + ...
            + bottomContribution + bottomRightContribution;
    %bottom boundary 
    elseif j == n - 1 &&(i > 1 && i < n)
        vec = q(:,i-1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topleftContribution     = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        
        vec = q(:,i+1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        toprightContribution    = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv)*deriv_u1(normv);
        rightContribution       = deriv_u1(norm(q(:,i+1+j*n) - q(:,i+j*n)));
        force =  topleftContribution + topContribution + toprightContribution + ...
            + leftContribution + rightContribution;
    %left boundary 
    elseif i == 1 && (j > 0 && j < n - 1)
        vec = q(:,i-1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomleftContribution  = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        rightContribution       = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+1+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        toprightContribution    = (vec/normv)*deriv_u2(normv);
        
        vec = q(:,i+1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomRightContribution = (vec/normv)*deriv_u2(normv);
        force = bottomleftContribution + topContribution + rightContribution + ...
            + toprightContribution + bottomRightContribution;
    %right boundary 
    elseif i == n  && (j > 0 && j < n - 1)
        vec = q(:,i+((j-1)*n)) - q(:,i+j*n);
        normv = norm(vec);
        topContribution         = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomContribution      = (vec/normv)*deriv_u1(normv);
        
        vec = q(:,i-1+j*n) - q(:,i+j*n);
        normv = norm(vec);
        leftContribution        = (vec/normv) * deriv_u1(norm());
        
        vec = q(:,i-1+(j+1)*n) - q(:,i+j*n);
        normv = norm(vec);
        bottomleftContribution  = (vec/normv)*deriv_u2(normv);
        bottomRightContribution = deriv_u2(norm(q(:,i+1+(j+1)*n) - q(:,i+j*n)));
        force = bottomContribution + bottomleftContribution + topContribution + leftContribution + ...
            + bottomRightContribution;
    end 
    
end

