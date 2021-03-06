conway("trafficjam.rle", 23)

function [final_gen] = conway(filename, numGens)
    gen0 = padarray(RLE_decoder(filename),[10 10],0,'both'); %Zeroeth generation imported and padded
    prevGen = gen0;

    v = VideoWriter("videotest.avi");
    v.FrameRate = 5;
    open(v);
    for k=1:1:numGens
        prevGen = GOL(prevGen);
         
        imagesc(prevGen);
        colormap(gray);
        frame = getframe(gcf);
        writeVideo(v, frame);
    end
    close(v);
end

