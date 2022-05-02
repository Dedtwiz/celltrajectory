%%extracing all final ids for a general data table, paired with
%%celltracking3.m

function R = trackfunc3(data)
in = data(:, 1) == max(data(:, 1));
R = data(in, 3:4);
in2 = R(:, 2) ~= -1;
R = transpose(R(in2, 1));
end 