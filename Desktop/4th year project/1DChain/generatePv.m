function Pv = generatePv(B)
    Pv = (transpose(B)/(B*transpose(B)))*B;
end

