--Задание 1: DML
--● Цель: Практика базовой вставки, выборки, простого обновления и удаления
--данных.
--● Действия:
--1. Вставить двух новых сотрудников в таблицу Employees.
--2. Выбрать всех сотрудников из таблицы Employees.
--3. Выбрать только FirstName и LastName сотрудников из отдела 'IT'.
--4. Обновить Salary 'Alice Smith' до 65000.00.
--5. Удалить сотрудника, чья LastName — 'Prince'.
--6. Проверить все изменения, используя SELECT * FROM Employees;.

BEGIN ;

-- 1. Проверка данных
  SELECT * FROM Employees ORDER BY EmployeeID

--2.точка сохранения перед Вставить двух новых сотрудников в таблицу Employees.
  SAVEPOINT before_add_new_employees; 
  
-- 3. Вставка новых сотрудников
  INSERT INTO Employees (FirstName, LastName,Department,Salary)
  VALUES ('John', 'Doe', 'IT', 82000.00),
        ('David', 'Robinson', 'IT', 76000.00);

-- 4. Проверка вставленных данных
  SELECT * FROM Employees;

-- 5. Точка сохранения после добавления
  SAVEPOINT add_new_employees;

-- 6. Выбор IT-сотрудников 
  SELECT 
        FirstName,
         LastName 
  FROM Employees
  WHERE Department = 'IT';

-- 7. Обновление зарплаты Alice Smith
  UPDATE Employees 
  SET Salary = 65000.00 
  WHERE FirstName = 'Alice' AND LastName = 'Smith';

-- 8. Проверка обновления
 SELECT * FROM Employees;

-- 9. Точка сохранения после обновления
  SAVEPOINT update_salary_for_employee;

 -- 10. Проверка наличия сотрудника Prince
  SELECT * FROM Employees WHERE LastName = 'Prince';

-- 11. Удалить записи о сотруднике в таблице EmployeeProjects
  DELETE FROM EmployeeProjects 
  WHERE EmployeeID = (SELECT EmployeeID FROM Employees WHERE LastName = 'Prince');

-- 12. Удаление сотрудника Prince 
  DELETE FROM Employees WHERE LastName = 'Prince';

-- 13. Проверка  таблицы Employees после удаления
  SELECT * FROM Employees ORDER BY EmployeeID; 

-- 14. Точка сохранения после удаления
  SAVEPOINT removing_employee;

COMMIT;




