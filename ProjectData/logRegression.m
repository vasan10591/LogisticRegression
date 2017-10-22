function output = gtheta(z)
output = 1./(1+e.^((-1).*z));
endfunction

function output = htheta(theta, x)
output = gtheta(x*theta);
endfunction

function output = discrepancy(X,y,theta)
output = htheta(theta,X)-y;
endfunction

function output = derivative(X,y,theta)
output = X’*discrepancy(X,y,theta);
endfunction

function finalTheta = train(X,y,theta,alpha,iters)
X = [ones(rows(X),1) X];
m = rows(X);
for i=1:iters
theta-=(alpha/m)*derivative(X,y,theta);
endfor
finalTheta = theta;
endfunction