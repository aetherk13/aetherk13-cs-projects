function [out_mat] = RLE_decoder(filename)
   A=importdata(filename,' ', 2);
   header = regexp(A{1},'\d(\d)?','match');
   data = regexp(A{2},'\$','split')
   out_mat = zeros(str2num(header{2}), str2num(header{1}));
   display(str2num(header{2}))


   pattern = '(\d)?(\d)?\w';
   [r,c] = size(data);
    for i=1:1:c %row
        row_split = regexp(data{i}, pattern, "match") %splitting row into parts
        [row,col] = size(row_split);
        index = 1;
        for j=1:1:col %each of the split parts
            if any(regexp(row_split{j}(1) ,'[0-9]')) %if the first digit is a number
                multiplier = sscanf(row_split{j},'%d'); %fix for 2 digits
                    for k=1:1:multiplier %multiplier
                        if row_split{j}(2)=='o'
                            out_mat(i,index) = 1;
                        end
                        display(index)
                        display(out_mat)
                        index = index+1;
                    end
            else
                if row_split{j}(1)=='o'
                    out_mat(i,index) = 1;
                end
                index = index + 1;
            end     
        end
    end
end
