function [res] = diagderivative(I)
% Compute the spatial derivative at each location 
Iy        = circshift(I,1,2);
Imy       = circshift(I,-1,2);
Ix        = circshift(I,1,1);
Imx       = circshift(I,-1,1);
res       = cat(3,I-Iy,I-Imy,I-Ix,I-Imx);
res       = abs(res);