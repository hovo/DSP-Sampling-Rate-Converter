%{
First Order Low Pass FIR Filter
Source: http://sip.cua.edu/res/docs/courses/ee515/chapter04/ch4-5.pdf 
%}
function out = LPF(M)
    w = 0:0.001:pi;
    % Definition of z: X(w) = X(z) | evaluated at z=e^jw
    z = exp((1j)*w);
  
    % Normalized Cutoff frequency
    w_c = (pi/M)/pi;
    
    p = [cos(w_c),-2,cos(w_c)];
    r = roots(p);
    a = r(2);
    
    % Transfer function for the FIR Filter
    H_lp = ((1 - a)/2).*((1 + z.^-1)./(1 - a*(z.^-1)));
    
    out = real(ifft(H_lp));
end