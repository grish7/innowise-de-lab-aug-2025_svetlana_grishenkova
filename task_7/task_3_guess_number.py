# -*- coding: utf-8 -*-

import random


# Генерируем случайное число от 1 до 10
unknown_number = random.randint(1, 10)

guessed = False  # Флаг для отслеживания состояния 

count = 0  # Счетчик попыток

print("Try to guess the number from 1 to 10!")

# Цикл while выполняется, пока число пользователя не равно загаданному
while not guessed:   
    try:     
        count += 1   
        user_number = int(input(f"Attempt {count}: "))    
        
        if user_number == unknown_number:
            guessed = True  # Меняем флаг на True
            print(f"Awesome! You guessed in {count} attempts!")
        else:
            print("Incorrect!", end = " ")
            if user_number < unknown_number:
                print("Go up!")                
            else:
                print("Go down!")
    
    except ValueError:  # Обработка ошибки, если введено не число
        print("Error! Please enter an integer.") 
        count -= 1    # Не засчитываем эту попытку   