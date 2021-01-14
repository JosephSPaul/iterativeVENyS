function[y]=iterative_VENyS(theta,mask,Niter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Very High Field Multi-echo Phase Unwrapping using Phase Rotations 
% from a Virtual Nyquist-sampled Echo Train (Submitted to MRM)
% Sreekanth & Joseph Paul 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Given the multi-echo phase for a single slice, this function performs 
% iVENyS phase unwrapping with n=1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% theta: Multi-Echo phase of single slice with dim [Nrow,Ncol,Necho]
% mask : 2D binary mask to select the brain ROI 
% Niter: Number of iteration

% Output
% y    : Unwrapped PD image computed from first two echo samples.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
psi      = TemporalPhaseUnwrap(theta);
thetatmp(:,:,2)=(psi(:,:,2)-theta(:,:,1));
thetatmpP= thetatmp+0.2;
thetatmpN= thetatmp-0.2;
[IdiffP] = VENyS(thetatmpP);
[IdiffN] = VENyS(thetatmpN);
y        = IdiffP-0.2;
yn       = IdiffN+0.2;

for k=1:Niter
    yder    = diagderivative(y);
    [ym,in3]= max(yder,[],3);
    ind     = find((ym.*mask)>5.0);
    y(ind)  = yn(ind);
         
end
 