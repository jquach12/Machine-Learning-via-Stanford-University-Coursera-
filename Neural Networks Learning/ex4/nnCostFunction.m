function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m




%following the diagram from spec 

a1 = [ones(m,1) X] % 5000 x 401 matrix

%Theta1 has size 25 x 401

z2 = a1 * Theta1' % [5000 x 401][401 * 25] yay multiplication works

disp("z2")
disp(size(z2))
a2 = sigmoid(z2) 

% "add a_0" ->add bias term

a2 = [ones(m,1) a2] %  5000 x 26 (5000 x (25 + 1 bias term))

%Theta2 is 10 x 26

z3 = a2 * Theta2' % [5000 x 26][26 x 10] works out

%disp(size(z3))
activation = sigmoid(z3) % which is a3/output layer

%disp("activation")
%disp(activation)

for k = 1:num_labels
	y_k = y == k % we need these 2 lines of code to get the nice symmetry 
				 % e.g. [0 1 0 0 0 0 0 0 0 0] would represent the label "2"

	h_theta_k = activation(:, k) % just to convert to a column vector

	disp("particular_hypothesis")
	disp(size(h_theta_k)) %16 x 1 why 16...

	%same costFunction from ex2 ! except this is for a particular node
	J_k = 1/m * (-y_k' * log(h_theta_k) - (1 - y_k)' * log( 1 - h_theta_k)) 
	J = J + J_k
end

% minimized cost at J = 0.287629 (without regularization)

%regularization!

%notice that Theta1 and Theta2 were turned into column vectors. every first entry in a column is a bias term

J = J + (lambda/(2*m)) * (sum(sum(power(Theta1(:,2:end),2))) + sum(sum(power(Theta2(:,2:end),2))))

%minimized cost at J = 0.383770 after regularization

%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.




for t = 1:m

	%do calculates with respect to a particular training example t

	%first get the deltas from output

	for k = 1:num_labels
        y_k = y(t) == k
        delta_output(k) = activation(t, k) - y_k 
    end

    %then get the deltas for hidden layer
    delta_hidden = Theta2' * delta_output' .* sigmoidGradient([1, z2(t, :)])'
    disp(size(delta_hidden))
    delta_hidden = delta_hidden(2:end)

    %now we update. remember, doing this for a particular t

    Theta1_grad = Theta1_grad + delta_hidden * a1(t,:)
    Theta2_grad = Theta2_grad + delta_output' * a2(t,:) %transposed delta_output to make math happy
   

end

%lastly, scale by 1/m

Theta1_grad = (1/m) * Theta1_grad
Theta2_grad = (1/m) * Theta2_grad 

%damn, i just implemented backprop




% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


%ez
Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda / m) * Theta1(:, 2:end)
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda / m) * Theta2(:, 2:end)

















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end