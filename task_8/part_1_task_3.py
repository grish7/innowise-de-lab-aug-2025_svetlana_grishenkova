# -*- coding: utf-8 -*-


# Часть 1: Строки, Списки, Словари

# Упражнение 3: Методы списка
# Исходный список: fruits = ["apple", "banana"]
# Выполните следующие операции по порядку:
# 1. Добавьте "orange" в конец списка
# 2. Вставьте "grape" по индексу 1
# 3. Удалите "banana"
# 4. Отсортируйте список
# 5. Переверните список
# Выводите список на печать после каждого шага

fruits = ["apple", "banana"]

#  Добавьте "orange" в конец списка
fruits.append("orange")
print(f"Added 'orange': {fruits}")

#  Вставьте "grape" по индексу 1
fruits.insert(1,"grape")
print(f"Inserted 'grape': {fruits}")

#  Удалите "banana"
fruits.remove("banana")
print(f"deleted 'banana': {fruits}")

#  Отсортируйте список
fruits.sort()
print(f"Sorted list: {fruits}")

#  Переверните список
fruits.reverse()
print(f"Reversed list: {fruits}")


