function [sols] = eq2(KL, mu)
%solutions de l equation en frequence
sols = tan(KL)-2*mu*KL./(KL.^2-mu^2);
end

