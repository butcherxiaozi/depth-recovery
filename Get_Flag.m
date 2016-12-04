function Flag = Get_Flag(I)

[I_row,I_column,~] = size(I);
Flag = zeros(I_row,I_column);

for i = 1:I_row
    for j= 1:I_column

if i-1>0 && j-1>0
    if I(i,j,:) == I(i-1,j-1,:);
    else Flag(i,j) = 1;
        continue;
    end
end

if i-1>0
    if I(i,j,:) == I(i-1,j,:);
    else Flag(i,j) = 1;
        continue;
    end
end

if i-1>0 && j+1<=I_column
    if I(i,j,:) == I(i-1,j+1,:);
    else Flag(i,j) = 1;
        continue;
    end
end

if j-1>0
    if I(i,j,:) == I(i,j-1,:);
    else Flag(i,j) = 1;
        continue;
    end
end

if j+1<I_column
    if I(i,j,:) == I(i,j+1,:);
    else Flag(i,j) = 1;
    end
end

if i+1<I_row && j-1>0
    if I(i,j,:) == I(i+1,j-1,:);
    else Flag(i,j) = 1;
    end
end

if i+1<I_row
    if I(i,j,:) == I(i+1,j,:);
    else Flag(i,j) = 1;
    end
end

if i+1<I_row && j+1<I_column
    if I(i,j,:) == I(i+1,j+1,:)
    else Flag(i,j) = 1;
    end
end

    end
end

end