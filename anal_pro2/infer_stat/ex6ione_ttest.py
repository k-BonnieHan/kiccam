'''
단일집단 평균검정: 독립(범주형), 종속(연속형)
모수를(평균)을 알고 있는 경우, sample의 평균과 차이가 있는지 검정한다.
'''
#어느 집단의 평균키 검정
#귀무: 어느 남성집단의 키는 177이다.
#대립: 평균키는 177이 아니다.

import numpy as np
import scipy.stats as stats
import matplotlib.pylab as plt
import seaborn as sns
import pandas as pd

#이미 존재하는 모집단에 비교할 비교집단이 1개임.
one_sample = [177.0, 182.7, 169.6, 176.8, 180.0]
print(np.array(one_sample).mean()) #177.21999999999997
result = stats.ttest_1samp(one_sample, popmean=177)
print(result) #귀무채택  pvalue=0.92 > 0.05

print()
#귀무: 평균키가 167이다
#대립: 167이 아니다.
result2 = stats.ttest_1samp(one_sample,popmean=167)
print(result2) #귀무기각 pvalue=0.009 < 0.05

#평균이 0이다. 아니다
np.random.seed(123)
mu = 0
n = 10
x = stats.norm(mu).rvs(n)
print(x, np.average(x))
#[-1.0856306   0.99734545  0.2829785  -1.50629471 -0.57860025  1.65143654 -2.42667924 -0.42891263  1.26593626 -0.8667404 ] 
#-0.26951611032632805
'''
sns.distplot(x, kde=False, rug=True, fit=stats.norm)
plt.show()
'''

result3 = stats.ttest_1samp(x, popmean = 0)
print(result3)
#귀무 채택 pvalue=0.52 > 0.05

result4 = stats.ttest_1samp(x, popmean = 0.7)
print(result4)
#귀무기각 pvalue=0.04 < 0.05

print('~~~~'*20)
#실습 예제3) a중학교 1학년 1반 학생들의 시험결과가 담긴 파일을 읽어 처리
data = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/student.csv')
print(data.head(2))
print(data.describe())
print(np.mean(data.국어))
#귀무: 학생들의 국어평균은 80이다.
#대립: 국어평균은 80이 아니다.
result5 = stats.ttest_1samp(data['국어'], popmean = 80)
print(result5)
#귀무채택 pvalue=0.198>0.05

result6 = stats.ttest_1samp(data['국어'], popmean = 60)
print(result6)
#귀무기각 pvalue=0.025 <0.05

print()
#실습예제 4)여아신생아 평균몸무게 2800g이다. 아니다.

babydata = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/babyboom.csv')
print(babydata.head(2))
fdata = babydata[babydata.gender == 1] #여아만 추출
print(fdata.head(3))
print(np.mean(fdata.weight), ' ', np.std(fdata.weight))
#3132.4444444444443   613.7878951616051
result7 = stats.ttest_1samp(fdata['weight'], popmean = 2800)
print(result7)
#귀무기각 pvalue=0.039 < 0.05

print(stats.shapiro(fdata.weight))
print(stats.shapiro(fdata.iloc[:,2])) #p가 0.05보다 크면 정규성 만족
#정규성 만족x




