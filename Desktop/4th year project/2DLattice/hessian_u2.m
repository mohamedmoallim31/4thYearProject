function [ hessianu2 ] = hessian_u2(x)
%HESSIAN_U2 Summary of this function goes here
%   Detailed explanation goes here
    hessianu2 = zeros(2);
    hessianu2(1,1) = 2*0.7*(1-((sqrt(2)*x(2)^2)/norm(x)^3));
    hessianu2(2,2) = 2*0.7*(1-((sqrt(2)*x(1)^2)/norm(x)^3));
    hessianu2(1,2) = 2*0.7*sqrt(2)*(x(1)*x(2))/norm(x)^3;
    hessianu2(2,1) = 2*0.7*sqrt(2)*(x(1)*x(2))/norm(x)^3;    
end

