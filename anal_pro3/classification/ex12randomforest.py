# <random forest>
# 앙상블 기법 중 bagging 알고리즘에 의사결정나무 트리를 여러개 사용하여
# 하나의 샘플데이터에 다양한 변화를 주면서 최적의 분류모델을 만들어나가는 분류기

#타이타닉 데이터로 연습

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
import pandas as pd
from sklearn import model_selection
from audioop import cross

df = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/titanic_data.csv')
print(df.head(2), ' ', df.shape) #(891, 12)
print(df.info())
df = df.dropna(subset=['Pclass', 'Age', 'Sex'])
print(df.shape) #(714, 12)

df_x = df[['Pclass', 'Age', 'Sex']]
print(df_x, type(df_x))

#Scaling ------
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
df_x.loc[:, 'Sex'] = LabelEncoder().fit_transform(df_x['Sex'])
print(df_x.head(3))

import numpy as np
df_x2 = pd.DataFrame(OneHotEncoder().fit_transform(df_x['Pclass'].values[:, np.newaxis]).toarray(),
                     columns = ['f_class', 's_class', 't_class'], index=df_x.index)
df_x = pd.concat([df_x, df_x2], axis =1)
print(df_x.head(3))
df_y = df['Survived']
print(df_y.head(3))
#train/ test로 분리
(train_x, test_x, train_y, test_y) = train_test_split(df_x, df_y, test_size=0.3, random_state=12)
print(train_x.shape, test_x.shape) #(499, 6) (215, 6)

#model사용
model = RandomForestClassifier(n_estimators=100, criterion='entropy')
#number of estimators를 늘리면 accuracy값이 점점 늘어난다.
fitted_model = model.fit(train_x, train_y)

pred = fitted_model.predict(test_x)
print('예측값: ', pred[:5]) #10000
print('실제값: ', np.array(test_y[:5])) #10001

#정확도 검증
print('acc: ', sum(test_y == pred) / len(test_y))
#acc:  0.8325581395348837

from sklearn.metrics import accuracy_score
print('acc: ', accuracy_score(test_y, pred))
#acc:  0.8372093023255814 위에랑 같은값이 나온다.

#교차 검증
cross_vali = model_selection.cross_val_score(model, df_x, df_y, cv = 5)
print(cross_vali) #[0.76223776 0.81818182 0.83216783 0.83216783 0.80985915]
print(np.round(np.mean(cross_vali),3)) #0.811

























