function [out_mat] = RLE_decoder(filename)
   A=importdata(filename,' ', 2);
   header = regexp(A{1},'\d','match')
   data = regexp(A{2},'\$','split')
   B = zeros(str2num(header{1}), str2num(header{2}))
   for 1:1:str2num(header{1})
       
end
