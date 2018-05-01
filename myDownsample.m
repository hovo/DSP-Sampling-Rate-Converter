% decreases the sample rate of x by keeping the first sample and then 
% every nth sample after the first. 
function y = myDownsample(x, n)
    y = x(1:n:length(x));
end