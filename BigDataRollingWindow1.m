data =xlsread('AUD.xlsx');
data = data(:,2:6);
% Creating training rolling window
training1 = data (1:38,:);
training2 = data (1:76,:);
training3 = data (1:112,:);
training4 = data (1:150,:);
training5 = data (1:186,:);
training6 = data (1:222,:);
training7 = data (1:258,:);
training8 = data (1:294,:);
training9 = data (1:330,:);
training10 = data (1:366,:);
training11 = data (1:402,:);

% Creating testing rolling window
testing1 = data