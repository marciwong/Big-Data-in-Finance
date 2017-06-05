function [crmfe] = crmfeADL(x,y)
[CoFull FitInfFull] = lasso(x(:,2:end), x(:,1));
BasketFull_1 = find(CoFull(:,1));
NewvariablesX = x(:,BasketFull_1+1);
NewvariablesY = y(:,BasketFull_1+1);
beta = (NewvariablesX'*NewvariablesX)^(-1)*NewvariablesX'*x(:,1);
actualReslt = y(:,1);
testResult = beta' * [ones(length(actualReslt),1),NewvariablesY(:,2:end)]';
a = 1;
p = 0;
l = length(actualReslt);
while a <=l;
    p = p + (testResult(a)-actualReslt(a))^2;
    a = a+1;
end
crmfe = p;