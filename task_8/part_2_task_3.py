# -*- coding: utf-8 -*-


# Упражнение 3 (Опционально)
# ● Создайте функцию calculate_average_score(), которая будет вычислять
# средний балл.
# ● Функция должна принимать список оценок scores как обязательный аргумент.
# ● Добавьте опциональный булевый параметр ignore_lowest со значением по
# умолчанию False.
# ● Если ignore_lowest равен True, функция должна отбросить наименьшую оценку
# перед вычислением среднего. Если в списке всего одна оценка, отбрасывать её не
# нужно.
# ● Используя цикл, пройдитесь по списку student_data. 2 раза, первый раз
# учитывая все оценки, а второй раз отбросив худшие оценки

student_data = [
    {'name': 'Алексей', 'scores': [85, 92, 78, 95]},
    {'name': 'Марина', 'scores': [65, 70, 58, 82]},
    {'name': 'Светлана', 'scores': [98, 95, 100]}
]

def calculate_average_score(scores, ignore_lowest=False):
        
    if ignore_lowest and len(scores) > 1:
        # Создаем копию 
        copy_scores = scores.copy()
        # Находим min оценку
        min_score = min(copy_scores)
        # Удаляем min оценку из копии
        copy_scores.remove(min_score)
        # Вычисляем среднее 
        average = sum(copy_scores) / len(copy_scores)
        # Выводим min оценку
        print(f"ignore a worse score: {min_score}")
    else: 
        # Вычисляем среднее  (все оценки)
        average = sum(scores) / len(scores)
        
    return  average


# Список для хранения оценок
list_scores = []

for i in student_data:
    # Получаем имя студента
    student_name = i["name"]
    # Получаем список оценок 
    list_scores = i["scores"]
    # Вычисляем среднее (ignore_lowest=False)
    avg = calculate_average_score(list_scores)
    print(f"{student_name}: {list_scores} => avg: {avg:.1f}")
    # Вычисляем среднее  (ignore_lowest=True)
    second_avg = calculate_average_score(list_scores, ignore_lowest=True)    
    print(f"{student_name}: {list_scores} => avg without a worse score: {second_avg:.1f}")
    # Пустая строка 
    print()
    
    
