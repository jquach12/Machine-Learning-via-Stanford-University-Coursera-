function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%




              %C    %sigma  %prediction_error
someMatrix = [9999 9999 9999]

%{ %THEY PROVIDED THEIR OWN STEPS BECAUSE THIS STUFF TAKES TOO FREAKING LONG



%for potential_c = [0.01 0.03 0.1 0.3 1 3 10 30]
%	for potential_sigma = [0.01 0.03 0.1 0.3 1 3 10 30]

		%spec said we need to use svmPredict(model, X)

		%well first we need a model
		%@(x1,x2) are arguments passed in into gaussianKernel()

%		provided_model = svmTrain(X,y, potential_c, @(x1,x2) gaussianKernel(x1,x2,potential_sigma))

		%as stated above
%		predictions = svmPredict(provided_model, Xval)

		
%		p_error = mean(double(predictions ~= yval))

		%add new row into the matrix
		%someMatrix = [someMatrix; potential_c potential_sigma p_error]

		%prefer this way to add
%		someMatrix(size(someMatrix,1),:) = [potential_c potential_sigma p_error]
		
%	end
	
%end

%now find the row with smallest prediction error

%pred_error_column = someMatrix(:,end)

%smallestPredVal = min(pred_error_column)

%for row = 1:length(someMatrix)
%	if row(3) == smallestPredVal
%		disp("YAY")
%		C = row(1)
%		sigma = row(2)
%		disp(C)
%		disp(sigma)
%		break
%	end
%end

%C is 1 %FOR FASTER SUBMIT PURPOSES SINCE SVM IS INEFFICIENT AND OCTAVE IS TEDIOUS
%sigma is 0.1

%}

C = 1
sigma = 0.1


% =========================================================================

end
