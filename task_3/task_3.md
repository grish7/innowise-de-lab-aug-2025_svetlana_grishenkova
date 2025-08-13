Часть 1: WHERE 
Задача 1 Найдите всех клиентов из страны 'USA', которым больше 25 лет.
```sql
SELECT 
       * 
FROM 
       Customers 
WHERE 
       age > 25 
AND 
       country ='USA';
```
![result](screenshots/result_WHERE_task_1.png)

Задача 2 Выведите все заказы, у которых сумма (amount) больше 1000.
```sql
SELECT 
       * 
FROM 
       Orders
WHERE
       amount > 1000;
```

 ![result](screenshots/result_WHERE_task_2.png)

Часть 2: JOIN 
Задача 1 Получите список заказов вместе с именем клиента, который сделал заказ.
```sql
SELECT 
       Customers.first_name, 
       Customers.last_name, 
       Orders.item, 
       Orders.amount  
FROM 
       Customers
JOIN 
       Orders
ON 
       Customers.customer_id = Orders.customer_id
```
![result](screenshots/result_JOIN_task_1.png)
 

Задача 2 Выведите список доставок со статусом и именем клиента.
```sql
SELECT 
       Shippings.status,
       Customers.first_name , 
       Customers.last_name  
FROM 
       Shippings
JOIN
       Customers
ON 
       Shippings.customer = Customers.customer_id
```
![result](screenshots/result_JOIN_task_2.png)
 

Часть 3: GROUP BY 
Задача 1 Подсчитайте количество клиентов в каждой стране.
```sql
SELECT 
       country,  
       COUNT(*) AS customer_count
FROM 
       Customers
GROUP BY
       country
ORDER BY 
       country DESC
```
![result](screenshots/result_GROUP_BY_task_1.png)
 

Задача 2 Посчитайте общее количество заказов и среднюю сумму по каждому товару.
```sql
SELECT 
       item,
       COUNT(*) AS total_orders,
       AVG(amount) AS average_amount
FROM 
       Orders
GROUP BY
       item
ORDER BY 
       average_amount  DESC
```
 ![result](screenshots/result_GROUP_BY_task_2.png)
 

Часть 4: ORDER BY
 Задача 1 Выведите список клиентов, отсортированный по возрасту по убыванию.
```sql
SELECT 
       first_name,
       age
FROM 
       Customers
ORDER BY 
       age  DESC    
```
 ![result](screenshots/result_ORDER_BY_task_1.png)

Часть 5: SUBQUERIES
 Задача 1 Найдите всех клиентов, которые сделали заказ с максимальной суммой.
```sql
SELECT 
      Customers.first_name,
      Customers.last_name, 
      Orders.amount    
FROM  
      Customers
JOIN
       Orders 
ON   
      Customers.customer_id = Orders.customer_id
WHERE 
      orders.amount = (
                       SELECT 
                             MAX(amount) 
                       FROM 
                             Orders
                       )
```
![result](screenshots/result_SUBQUERIES_task_1.png)

 

Часть 6: WINDOW FUNCTIONS
 Задача 1 Для каждого заказа добавьте колонку с суммой всех заказов этого клиента (используя оконную функцию).
```sql
SELECT 
       order_id,
       customer_id,
       item,
       amount,
       SUM(amount)OVER(PARTITION BY customer_id) AS total_by_customer
FROM 
       Orders
ORDER BY 
       order_id 
```
![result](screenshots/result_WINDOW_FUNCTIONS_task_1.png)

 


Часть 7 (Опционально) 
Найдите клиентов, которые:
 1. Сделали хотя бы 2 заказа (любых), 
2. Имеют хотя бы одну доставку со статусом 'Delivered'. 
Для каждого такого клиента выведите: 
● full_name (имя + фамилия),
 ● общее количество заказов, 
● общую сумму заказов, 
● страну проживания.

```sql
SELECT 
       CONCAT(Customers.first_name, ' ', Customers.last_name) AS full_name,
       Customers.country,
       COUNT(Orders.order_id) AS total_orders,
       SUM(Orders.amount) AS total_amount
FROM 
       Customers
JOIN 
       Orders 
ON 
       Customers.customer_id = Orders.customer_id
JOIN 
       Shippings
ON 
       Shippings.customer = Customers.customer_id
WHERE 
       Shippings.status = 'Delivered'
GROUP BY 
       Customers.customer_id
HAVING  
       COUNT(order_id)  >= 2
```

 
![result](screenshots/result_the_last_task.png)