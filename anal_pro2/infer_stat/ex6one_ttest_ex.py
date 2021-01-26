'''
Created on 2020. 11. 20.

@author: Heun94
'''
import numpy as np
import scipy.stats as stats
import pandas as pd

#기존 백열전구의 수명 250시간 , 새로운 백열전구의 수명 300시간
#귀무: 수명 300아니다.
#대립: 수명 300이다.
bdata = [305, 280, 296, 313, 287, 240, 259, 266, 318, 280, 325, 295, 315, 278]
result1 = stats.ttest_1samp(bdata, popmean = 300)
print(result1)
#귀무 채택 pvalue=0.143 > 0.05

#주어진 자료 내에서 150대 랜덤 뽑아
#귀무 : 모평균과 a회사 노트북 평균은 차이가 없다.
#대립 : 차이가 있다.
ndata=data = pd.read_csv('https://raw.githubusercontent.com/pykwon/python/master/testdata_utf8/one_sample.csv')
np.random.seed(123)
mu=0
n=150
