function[crmfe] = HMcrmfe(x,y)
historialMean = mean(x(:,1));
acturalResult = y(:,1);
a = 1;
p = 0;
l = length(acturalResult);
while a <=l;
    p = p+(acturalResult(a)-historialMean)^2;
    a =a+1;
end
crmfe = p;

