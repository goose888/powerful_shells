function y = get_multyear_mean(s, nyr)
    y = zeros(48*365,1);
    for i=1:(48*365)
        p = [];
        for j=0:(nyr-1)
            p = [p, s(j*17520+i)]; 
        end
        y(i) = nanmean(p); 
    end
end
