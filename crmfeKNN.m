function [RMSE] = crmfeKNN(x,y)
[n,d] = knnsearch(x(:,2:end), y(:,2:end), 'k', 1);
actucal_result = y(1:end,1);
test_result = x(n,1);
l = length(actucal_result);
a = 1;
p = 0;
while a <= l;
    p = p + (actucal_result(a)-test_result(a))^2;
    a = a+1;
end

RMSE = p;