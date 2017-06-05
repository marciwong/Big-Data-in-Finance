function [RMSE] = crmfeOLS(x,y)
m = LinearModel.fit(x(:,2:end), x(:,1));
m = m.Coefficients;
m = m(:,1);
m = table2array(m);
intercept = ones(length(x),1);
x1 = [intercept,x(:,2:end)];
actucal_result = y(1:end,1);
test_result = m'* x1';
l = length(actucal_result);
a = 1;
p = 0;
while a <= l;
    p = p + (actucal_result(a)-test_result(a))^2;
    a = a+1;
end

RMSE = p;

