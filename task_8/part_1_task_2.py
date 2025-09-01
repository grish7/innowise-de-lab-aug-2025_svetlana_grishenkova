# -*- coding: utf-8 -*-

# Часть 1: Строки, Списки, Словари

# Упражнение 2: Методы строк и форматинг
# Дано: email = " USER@DOMAIN.COM "
# 1. Очистить и отформатировать до вида: "user@domain.com"
# 2. Разделить на имя пользователя и домен
# 3. Используя f-строку, создать: "Username: user, Domain:
# domain.com"

email = " USER@DOMAIN.COM "

# 1. Очистить и отформатировать до вида: "user@domain.com"
normalized_email = email.strip().lower()
print(normalized_email)

# 2. Разделить на имя пользователя и домен
new_list = normalized_email.split("@")
user_name = new_list[0]
domain = new_list[-1]
print(f"result after split: {new_list}")

# 3. Используя f-строку, создать: "Username: user, Domain:
# domain.com"
print(f"Username: {user_name}, Domain: {domain}")



