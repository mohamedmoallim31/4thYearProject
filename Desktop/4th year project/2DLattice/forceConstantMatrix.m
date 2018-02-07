function [ forceConstant ] = forceConstantMatrix(n)
%FORCECONSTANTMA Summary of this function goes here
%   Detailed explanation goes here
    forceConstant = zeros(2*n^2);
    offDiag = -hessian_u1([1,0]);
    
    forceConstant(1:2,1:2) = forceConstantIJ(1, n);
    forceConstant(1:2,3:4) = offDiag;
    
    for k = 4:2:(2*n^2)-1
        forceConstant(k-1:k, k-3:k-2) = offDiag;
        forceConstant(k-1:k, k-1:k) = forceConstantIJ(k/2, n);
        forceConstant(k-1:k, k+1:k+2) = offDiag;
    end 
    n2 = n*n;
    forceConstant(2*n2-1:2*n2,2*n2-1:2*n2) = forceConstantIJ(n2, n);
    forceConstant(2*n2-1:2*n2,2*n2-3:2*n2-2) = offDiag;
    
end

