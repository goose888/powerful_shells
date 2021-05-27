function [es,esdT,qs,qsdT] = qsadv(T,p)
    %% This function is copied from CoLM. Polynomial fitting to qsat from Temperature and Pressure
    % for water vapor (temperature range 0C-100C)
    a = [6.11213476, 0.444007856, 0.143064234e-01, 0.264461437e-03, ...
        0.305903558e-05, 0.196237241e-07, 0.892344772e-10, ...
        -0.373208410e-12, 0.209339997e-15];

    % for derivative:water vapor
    b = [0.444017302, 0.286064092e-01, 0.794683137e-03, ...
        0.121211669e-04, 0.103354611e-06, 0.404125005e-09, ...
        -0.788037859e-12, -0.114596802e-13, 0.381294516e-16];

    % for ice (temperature range -75C-0C)
    c = [6.11123516, 0.503109514, 0.188369801e-01, ...
        0.420547422e-03, 0.614396778e-05, 0.602780717e-07, ...
        0.387940929e-09, 0.149436277e-11, 0.262655803e-14];

    % for derivative:ice
    d = [0.503277922, 0.377289173e-01, 0.126801703e-02, ...
        0.249468427e-04, 0.313703411e-06, 0.257180651e-08, ...
        0.133268878e-10, 0.394116744e-13, 0.498070196e-16];
    
    T_limit  = T;

    % For numerical Stability
    if (T_limit > 100.0) 
        T_limit=100.0;
    end
    if (T_limit < -75.0) 
        T_limit=-75.0;
    end

    td = T_limit;

    if (td >= 0.0)
        es   = a(1) + td*(a(2) + td*(a(3) + td*(a(4) + td*(a(5) ...
                  + td*(a(6) + td*(a(7) + td*(a(8) + td*a(9))))))));
        esdT = b(1) + td*(b(2) + td*(b(3) + td*(b(4) + td*(b(5) ...
                  + td*(b(6) + td*(b(7) + td*(b(8) + td*b(9))))))));
    else
        es   = c(1) + td*(c(2) + td*(c(3) + td*(c(4) + td*(c(5) ...
                  + td*(c(6) + td*(c(7) + td*(c(8) + td*c(9))))))));
        esdT = d(1) + td*(d(2) + td*(d(3) + td*(d(4) + td*(d(5) ...
                  + td*(d(6) + td*(d(7) + td*(d(8) + td*d(9))))))));
    end

    es    = es    * 100.;            % pa
    esdT  = esdT  * 100.;            % pa/K

    vp    = 1.0   / (p - 0.378*es);
    vp1   = 0.622 * vp;
    vp2   = vp1   * vp;

    qs    = es    * vp1;             % kg/kg
    qsdT  = esdT  * vp2 * p;         % 1 / K

end
