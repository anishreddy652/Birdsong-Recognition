# Birdsong-Recognition
To classify birds on basis of their species using their songs and audio processing techniques.

Dataset:
The dataset was found on Kaggle, there are 264 audio files with 3 audio samples for each bird species.The first 10 species corresponding to 30 audio samples were selected.The samples are renamed by the bird names, for the ease of understanding.
The link for the file is http://bit.ly/selected_audio or can be downloaded at 
(https://www.kaggle.com/rtatman/british-birdsong-dataset).

Feature Extraction:
  We have extracted 6 spectral features from each audio clip namely Short term fourier transform, MFCCs, Tonnetz, Chroma, Melspectogram and spectral contrast. These features charecterize each audio clip and are used to train the SVM classifier.


