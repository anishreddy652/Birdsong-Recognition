clc;
clear all;
close all;
folder = fullfile('E:','Projects','DSP Project','Audio Set','selected_data');
ADS = audioDatastore(folder,'IncludeSubfolders',true,'LabelSource','foldernames');
[trainDatastore, testDatastore] = splitEachLabel(ADS,(2/3));
%Display the audio samples selected for training the neural network
trainDatastore;
trainDatastoreCount = countEachLabel(trainDatastore);
%Display the audio samples selected for testing the neural network
testDatastore;
testDatastoreCount = countEachLabel(testDatastore);

%Feature Extraction
lenDataTrain = length(trainDatastore.Files);
features = cell(lenDataTrain,1);
for i = 1:lenDataTrain
    [dataTrain, infoTrain] = read(trainDatastore);
    features{i} = HelperComputePitchAndMFCC(dataTrain,infoTrain);
end
features = vertcat(features{:});
features = rmmissing(features);
head(features);