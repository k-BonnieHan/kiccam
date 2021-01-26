#randomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
ml = RandomForestClassifier(n_estimator=500, criterion='entropy')
ml.fit(x_train, y_train) #학습 진행

