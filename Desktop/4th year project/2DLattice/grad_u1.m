function grad = grad_u1(x)
    vec = zeros(2,1);
    vec(1) = (x(1) - (x(1)/sqrt(x(1)^2 + x(2)^2)));
    vec(2) = (x(2) - (x(2)/sqrt(x(1)^2 + x(2)^2)));
    grad = 2*vec;
end

