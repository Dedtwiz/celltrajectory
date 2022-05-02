%% establishing directory
folder = "/Users/kevinchen/Documents/BIOS 310/sox2csv/";
movies = dir(fullfile(folder, filesep, '*.csv'));

%% Finding mean for each movie frame
moviemean = {};
moviemeantotal = {};
for mov = 1:length(movies)
data = table2array(readtable(fullfile(folder, filesep, movies(mov).name)));

for n = 0:max(data(:, 1))
    extracteddata = data(data(:, 1) == n, :);
    moviemean{n + 1, 2} = mean(extracteddata(:, 36));
    moviemean{n + 1, 3} = std(extracteddata(:, 36));
    for ii = 1:length(moviemean)
        moviemean{ii, 1} = ii - 1;
    end 
end
moviemeantotal{mov, 1} = moviemean

end 


%% use this one!! %% merging all lineages and finding means for each of the experiments. Means are for each experiment's populations of cells, not the total cell population
meanextracted = {};
moviemeantotal = {};
moviemean = {};
for i = 1:length(mergedexperimentdata)
mergedexperimentdata2 = vertcat(mergedexperimentdata{1, i}{1:length(mergedexperimentdata{i})});
meanextracted{i} = mergedexperimentdata2;
end

for i = 1:length(mergedexperimentdata)
for n = 0:max(meanextracted{i}(:, 1))
    extracteddata = meanextracted{i}(meanextracted{i}(:, 1) == n, :);
    moviemean{n + 1, 2} = mean(extracteddata(:, 36));
    moviemean{n + 1, 3} = std(extracteddata(:, 36));
    for ii = 1:length(moviemean)
        moviemean{ii, 1} = ii - 1;
    end 
    moviemeantotal{i, 1} = moviemean
end
end
