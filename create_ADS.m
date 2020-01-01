folder = fullfile('E:','Projects','DSP Project','Audio Set','selected_data');
ADS = audioDatastore(folder);
data = readall(ADS);