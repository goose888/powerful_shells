function yi = linfill(p)
    y = p(~isnan(p));
    x = find(~isnan(p));
    xi = linspace(1,9,9);
    yi = interp1q(x',y',xi');
end
