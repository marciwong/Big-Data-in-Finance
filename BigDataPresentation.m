[dataO, txt]=xlsread('GBP.xlsx');
i = 1;
data = dataO(:,2:end);
cummuKNN = [];
cummuADL = [];
cummuHMOLS = [];
KNNwindowSum = 0;
ADLwindowSum = 0;
HMwindowSum = 0;
OLSwindowSum = 0;
RMSEKNN = 0;
RMSEADL = 0;
RMSEHM = 0;
RMSEOLS = 0;
Y = data(:,2);
X = data(:,3:21);
while i<=209
    window = data(i:i+199,:);
    n = length(window(:,1));
    r= randperm(n);
    newdata = window(r,:);
    fold1 = newdata(1:40,:);
    fold2 = newdata(41:80,:);
    fold3 = newdata(81:120,:);
    fold4 = newdata(121:160,:);
    fold5 = newdata(161:200,:);
    trainningfold1 = newdata(41:200,:);
    trainningfold2 = [newdata(1:40,:);newdata((81:200),:)];
    trainningfold3 = [newdata(1:80,:);newdata((121:200),:)];
    trainningfold4 = [newdata(1:120,:);newdata((161:200),:)];
    trainningfold5 = [newdata(1:160,:)];

%%%%%%OLS window rolling 
    OLSwindow = crmfeOLS(trainningfold1,fold1)+crmfeOLS(trainningfold2,fold2)+crmfeOLS(trainningfold3,fold3)+crmfeOLS(trainningfold4,fold4)+crmfeOLS(trainningfold5,fold5);
%%%%%%KNN window rolling
    KNNwindow = crmfeKNN(trainningfold1,fold1)+crmfeKNN(trainningfold2,fold2)+crmfeKNN(trainningfold3,fold3)+crmfeKNN(trainningfold4,fold4)+crmfeKNN(trainningfold5,fold5);
%%%%%%ADL window rolling
    ADLwindow = crmfeADL(trainningfold1,fold1)+crmfeADL(trainningfold2,fold2)+crmfeADL(trainningfold3,fold3)+crmfeADL(trainningfold4,fold4)+crmfeADL(trainningfold5,fold5);
%%%%%%HM window rolling
    HMwindow = HMcrmfe(trainningfold1,fold1)+HMcrmfe(trainningfold2,fold2)+HMcrmfe(trainningfold3,fold3)+HMcrmfe(trainningfold4,fold4)+HMcrmfe(trainningfold5,fold5); 
%%%%%%Random Forest window rolling
    %RandomForestwindow = RFcrmfe(trainningfold1,fold1)+RFcrmfe(trainningfold2,fold2)+RFcrmfe(trainningfold3,fold3)+RFcrmfe(trainningfold4,fold4)+RFcrmfe(trainningfold5,fold5); 

%%%%%%Window sums   
    KNNwindowSum = KNNwindowSum + KNNwindow;
    ADLwindowSum = ADLwindowSum + ADLwindow;
    HMwindowSum = HMwindowSum + HMwindow;
    OLSwindowSum = OLSwindowSum + OLSwindow;
    
    RMSEKNN = RMSEKNN + (KNNwindowSum/n)^0.5;
    RMSEADL = RMSEADL + (ADLwindowSum/n)^0.5;
    RMSEHM = RMSEHM + (HMwindowSum/n)^0.5;
    RMSEOLS = RMSEOLS + (OLSwindowSum/n)^0.5;
    
    cummuHMOLS(i) = (OLSwindowSum/n)^0.5 - (HMwindowSum/n)^0.5;
    
    i = i+1;
end;
% Plot graph
cummuKNN = cumsum(cummuKNN);
cummuADL = cumsum(cummuADL);
cummuHM = cumsum(cummuHM);
cummuHMOLS = cumsum(cummuHMOLS);

plot(cummuHMOLS)




