function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta




%hmm...

%breaking down J by simpler terms
z = X*theta
hypothesis = sigmoid(z)

logistic_function = -y' * log(hypothesis) - (1 - y)' * log(1 - hypothesis)

%notice that we need the .* as theta is a column vector 
J = [ 1/m .* sum(logistic_function)] + [ lambda/(2*m) ] .* sum(theta(2:length(theta)).^2)

%"Hint you should not regularize theta1" -> DONT MESS WITH THE BIAS
%2:length(theta) will skip the bias term





grad = (1 / m) * sum( X .* repmat((sigmoid(X*theta) - y), 1, size(X,2)) )
disp("This is grad")
disp(grad)
disp("END OF GRAD")


%A(i:j:k) i is the start, j is the stepsize, k is the end 

%the second term is the dot product equivalent of the sum of theta^2
grad(2:length(grad)) = grad(2:length(grad)) + (lambda/m)*theta(2:length(theta))'

grad 
disp("This is grad spliced")
disp(grad(:,2:length(grad)))
disp("End of Grad")

% =============================================================

end
