# -*- coding: utf-8 -*-

# Часть 2: Функции и ООП
    
# Упражнение 1: Функции без параметров
#  Создайте функцию без параметров show_current_time() — печатает
# текущие дату и время (используйте модуль datetime).

from datetime import datetime


def show_current_time():
    # Создаем объект datetime
    now = datetime.now()
    return  now

# Вызываем функцию 
date_time = show_current_time()
print(date_time)



