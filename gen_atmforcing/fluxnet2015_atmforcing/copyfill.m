function [y, window] = copyfill(p, loc, multyear_mean)
    % Decide the window size      
    idx = find(~isnan(p));
    window = idx(1)-1;
    % Assign
    y = multyear_mean(loc:(loc+window-1));
end
