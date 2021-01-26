from sklearn import tree
import pydotplus
import graphviz
import collections


x = [[180,15], [177,42], [156,35], [174,5], [166,44]]
y = ['man', 'woman', 'woman', 'man', 'woman']
label_names = ['height', 'hair length']

#model
model = tree.DecisionTreeClassifier(criterion = 'entropy', max_depth=3, random_state=0)
#entropy: 데이터 집합에 종류가 다른 것들이 많이 섞여있으면 높은 수치로 나온다. 혼잡도 파악하기
#의사결정나무는 entropy가 높은 상태에서 낮은 상태가 되도록 특정 조건을 찾아 이항분류 형태로 구분해 나간다.

print(model)

model.fit(x,y)
print('훈련 정확도: {:.3f}'.format(model.score(x,y)))

pred = model.predict(x)
print(pred)

#시각화
dot_data = tree.export_graphviz(model, feature_names = label_names, \
                                out_file = None, filled = True, rounded = True)
graph = pydotplus.graph_from_dot_data(dot_data)
colors = {'red', 'orange'}
edges = collections.defaultdict(list) #list type 변수 준비

for e in graph.get_edge_list():
    edges[e.get_source()].append(int(e.get_destination()))
 
for e in edges:
    edges[e].sort()
    for i in range(2):
        dest = graph.get_node(str(edges[e][i]))[0]
        #dest.set_fillcolor(colors[i])

graph.write_png('ex10tree.png')   

#이미지 읽기
from matplotlib.pyplot import imread
import matplotlib.pyplot as plt

img = imread('ex10tree.png')
plt.imshow(img)
plt.show()