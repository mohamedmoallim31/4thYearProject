%derivative of phi
function value = deriv_phi(r) 
    a = (1./r).^6;
    value = -12*((a.^2)./r)+12*(a./r);
end