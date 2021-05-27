function  y = regfill_3(idx, s1, s2, s3, t)
    % Decide the window size      
    s1i = s1(idx);
    s2i = s2(idx);
    s3i = s3(idx);
    ti = t(idx);
    idx_noval = find(~isnan(ti));
    s1_reg = s1i(idx_noval);
    s2_reg = s2i(idx_noval);
    s3_reg = s3i(idx_noval);
    sa_reg = [ones(size(s1_reg)), s1_reg, s2_reg, s3_reg];
    t_reg = ti(idx_noval);
    b = regress(t_reg, sa_reg);
    y = t;
    for i = 1:length(y)
        if(ismember(i, idx))
            if(isnan(y(i)))
                y(i) = b(2)*s1(i) + b(3)*s2(i) + b(4)*s3(i) + b(1);
            end
        end
    end
end
