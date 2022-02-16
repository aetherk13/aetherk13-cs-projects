function next_gen_mat = GOL(in_mat)

[x_size, y_size] = size(in_mat);
next_gen_mat = zeros(x_size, y_size); %next generation
Ln = zeros(x_size, y_size); %living neighbours
for i=1:1:x_size
    for j=1:1:y_size
        %calculating number of living neighbours
        if i==1 || j==1 || i==x_size || j==y_size %identifies if cell in matrix is a corner or edge (part c)
            Ln(i,j) = sum(in_mat(i-ceil((i-1)/x_size):i-floor((i-x_size)/x_size), j-ceil((j-1)/y_size):j-floor((j-y_size)/y_size)), 'all') - in_mat(i,j);
        else
            Ln(i,j) = sum(in_mat(i-1:i+1, j-1:j+1), 'all') - in_mat(i,j);%number of living neighbours for the inside matrix only (part a)
        end

        %calculating next gen state
        if in_mat(i,j)==1
            if Ln(i,j)<2||Ln(i,j)>3
                next_gen_mat(i,j) = 0;
            else 
               next_gen_mat(i,j) = 1; 
            end
            
        else
            if Ln(i,j)==3
                next_gen_mat(i,j) = 1;
            end
        end
    end
end
end