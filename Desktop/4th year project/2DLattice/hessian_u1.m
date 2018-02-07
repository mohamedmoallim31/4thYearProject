function [ hessianu1 ] = hessian_u1(x)
%HESSIAN_U1 Summary of this function goes here
%   Detailed explanation goes here
    hessianu1 = zeros(2);
    hessianu1(1,1) = 2*(1-(x(2)^2/norm(x)^3));
    hessianu1(2,2) = 2*(1-(x(1)^2/norm(x)^3));
    hessianu1(1,2) = 2*(x(1)*x(2))/norm(x)^3;
    hessianu1(2,1) = 2*(x(1)*x(2))/norm(x)^3;    
end

