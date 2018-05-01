function out = LPF(M)
    w = 0:0.001:pi;
    z=exp(1i*w);
    
    w_c = (pi/M)/pi;
    
    p = [cos(w_c),-2,cos(w_c)];
    r = roots(p);
    a = r(2);
    H_lp = ((1 - a)/2).*((1 + z.^-1)./(1 - a*(z.^-1)));
    
    out = real(ifft(H_lp));
end