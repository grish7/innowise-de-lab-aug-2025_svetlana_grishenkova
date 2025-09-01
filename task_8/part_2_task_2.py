# -*- coding: utf-8 -*-


# Упражнение 2: Функции с параметрами
# Дан повторяющийся код расчёта цены с НДС:
# prices = [1000, 3499, 250]
# nds = 0.20
# print(prices[0] + prices[0] * nds)
# print(prices[1] + prices[1] * nds)
# print(prices[2] + prices[2] * nds)
#
# Задание:
# 1) Вынесите расчёт в функцию add_vat().
# 2) Примените её ко всем элементам списка в цикле и распечатайте
# итоговые цены, используйте цикл.

prices = [1000, 3499, 250]

def add_vat(prices, nds):
    result = []
    # Перебираем все цены
    for price in prices:
        # Рассчитываем цену с НДС
        result.append(price + price * nds)
        
    for nds_price in result:
        # Выводим без дробной части
        print(f"NDS price => {nds_price:.0f}")
        
    return result
    

nds = 0.20
# Вызываем функцию
add_vat(prices, nds)




