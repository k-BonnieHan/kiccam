#두 집단 평균차이 검정
# 서로 독립인 두 집단에서 얻은 표본을 검정

#실습) 남녀 두 집단 간 파이썬 시험의 평균 차이 검정
from scipy import stats
import pandas as pd
from numpy import average

male = [75, 85, 100, 72, 86]
female = [63, 76, 52, 100, 70]

#t-test를 위한 통계적 질문 : 남녀의 시험 평균이 우연히 같을 확률은 얼마나 될까? 
print('male : ', average(male)) #83.6
print('female : ', average(female)) #72.2
#평균이 11.4 차이가 있는데, 이것이 우연히 발생했을 확률은?
two_sample = stats.ttest_ind(male, female)
#two_sample = stats.ttest_ind(male, female, equal_var = False) #등분산성 안줬을때
print(two_sample)
#귀무 채택. pvalue=0.260 > 0.05

print()
#실습2) 두가지 교육방법에 따른 평균시험 점수에 대한 검정 수행 two_sample.csv
data = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/two_sample.csv')
print(data.head(3))
ms = data[['method', 'score']]
print(ms.head(2))
print(ms.method.unique())

#귀무 두가지 교육방법에 따른 평균시험 점수에 차이가 없다.
#대립 잇다.

m1 = ms[ms['method']==1] #방법1
m2 = ms[ms['method']==2] #방법2

print()
score1 = m1['score']
score2 = m2['score']
#NaN결측값 확인
print(score1.isnull().sum()) #0
print(score2.isnull().sum()) #2 --> score2에 결측값 2개 존재

#sco1 = score1.fillna(0) #결측값을 0으로 채우기
#sco2 = score2.fillna(0)
sco1 = score1.fillna(score1.mean()) #결측값을 평균값으로 채우기
sco2 = score2.fillna(0)

#정규성 확인
print('sco1에대한 정규성 확인: ', stats.shapiro(sco1)) # p >0.05 이므로 정규성 있음.
print('sco2에대한 정규성 확인: ', stats.shapiro(sco2)) # p >0.05 이므로 정규성 있음.


#등분산확인
print(stats.levene(sco1, sco2))
print(stats.fligner(sco1, sco2))
print(stats.bartlett(sco1, sco2))

result = stats.ttest_ind(sco1, sco2, equal_var = True)
print(result)
#귀무채택 

#정규성 확인을 위한 시각화
import matplotlib.pyplot as plt
import seaborn as sns
sns.distplot(sco1, kde=False, fit = stats.norm)
sns.distplot(sco2, kde=False, fit = stats.norm)
plt.show()


