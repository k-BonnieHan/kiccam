#실스비 교육수준과 흡연율 간의 관련성 분석: smoke.csv

import pandas as pd
import scipy.stats as stats

data = pd.read_csv('github에 smoke 가져오기')
print(data.head(3))
print(data['education'].unique())
print(data['smoking'].unique())

#귀무:교육수준과 흡연율 간에 관련이 없다.(독립이다_)
#대립: 교육수준과 흡연율 간에 관련이 있다.(독립이 아니다)

#ctab = pd.crosstab(index = data['education'], columns = data['smoking'], normalize = True) #빈도수의 비율

ctab = pd.crosstab(index = data['education'], columns = data['smoking'])
#빈도수,ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ
ctab.index=['대학원졸', '대졸', '중졸']
ctab.columns=['과흡연','보통','비흡연']
print(ctab)

#수식을 사용할 수 있으나 제공되는 메소드를 이용
chi_result = [ctab.loc['대학원졸'],ctab.loc['대졸'],ctab.loc['고졸']]
chi2, p, ddof, expected = stats.chi2_contingency(chi_result)
msg = 'chi2: {}, p-value: {}, df: {}'
print(msg.format(chi2, p, ddof))
print('expected: ', expected)

#실습) 국가전체와 지역에 대한 인종 간 인원수로 독립성 검정 실습
# 두 집단의 인종간 인원수의 분포가 관련이 있는가?
national = pd.DataFrame(['white']*100000 + ['hispanic'] * 60000 + \
            ['black'] * 50000 + ['asian'] * 15000 + ['other']*35000)
la = pd.DataFrame(['white']*600 + ['hispanic'] * 300 + \
            ['black'] * 250 + ['asian'] * 75 + ['other']*150)
print(national)
print(la)
na_table = pd.crosstab(index = national[0], columns='count')
la_table = pd.crosstab(index = la[0], columns = 'count')
na_table['count_la'] = la_table['count']
print(na_table)

chi2, p, df, _ = stats.chi2_contingency(na_table)
print(chi2, p, df)
#p가 0.05보다 작으므로 귀무가설 기각. 부ㄴㄴ포가 관려닝 있다.
