%%function that extracts cell ids for the lineage, for a general dataset.
%%Paired with celltracking3.m

function L = trackfunc31(data, x)
z = find(data(:, 3) == x);
d = data(:, 5);
L = d(z(1));
end





