function [depthmap] = depth(fullDMap)

[a,b]=size(fullDMap);
depthmap=zeros(a,b);
for i=1:a
    for j=1:b
        depthmap(i,j)=getdepth(20.25,30.65,0.8622,1.563,fullDMap(i,j),8.537);
    end
end
end