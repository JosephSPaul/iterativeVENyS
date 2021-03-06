%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
The main code used to perform spatio-temporal unwrapping using Virtual Echo based 
Nyquist Sampled (VENyS) algorithm is "iterative_VENyS.m".
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This code is written in Matlab R2015a.  
The Input and Output variables used to run this code is discussed below.

----------------------------------- INPUT data ---------------------------------------------
theta: Multi-echo raw phase images of a single slice with dimension [Nrow, Ncol, Necho].
                        
mask : Binary phase mask for the brain ROI .
        
Niter: Number of iteration needed for spatio-temporal unwrapping (iVENyS).


---------------------------------- OUTPUT data ----------------------------------------------
y: Spatio-temporal unwrapped phase difference image computed from first two echoes.
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
Courtesy: These codes are tested using the publicly shared dataset by Cornell MRI Research lab

--------------------------------- References -------------------------------------------------

Windischberger C, Robinson S, Rauscher A, Barth M, Moser E. Robust field map generation using a 
triple‐echo acquisition. Journal of Magnetic Resonance Imaging:2004;20(4):730-4.

Itoh K. Analysis of the phase unwrapping algorithm. Applied optics. 1982;21(14):2470.

Dagher J, Reese T, Bilgin A. High‐resolution, large dynamic range field map estimation. 
Magnetic resonance in medicine. 2014;71(1):105-17.