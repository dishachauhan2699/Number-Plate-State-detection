function [state] = findstate(in, states)
row = (in, states.INITIALS) % Find row where this person is stored.
if row > 1
  state = states.RESP_STATES(row)
 
else
  % Name was not found.
  state = 0;
  
end
end






states = 'C:\Users\disha\Desktop\states.xlsx';
% sheet = 1;
% columnNames = {'A','B'};
% rowNames = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','21','22','23','24','25','26','27','28','29','30','31','32','33','34','35'};
% xlRange = [columnNames{1} rowNames{1}];
% yourData = xlsread(filename,sheet,xlRange);
state=[];
row=0;
row = (initial, states.INITIALS)
state = states.RESP_STATES(row)

% ans=[];
% ans = findstate(initial, states)% The function definition.