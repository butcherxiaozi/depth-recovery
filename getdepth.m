function [u3] = getdepth(u1,u2,sigma1,sigma2,sigma3,f0)

s=(sigma1/sigma2-1)/((sigma1/sigma2-1)/f0+1/u1-sigma1/sigma2/u2);

u3=1/((sigma3/sigma1-1)/s+sigma3/sigma1/u1-(sigma3/sigma1-1)/f0);

end