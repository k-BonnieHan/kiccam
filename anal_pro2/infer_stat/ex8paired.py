'''
서로 대응인 두 집단의 평균차이 검정
조건: 정규성 만족, 등분산성은 검정x

'''
#실습1) 정규분포를 따르는 난수 데이터
import numpy as np
import scipy as sp
import scipy.stats as stats

np.random.seed(1)
x1 = np.random.normal(80, 10, 100)
x2 = np.random.normal(77, 10, 100)
print(x1[:5])
print(stats.shapiro(x1).pvalue)
print(x2[:5])
print(stats.shapiro(x2).pvalue)
#0.82154381275177 / 0.5715901851654053 이므로 정규성 만족

#귀무: 특강 전후의 시험점수에 차이가 없다
#대립: 특강 전후의 시험점수에 차이가 있다.
print(stats.ttest_rel(x1, x2))
#귀무 채택. pvalue=0.09 > 0.05

print('-------------------------------------\n')
#실습2) 9명의 환자에 대해 복부 수술 전 몸무게와 수술 후 몸무가게 변화가 있는지 검증하시오.
baseline = [67.2, 67.4, 71.5, 77.6, 86.0, 89.1, 59.5, 81.9, 105.5]
follow_up = [62.4, 64.6, 70.4, 62.6, 80.1, 73.2, 58.2, 71.0, 101.0]
print('수술전 몸무게 평균: ', np.mean(baseline))
print('수술후 몸무게 평균: ', np.mean(follow_up))
print(stats.ttest_rel(baseline, follow_up))
#귀무기각 pvalue=0.006 < 0.05

print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n')
#집단에 따라 t검정 방법은 달라질 수 있다.
#수면제 종류에 따라 수면시간 변화가 있는지 검정하기
x1 = np.array([0.7, 0.3, 0.2, 0.2, 0.1]) #수면제 1 복용시
x2 = np.array([1.3, 1.0, 0.3, 0.1, 0.5]) #수면제2 복용시
print(np.mean(x1))
print(np.mean(x2))

#실습1) 서로 다른 사람이 수면제를 먹었을때, 독립표본 t검정
result1 = stats.ttest_ind(x1, x2, equal_var = True)
print(result1.pvalue)
if result1.pvalue >= 0.05 :
    print('약의 변경여부는 수면시간에 영향이 없다.')
else:
    print('약의 변경여부가 수면시간에 영향을 준다.')
    
#실습2) 동일인이 수면제를 먹었을떄, 대응표본T검정
result2 = stats.ttest_rel(x1,x2)
if result2.pvalue >= 0.05:
    print('약의 변경여부는 수면시간에 영향이 없다.')
else:
    print('약의 변경여부가 수면시간에 영향을 준다.')    
