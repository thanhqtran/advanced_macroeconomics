clear all;
close all;

global v0 beta delta alpha kgrid k0 kmat A B

% set parameters 
alpha = 0.3;
beta = 0.9;
delta = 1;

tol = 0.0001;
maxiter = 300;
dif = tol+1000;
iter = 0;

%solve for steady state 
kss = (alpha*beta/(1-beta+delta*beta))^(1/(1-alpha));
css = kss^alpha - delta*kss;
iss = delta*kss;
yss = kss^alpha;

% initiate grid 
kmin = 0.5*kss;
kmax = 2*kss;
kgrid = 100; %no of grid points
kmat = linspace(kmin, kmax, kgrid); %make an array
kmat = kmat'; %convert to column vector
[N,n] = size(kmat);

%true value function 
A = alpha*beta*log(alpha*beta)/((1-alpha*beta)*(1-beta)) + log(1-alpha*beta)/(1-beta);
B = alpha/(1-alpha*beta);

% guess
v0 = zeros(N,1);

%loop
while dif > tol & iter < maxiter
	for i = 1:N
		k0 = kmat(i,1);
		k1 = fminbnd(@valfun, kmin, kmax);
		v1(i,1) = -valfun(k1); %because k1 is returned as negative
		kt(i,1) = k1;
	end
	figure(1)
	if mod(iter,20) == 5
		plot(kmat, v1, 'DisplayName', strcat('iteration=', num2str(iter)))
		xlabel('$k_t$','interpreter','latex')
		ylabel('$V(k_t)$','interpreter','latex')
		drawnow
		hold on
		%plot(kmat, truevalfun(kmat), '--r')
	end
	legend('show', 'Location','northwest')
	%hold on 
dif = norm(v1-v0);
v0 = v1;
iter = iter + 1;
end
plot(kmat, truevalfun(kmat),'--','DisplayName', 'true value function')
legend('show')
hold off
figure(2)
plot(kmat, kt, 'DisplayName', 'Policy function')
hold on 
plot(kmat,kmat, '--', 'DisplayName', '45-degree line')
hold on 
plot(kss, kss, 'r*', 'DisplayName', 'steady state')
legend('show', 'Location','northwest')
xlabel('$k_t$','interpreter','latex')
ylabel('$k_{t+1}$','interpreter','latex')
hold off
