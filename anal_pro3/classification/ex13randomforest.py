from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import pandas as pd
from sklearn import model_selection
from audioop import cross
from sklearn.metrics._regression import r2_score

df = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/titanic_data.csv')
print(df.head(2), ' ', df.shape) #(891, 12)
print(df.info())
df = df.dropna(subset=['Pclass', 'Age', 'Sex'])
print(df.shape) #(714, 12)

df_x = df[['Pclass', 'Age', 'Sex']]
print(df_x, type(df_x))

#Scaling ------
from sklearn.preprocessing import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size =0.3, random_state=123)
model.fit(x_train, y_train)

#결정계수 확인
trainR2 = r2_score(train_y, model.predict(train_x))
print('학습데이터로 결정계수: ', trainR2)

#독립변수의 수를 늘리면 두 사이의 차이는 줄어들 수 있다.
# 새 값으로 집값 예측
import numpy as np
x_new = np.array([[10],[50],[1]])
print('예상 집값', model.predict(x_new))