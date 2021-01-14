function[psiuwT]=TemporalPhaseUnwrap(psi)
% Temporal phase unwrapping
% Windischberger C, Robinson S, Rauscher A, Barth M, Moser E. Robust field 
% map generation using a triple?echo acquisition. Journal of Magnetic 
% Resonance Imaging:2004;20(4):730-4
psiuwT  = zeros(size(psi));
for m=1:size(psi,1)
    for n=1:size(psi,2)
        xw = squeeze(psi(m,n,:));
        xu =OneDimUnwrapping(xw);
        psiuwT(m,n,:)=xu;
    end
end
   
   
% --------------------------- Calling Function ----------------------------   
function[xu]=OneDimUnwrapping(xw)

xu = xw;
for i=2:length(xw)
    difference = xw(i)-xw(i-1);
    if difference > pi
        xu(i:end) = xu(i:end) - 2*pi;
    elseif difference < -pi
        xu(i:end) = xu(i:end) + 2*pi;
    end
end