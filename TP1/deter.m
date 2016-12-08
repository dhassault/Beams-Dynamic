function [ det ] = deter( KL,mu)
%certaines choses ne fonctionnent pas avec ma eq2...
det= tan(KL)-2*mu*KL./(KL.^2-mu^2);
end

