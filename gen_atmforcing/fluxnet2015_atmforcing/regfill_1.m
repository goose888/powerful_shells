function  y = regfill_1(idx, s, t)
    % Decide the window size      
    si = s(idx);
    ti = t(idx);
    idx_noval = find(~isnan(ti));
    s_reg = si(idx_noval);
    t_reg = ti(idx_noval);
    % regression function requires a higher matlab version
    % Suggest to use: matlab/0matlab-r2017a
    [r, a ,b] = regression(s_reg',t_reg');
    y = t;
    for i = 1:length(y)
        if(ismember(i, idx))
            if(isnan(y(i)))
                y(i) = a*s(i) + b;
            end
        end
    end
end
