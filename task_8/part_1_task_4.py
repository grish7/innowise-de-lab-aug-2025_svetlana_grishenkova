# -*- coding: utf-8 -*-

# Часть 1: Строки, Списки, Словари

# Упражнение 4: List comprehension и словари
# Дано: words = ["hello", "world", "python", "code"]
# 1. Создать список длин слов, используя списковое включение
# 2. Создать список слов длиннее 4 символов
# 3. Создать словарь: {слово: длина} для всех слов


words = ["hello", "world", "python", "code"]

#  Создать список длин слов, используя списковое включение

# length_list = []

# for i in words:
#     length_list.append(len(i))


length_list = [len(i) for i in words]

print(f"length words: {length_list}")    

#  Создать список слов длиннее 4 символов

# words_list = []

# for i in words:
#     if len(i) > 4:
#         words_list.append(i)
        

words_list = [i for i in words if len(i) > 4]

print(words_list)        


#  Создать словарь: {слово: длина} для всех слов

# new_dict = {}

# for i in words:
#     new_dict[i] = len(i)


new_dict = {i: len(i) for i in words}

print(new_dict)    


