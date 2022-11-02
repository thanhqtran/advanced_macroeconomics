function valtrue = truevalfun(k)
    global v0 beta delta alpha kmat k0 kgrid A B 
    vk = A + B*log(k);
valtrue = vk;
