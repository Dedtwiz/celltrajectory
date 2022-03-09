
%%identifying initial parameters (should be modified as necessary)
Y = zeros(500, 1);
Y(1) = 217;
live2 = table2array(readtable("/Users/kevinchen/Documents/BIOS 310/live2.csv"));


%%extracting cell ids in the lineage utilizing the trackfunc
g = 1;
n=1;
while g == 1
    Y(n+1) = trackfunc(Y(n));

    if Y(n+1) == 0
        g = 0
    end
n=n+1;
end

%%reshaping data
Y1 = reshape(sort(Y(1:6, 1)), 1, 6)

%%creating a cell array with the indexes for the original table
for x = Y1
    b = find(Y1 == x)
 T{b, 1} = transpose(find(live2(:, 3) == x))
end

%%for loop to extract rows from original table with cell ids in the lineage
for i = 1:numel(Y1)
B{i, 1} = live2(T{i, 1}, 1:20)
end

%%combining into one big array
f = vertcat(B{1, 1}, B{2, 1}, B{3, 1}, B{4, 1}, B{5, 1}, B{6, 1})

%%plotting flourescence against frame
plot(f(:, 1), f(:, 12))
plot(f(:, 1), f(:, 13))




