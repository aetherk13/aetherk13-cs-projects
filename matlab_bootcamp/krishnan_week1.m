
%Zeroeth generation imported (part d)
filename = 'GoL_input.xlsx';
gen0=xlsread(filename); 


prevGen=gen0;
numGens=1; %number of generations
[numrows, numcols] = size(gen0);
for k=1:1:numGens
    nextGen = zeros(numrows, numcols); %next generation
    Ln = zeros(numrows, numcols); %living neighbours
    for i=1:1:numrows
        for j=1:1:numcols
            %calculating number of living neighbours
            %identifies if cell in matrix is a corner or edge (PART C)
            if i==1 || j==1 || i==numrows || j==numcols
                Ln(i,j) = sum(prevGen(i-ceil((i-1)/numrows):i-floor((i-numrows)/numrows), j-ceil((j-1)/numcols):j-floor((j-numcols)/numcols)), 'all') - prevGen(i,j);
            %number of living neighbours for the inside matrix only (PART A)
            else
                Ln(i,j) = sum(prevGen(i-1:i+1, j-1:j+1), 'all') - prevGen(i,j);
            end
    
            %calculating next gen state
            if prevGen(i,j)==1
                if Ln(i,j)<2||Ln(i,j)>3
                    nextGen(i,j) = 0;
                else 
                   nextGen(i,j) = 1; 
                end
                
            else
                if Ln(i,j)==3
                    nextGen(i,j) = 1;
                end
            end
        end
    end
    prevGen = nextGen;
end

%output image of matrix (PART B)
imagesc(nextGen)
colormap(gray)



    



