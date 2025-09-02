# -*- coding: utf-8 -*-

  
# Часть 1: Строки, Списки, Словари

# Упражнения 5 (Опционально):
# ● Дан список чисел nums и целевое число target. Найти индексы двух чисел, сумма
# которых равна target.
# Пример:
# nums = [2, 7, 11, 15]
# target = 9
# Ответ: [0, 1] (потому что nums[0] + nums[1] = 2 + 7 = 9)
# nums = [3, 2, 4]
# target = 6
# Ответ: [1, 2] (потому что nums[1] + nums[2] = 2 + 4 = 6)

import random

my_nums = []

# Генерируем список чисел 
for i in range(10):
    number = random.randint(1, 15)
    my_nums.append(number)
print(my_nums)
    
# Генерируем целевое число target  
target = random.randint(2,20)
print(f"target: {target}")

# Перебираем все элементы списка по индексам
for i in range(len(my_nums)):
    # Перебираем элементы, начиная со следующего после i
    for j in range(i + 1, len(my_nums)):
         # Проверяем
        if my_nums[i] + my_nums[j] == target:
            print(f"answer: {my_nums[i]} + {my_nums[j]} = {target}")
            print(f"indexes: [{i}, {j}]")
     
     
     
