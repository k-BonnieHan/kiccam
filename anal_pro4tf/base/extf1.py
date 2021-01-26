'''
텐서플로우 기본 이해
'''
import tensorflow as tf
print('즉시 실행모드: ', tf.executing_eagerly())
print('GPU 사용 가능 여부: ', tf.config.list_physical_devices('GPU'))
print(tf.test.is_gpu_available())

import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2' #AVX를 지원하지 않아 에러발생할때 넘기기

print(1) #파이썬 상수
print(tf.constant(1))
print(tf.constant([1]))
print(tf.constant([[1]]))

print()
print(tf.rank(tf.constant([1])), ' ', tf.constant([1])._get_shape())

print()
a = tf.constant([1,2])
b = tf.constant([3,4])
c = a + b
print(c, type(c))
c = tf.add(a,b)
print(c, type(c))

print()
d = 3
e = c + d
print(e)

print()
print(7)
print(tf.convert_to_tensor(7))
print(tf.convert_to_tensor(7, dtype = tf.float32))

print('numpy의 ndarray와 tensor 사이의 type 변환')
import numpy as np
arr = np.array([1, 2])
print(arr, ' ', type(arr))

tfarr = tf.add(arr, 5)
print(tfarr)
print(tfarr.numpy())
print(np.add(tfarr, 3))
