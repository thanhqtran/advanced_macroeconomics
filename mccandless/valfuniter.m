global vlast beta delta theta k0 kt 
hold off
hold all 
%set initial conditions 
vlast = zeros(1,100);
k0 = 0.06:0.06:6;
beta = 0.98;
delta = 0.1;
theta = 0.36;
numits=240;
%begin recursive calculations 
for k=1:numits 
    for j = 1:100
        kt = j*.06;
        %find the maximum of value function 
        ktp1=fminbnd(@valfun, 0.01, 6.2);
        v(j) = -valfun(ktp1);
        kt1(j) = ktp1;
    end 
    if k/48 == round(k/48)
        %plot the steps in finding the value function 
        plot(k0, v)
        drawnow
    end 
    vlast = v;
end 
hold off 
%plot the policy function 
plot(k0, kt1)
