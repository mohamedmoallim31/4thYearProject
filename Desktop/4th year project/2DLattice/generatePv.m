function [ Pv ] = generatePv(B)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    Pv = (transpose(B)/(B*transpose(B)))*B;
end

