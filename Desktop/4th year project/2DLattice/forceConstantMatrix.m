function [ forceConstant ] = forceConstantMatrix(n)
%FORCECONSTANTMA Summary of this function goes here
%   Detailed explanation goes here
    forceConstant = zeros(2*n^2);
    offDiag1  = -hessian_u1([1,0]);
    offDiag_1 = -hessian_u1([-1,0]);
    n2 = n*n;
    
    stripAboveDiag1 = -hessian_u1([0, 1]);
    stripAboveDiag2 = -hessian_u2([1, 1]);
    stripAboveDiag3 = -hessian_u2([-1,1]);
    
    stripBelowDiag1 = -hessian_u1([0 ,-1]);
    stripBelowDiag2 = -hessian_u2([1 ,-1]);
    stripBelowDiag3 = -hessian_u2([-1,-1]);
    
 % Construct the parts of the Hessian corresponding to Left-right
 % interactions
    for k = 2:2:(2*n2)
        [i,j] = getIJ(k/2,n);
        if i==1 
            forceConstant(k-1:k,k-1:k) = forceConstantIJ(k/2, n);
            forceConstant(k-1:k,k+1:k+2) = offDiag1;  
        elseif i==n
            forceConstant(k-1:k, k-1:k) = forceConstantIJ(k/2, n);
            forceConstant(k-1:k, k-3:k-2) = offDiag_1;
        else
            forceConstant(k-1:k, k-3:k-2) = offDiag_1;
            forceConstant(k-1:k, k-1:k) = forceConstantIJ(k/2, n);
            forceConstant(k-1:k, k+1:k+2) = offDiag1;
        end
    end 
    
    % Construct the parts of the Hessian corresponding to down, down+left,
    % down+right interactions
    for k = 2:2:(2*n2)-2*n
        [i,j] = getIJ(k/2,n);
        if i==1
            forceConstant(k-1:k, k-1+2*n:k+2*n) = stripAboveDiag1;   % D
            forceConstant(k-1:k, k+1+2*n:k+2+2*n) = stripAboveDiag3; % DR
        elseif i==n
            forceConstant(k-1:k, k-1+2*n:k+2*n) = stripAboveDiag1;   % D
            forceConstant(k-1:k, k-3+2*n:k-2+2*n) = stripAboveDiag2; % DL
        else
            forceConstant(k-1:k, k-3+2*n:k-2+2*n) = stripAboveDiag2; % DL
            forceConstant(k-1:k, k-1+2*n:k+2*n) = stripAboveDiag1;   % D
            forceConstant(k-1:k, k+1+2*n:k+2+2*n) = stripAboveDiag3; % DR
        end
    end 
    
    % Construct the parts of the Hessian corresponding to up, up+left,
    % up+right interactions
    for k = 2+2*n:2:(2*n2)
        [i,j] = getIJ(k/2,n);
        if i==1
            forceConstant(k-1:k,k-1-2*n:k-2*n) = stripBelowDiag1;    % U
            forceConstant(k-1:k,k+1-2*n:k+2-2*n) = stripBelowDiag3;  % UR
        elseif i==n
            forceConstant(k-1:k, k-1-2*n:k-2*n) = stripBelowDiag1;   % U
            forceConstant(k-1:k, k-3-2*n:k-2-2*n) = stripBelowDiag2; % UL
        else
            forceConstant(k-1:k, k-3-2*n:k-2-2*n) = stripBelowDiag2; % UL
            forceConstant(k-1:k, k-1-2*n:k-2*n) = stripBelowDiag1;   % U
            forceConstant(k-1:k, k+1-2*n:k+2-2*n) = stripBelowDiag3; % UR
        end
    end 


end

