function val=valfun(k)
    global v0 beta delta alpha kmat k0 kgrid
    % optimizing grid choosing
    ki0 = max(sum(k>kmat), 1); %identify the grid that falls just below the choice for k
    ki1 = ki0 + 1;
    %[1] interpolation algorithm 
    g = v0(ki0) + (k-kmat(ki0))*(v0(ki1)-v0(ki0))/(kmat(ki1)-kmat(ki0));
    %[2] alternative (in this case, no grid optimization)
    %g = interp1(kmat, v0, k, 'linear');
    c = k0^alpha - k + (1-delta)*k0; %consumption
    if c <= 0
        val = -888-800*abs(c);
    else
        val = log(c) + beta*g;
    end
    %change value to negative since "fminbnd" finds minimum 
val = -val;
