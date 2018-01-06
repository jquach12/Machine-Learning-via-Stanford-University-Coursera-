function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%input -> hidden -> output

input_layer = [ones(m,1) X]

input_dot = input_layer * Theta1'

disp("SIZE OF HIDDEN LAYER FROM NEURAL NETWORK")
disp(size(input_dot)) % 5000 x 26 (25 + 1 bias term)


input_sig = sigmoid(input_dot) %the sigmoid is actually the hidden layer


output_layer = [ones(m,1) input_sig]

output_dot = output_layer * Theta2'

disp("SIZE OF OUTPUT LAYER FROM NEURAL NETWORK")
disp(size(output_dot))
output_sig = sigmoid(output_dot)

%from predictOneVSAll.m
[pvalue, p] = max(output_sig, [], 2)


% =========================================================================


end
