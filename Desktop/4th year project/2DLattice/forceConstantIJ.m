function [hessianAtK] = forceConstantIJ(ij, n)
%FORCECONSTANTIJ Summary of this function goes here
%   Detailed explanation goes here
    [i,j] = getIJ(ij,n);   
    hessianAtK = 0;    
    H_TL = hessian_u2([-1,1]);
    H_T  = hessian_u1([0, 1]);
    H_TR = hessian_u2([1, 1]);
    H_L  = hessian_u1([-1,0]);
    H_R  = hessian_u1([1 ,0]);
    H_BL = hessian_u2([-1,-1]);
    H_B  = hessian_u1([0, -1]);
    H_BR = hessian_u2([1,-1]);
   
    %middle 
    if (i > 1 && i < n) && (j > 0 && j < n - 1)       
        hessianAtK = H_TL + H_T+ H_TR + H_L+ H_R + H_BL + H_B + H_BR;
    %top left corner
    elseif i == 1 && j == 0
        hessianAtK = H_R+ H_B + H_BR;
    %top right corner
    elseif i == n && j == 0
        hessianAtK = H_L+ H_BL+ H_B;
    %bottom left corner
    elseif i == 1 && j == n - 1
        hessianAtK = H_R+ H_T+ H_TR;
    %bottom right corner
    elseif i == n && j == n - 1
        hessianAtK =  H_T+ H_L+ H_TL;
    %top boundary 
    elseif j == 0 &&(i > 1 && i < n)
        hessianAtK = H_L + H_R + H_BL + H_B + H_BR;
    %bottom boundary 
    elseif j == n - 1 &&(i > 1 && i < n)
        hessianAtK =  H_TL + H_T + H_TR + H_L+ H_R;
    %left boundary 
    elseif i == 1 && (j > 0 && j < n - 1)
        hessianAtK = H_R + H_BR + H_TR + H_T+ H_B;
    %right boundary 
    elseif i == n  && (j > 0 && j < n - 1)
        hessianAtK = H_B + H_BL + H_L + H_TL + H_T;
    end 
    
end

