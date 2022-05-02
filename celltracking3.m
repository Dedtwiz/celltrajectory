%% establishing directory
folder = "/Users/kevinchen/Documents/BIOS 310/sox2csv/";
movies = dir(fullfile(folder, filesep, '*.csv'));

%% processing data to produce array with finalextracted rows for all treatment conditions
experimentdata = {};
for mov = 1:length(movies)
data = table2array(readtable(fullfile(folder, filesep, movies(mov).name)));
idfinalall = trackfunc3(data)
finalextractedmat={};
for nidfinal = 1:length(idfinalall)
    idfinal = idfinalall(nidfinal)

%%establishing matrix
mat = [];
mat(1) = idfinal;

%id extraction
fv = 1;
n = 1;
while fv == 1
    id = trackfunc31(data, mat(n))
    if id ~= 0 
        mat(n+1) = id;
        n = n+1
    else
        fv = 0
    end
end

%%creating cell array with indexes for original table
sort(mat)
finalmat = []
for n1 = 1:length(mat)
    id2 = mat(n1);
    finalmat = [finalmat;find(data(:, 3) == id2)];
end

%%extracting rows of interest for lineage of interest into a cell array
finalextractedmat{nidfinal} = data(sort(finalmat), :);
end

experimentdata{mov} = finalextractedmat;
end

save('experimentdata')

%% merging data template. ncondition * nposition should equal the number of images you have. Just alter the parameters to your liking
mergedexperimentdata = {};
ncondition = 4;
nposition = 1;
for ii = 1:ncondition
    mergedexperimentdata{ii} = [];
    for pp = 1:nposition
        mergedexperimentdata{ii} = [mergedexperimentdata{ii}, experimentdata{pp + nposition*(ii-1)}];
            end
end

%%  creating subplots for SOX2 flourescence
figure
expnames = {'mTeSR 0-48','BMP 10ng/ml 0-30, Noggin 30-48','BMP 50ng/ml 0-30, Noggin 30-48','BMP 50ng/ml 0-48'};
for expnumplot = 1:4
subplot(2,2,expnumplot)
experiment = mergedexperimentdata{expnumplot}
for ii = 1:length(experiment)
    hold on
plot(15*mergedexperimentdata{expnumplot}{1, ii}(:, 1)/60, mergedexperimentdata{expnumplot}{1, ii}(:, 36))
moviemeantotaltable = cell2table(moviemeantotal{expnumplot});
errorbar(15*moviemeantotaltable{:, 1}/60, moviemeantotaltable{:, 2}, moviemeantotaltable{:, 3}/2, "color", "b");
title(expnames{expnumplot})
xlabel("Hours")
ylabel("SOX2 Flourescent Intensity")
xlim([0 205*15/60])
ylim([550 750])
end
hold on 
end

%% creating subplots for H2B flourescence
figure
expnames = {'mTeSR 0-48','BMP 10ng/ml 0-30, Noggin 30-48','BMP 50ng/ml 0-30, Noggin 30-48','BMP 50ng/ml 0-48'};
for expnumplot = 1:4
subplot(2,2,expnumplot)
experiment = mergedexperimentdata{expnumplot}
for ii = 1:length(experiment)
    hold on
plot(15*mergedexperimentdata{expnumplot}{1, ii}(:, 1)/60, mergedexperimentdata{expnumplot}{1, ii}(:, 35))
title(expnames{expnumplot})
xlabel("Hours")
ylabel("H2B Flourescent Intensity")
xlim([0 205*15/60])
ylim([500 1000])
end
hold on 
end


%% Plotting data for all individual movies (without creating subplot)
figure
experiment = mergedexperimentdata{1}
for ii = 1:length(experiment)
plot(mergedexperimentdata{1}{1, ii}(:, 1), mergedexperimentdata{1}{1, ii}(:, 36))
title("SOX2 Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 800])
hold on 
moviemeantotaltable = cell2table(moviemeantotal{1})
errorbar(moviemeantotaltable{:, 1}, moviemeantotaltable{:, 2}, moviemeantotaltable{:, 3}/2)
   % plot(moviemeantotaltable{:, 1}, moviemeantotaltable{:, 2}, 'LineWidth', 2, 'color', "black")
end

%%
figure
experiment = mergedexperimentdata{1}
for ii = 1:length(experiment)
plot(mergedexperimentdata{1}{1, ii}(:, 1), mergedexperimentdata{1}{1, ii}(:, 35))
title("H2B Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 1000])
hold on 
end

%%
figure
experiment = mergedexperimentdata{2}
for ii = 1:length(experiment)
plot(mergedexperimentdata{2}{1, ii}(:, 1), mergedexperimentdata{2}{1, ii}(:, 36))
title("SOX2 Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 735])
hold on 
moviemeantotaltable = cell2table(moviemeantotal{2})
    plot(moviemeantotaltable{:, 1}, moviemeantotaltable{:, 2}, 'LineWidth', 2, 'color', "black")
end

%%
figure
experiment = mergedexperimentdata{2}
for ii = 1:length(experiment)
plot(mergedexperimentdata{2}{1, ii}(:, 1), mergedexperimentdata{2}{1, ii}(:, 35))
title("H2B Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 1000])
hold on 
end

%%
figure
experiment = mergedexperimentdata{3}
for ii = 1:length(experiment)
plot(mergedexperimentdata{3}{1, ii}(:, 1), mergedexperimentdata{3}{1, ii}(:, 36))
title("SOX2 Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 735])
hold on 
moviemeantotaltable = cell2table(moviemeantotal{3})
    plot(moviemeantotaltable{:, 1}, moviemeantotaltable{:, 2}, 'LineWidth', 2, 'color', "black")
end

%%
figure
experiment = mergedexperimentdata{3}
for ii = 1:length(experiment)
plot(mergedexperimentdata{3}{1, ii}(:, 1), mergedexperimentdata{3}{1, ii}(:, 35))
title("H2B Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 1000])
hold on 
end

%%
figure
experiment = mergedexperimentdata{4}
for ii = 1:length(experiment)
plot(mergedexperimentdata{4}{1, ii}(:, 1), mergedexperimentdata{4}{1, ii}(:, 36))
title("SOX2 Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 735])
hold on 
moviemeantotaltable = cell2table(moviemeantotal{4})
    plot(moviemeantotaltable{:, 1}, moviemeantotaltable{:, 2}, 'LineWidth', 2, 'color', "black")
end

%%
figure
experiment = mergedexperimentdata{4}
for ii = 1:length(experiment)
plot(mergedexperimentdata{4}{1, ii}(:, 1), mergedexperimentdata{4}{1, ii}(:, 35))
title("H2B Flourescence Over Time")
xlabel("Frame")
ylabel("Mean Flourescent Intensity")
xlim([0 205])
ylim([500 1000])
hold on 
end

%% making subplots for experiment 1
%extraction step, cell 2 and 3
figure
for i = 2:3
cellnumber = i 
celllineageindex = {}
experimentnumber = 1
subplot(2,1,i-1)
hold on
    for i = 1:length(mergedexperimentdata{experimentnumber})
celllineageindex{1, i} = mergedexperimentdata{experimentnumber}{1, i}(1, 4) == cellnumber
    end
mergedexperimentsubplot = mergedexperimentdata{experimentnumber}(1, cell2mat(celllineageindex))

%plot step
experiment = mergedexperimentsubplot
for ii = 1:length(mergedexperimentsubplot)
plot(mergedexperimentsubplot{1, ii}(:, 1)*15/60-2.5, mergedexperimentsubplot{1, ii}(:, 36))
xlim([0 205]*15/60-2.5)
plot([0 0],[0 750],'k-.')
xline(30, "k-.")
ylim([550 750])
hold on 
xlabel("Hours")
ylabel("SOX2 Flourescent Intensity")
end
end 

%% making subplots for experiment 2
%extraction step, cell 2, 3, 4, 5, 6, 7
figure
for i = 2:7
cellnumber = i 
celllineageindex = {}
experimentnumber = 2
subplot(2,3,i-1)
hold on
    for i = 1:length(mergedexperimentdata{experimentnumber})
celllineageindex{1, i} = mergedexperimentdata{experimentnumber}{1, i}(1, 4) == cellnumber
    end
mergedexperimentsubplot = mergedexperimentdata{experimentnumber}(1, cell2mat(celllineageindex))

%plot step
experiment = mergedexperimentsubplot
for ii = 1:length(mergedexperimentsubplot)
plot(mergedexperimentsubplot{1, ii}(:, 1)*15/60-2.5, mergedexperimentsubplot{1, ii}(:, 36))
xlim([0 205]*15/60-2.5)
plot([0 0],[0 750],'k-.')
xline(30, "k-.")
ylim([550 750])
hold on 
xlabel("Hours")
ylabel("SOX2 Flourescent Intensity")
end
end 

%% making subplots for experiment 3
%extraction step, cell 2, 3
figure
for i = 2:3
cellnumber = i 
celllineageindex = {}
experimentnumber = 3
subplot(2,1,i-1)
hold on
    for i = 1:length(mergedexperimentdata{experimentnumber})
celllineageindex{1, i} = mergedexperimentdata{experimentnumber}{1, i}(1, 4) == cellnumber
    end
mergedexperimentsubplot = mergedexperimentdata{experimentnumber}(1, cell2mat(celllineageindex))

%plot step
experiment = mergedexperimentsubplot
for ii = 1:length(mergedexperimentsubplot)
plot(mergedexperimentsubplot{1, ii}(:, 1)*15/60-2.5, mergedexperimentsubplot{1, ii}(:, 36))
xlim([0 205]*15/60-2.5)
plot([0 0],[0 750],'k-.')
xline(30, "k-.")
ylim([550 750])
hold on 
xlabel("Hours")
ylabel("SOX2 Flourescent Intensity")
end
end 

%% making subplots for experiment 4
%extraction step, cell 2 and 3
figure
for i = 2:3
cellnumber = i 
celllineageindex = {}
experimentnumber = 4
subplot(2,1,i-1)
hold on
    for i = 1:length(mergedexperimentdata{experimentnumber})
celllineageindex{1, i} = mergedexperimentdata{experimentnumber}{1, i}(1, 4) == cellnumber
    end
mergedexperimentsubplot = mergedexperimentdata{experimentnumber}(1, cell2mat(celllineageindex))

%plot step
experiment = mergedexperimentsubplot
for ii = 1:length(mergedexperimentsubplot)
plot(mergedexperimentsubplot{1, ii}(:, 1)*15/60-2.5, mergedexperimentsubplot{1, ii}(:, 36))
xlim([0 205]*15/60-2.5)
plot([0 0],[0 750],'k-.')
xline(30, "k-.")
ylim([550 750])
hold on 
xlabel("Hours")
ylabel("SOX2 Flourescent Intensity")
end
end 

%% normalization of all data, not needed for our analysis
%normalization of SOX2 ** renmae variable so you hve another set
for ii = 1:length(mergedexperimentdata)
    for i2 = 1:length(mergedexperimentdata{ii})
    mergedexperimentdata{ii}{1, i2}(:, 36) = mergedexperimentdata{ii}{1, i2}(:, 36) - mergedexperimentdata{ii}{1, i2}(1, 36);
    end
end

%normalization of H2B
for ii = 1:length(mergedexperimentdata)
    for i2 = 1:length(mergedexperimentdata{ii})
    mergedexperimentdata{ii}{1, i2}(:, 35) = mergedexperimentdata{ii}{1, i2}(:, 35) - mergedexperimentdata{ii}{1, i2}(1, 35);
    end
end

%normalization of mean data **fix this
for ii = 1:length(moviemeantotal)
    moviemeantotal{ii} = cell2mat(moviemeantotal{ii})
  moviemeantotal{ii}(:, 2) = moviemeantotal{ii}(:, 2) - moviemeantotal{ii}(1, 2)
end
