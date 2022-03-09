%%function that extracts cell ids for the lineage

function L = trackfunc(x)
live2 = table2array(readtable("/Users/kevinchen/Documents/BIOS 310/live2.csv"));
z = find(live2(:, 3) == x);
d = live2(:, 5);
L = d(z(1));
end

