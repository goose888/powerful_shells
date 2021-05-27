function y = get_multyear_mean_hr(s, nyr)
    y = zeros(24*365,1);
    for i=1:(24*365)
        p = [];
        for j=0:(nyr-1)
            p = [p, s(j*8760+i)]; 
        end
        y(i) = nanmean(p); 
    end
end
