blinker = [0 0 0 0 0; 0 0 1 0 0; 0 0 1 0 0; 0 0 1 0 0; 0 0 0 0 0];
beacon = [0 0 0 0 0 0; 0 1 1 0 0 0; 0 1 0 0 0 0; 0 0 0 0 1 0; 0 0 0 1 1 0; 0 0 0 0 0 0];
table = zeros(50);
table(25,24:27) = 1;
table(26,24) = 1;
table(26,27) = 1;
mtable = zeros(50, 49);
mtable(24:27,24) = 1;
mtable(24:27,26) = 1;
mtable(24,23) = 1;
mtable(27,23) = 1;
mtable(24,27) = 1;
mtable(27,27) = 1;

imagesc(genIter(, mtable))
colormap(gray)

function [nextGen] = genChange(prevGen)
    nextGen = zeros(size(prevGen,1), size(prevGen,2)); %next generation
    Ln = zeros(size(prevGen,1), size(prevGen,2)); %living neighbours
    rsize = size(prevGen,1);
    csize = size(prevGen,2);
    for i=1:1:rsize
        for j=1:1:csize
            
            %calculating number of living neighbours
            if i==1 || j==1 || i==rsize || j==csize
                Ln(i,j) = sum(prevGen(i-ceil((i-1)/rsize):i-floor((i-rsize)/rsize), j-ceil((j-1)/csize):j-floor((j-csize)/csize)), 'all') - prevGen(i,j);
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
end

function [finalGen] = genIter(numGens, gen0)
    newGen=gen0;
    for i=1:1:numGens
        newGen = genChange(newGen);
    end
    finalGen = newGen;
end
 



    



