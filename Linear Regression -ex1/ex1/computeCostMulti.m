function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


%J = (1/2*m)*(X*theta - y)' * (X*theta - y) supposedly works

 %works just the same as if it were one variable 
 %MATLAB knows wat to do whether or not X is n-dimensional
 J = (1/(2*m))*sum(power((X*theta - y),2))


% =========================================================================

end
