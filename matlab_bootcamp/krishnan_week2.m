filename = 'GoL_input.xlsx';
gen0=xlsread(filename); %Zeroeth generation imported (part d)
prevGen = gen0;
numGens=24; %number of generations
for k=1:1:numGens
    prevGen = GOL(prevGen);
end

%imagesc(prevGen)
%colormap(gray)

RLE_decoder("beacon.rle")
