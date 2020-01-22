
import xlsxwriter
import numpy as np
import sklearn
from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
from sklearn.model_selection import GridSearchCV
from sklearn.metrics import classification_report

# Load data from numpy file
X =  np.load('feat.npy')
y =  np.load('label.npy').ravel()
#print(y)
X_train=[]
X_test=[]
y_train=[]
y_test=[]
for i in range(len(X)):
    if((i%3)!=0):
        X_train.append(X[i])
        y_train.append(y[i])
    else:
        X_test.append(X[i])
        y_test.append(y[i])
#print(X_test)

print('fitting...')
clf = SVC()
clf.fit(X_train, y_train)
print(clf.predict(X_test))
#acc = clf.score(X_test, y_test)
#print("acc=%0.3f" % acc)
