--Задание 4: DML/DCL
--● Цель: Практика более сложных DML-операций с использованием
--предложений WHERE, множественных обновлений
--● Действия:
--1. Увеличить Salary всех сотрудников в отделе 'HR' на 10%.
--2. Обновить Department любого сотрудника с Salary выше 70000.00 на 'Senior IT'.
--3. Удалить всех сотрудников, которые не назначены ни на один проект в
--таблице EmployeeProjects. Подсказка: Используйте подзапрос NOT EXISTS или LEFT JOIN
--4. Вставить новый проект и назначить на него двух существующих
--сотрудников с определенным количеством HoursWorked в
--EmployeeProjects, и все это в одном блоке BEGIN/COMMIT.

BEGIN; 

--1. Проверка текущих данных HR-сотрудников
SELECT * FROM Employees WHERE Department = 'HR';

--2. Повышение зарплаты HR на 10%
UPDATE employees 
SET Salary = Salary + (Salary * 0.10)
WHERE Department = 'HR';
	
--3. Проверка обновленных данных HR
SELECT * FROM Employees WHERE Department = 'HR';

--4. Проверка  зарплаты сотрудника > 70000.00
SELECT * FROM Employees  WHERE Salary > 70000.00 ;

--5. Обновление Department для сотрудников с Salary выше 70000.00
UPDATE Employees
SET Department = 'Senior IT'
WHERE Salary > 70000.00;

--6. Проверка всех сотрудников
SELECT * FROM Employees

--7. Проверка таблицы проектов
SELECT * FROM EmployeeProjects ;

-- 8. Точка сохранения перед удалением
SAVEPOINT before_removing_employees;

--9. удаление сотрудников без проектов
DELETE FROM Employees e
WHERE NOT EXISTS (
                SELECT 1 
                FROM EmployeeProjects ep 
                WHERE ep.EmployeeID = e.EmployeeID 
                );

--10.точка сохранения после удаления 
SAVEPOINT after_removing_employees;

--11.Проверяем результаты удаления
SELECT * FROM Employees ORDER BY EmployeeID

--12. Вставка нового проекта
INSERT INTO Projects(ProjectName,Budget,StartDate,EndDate)
VALUES ('New CRM-system development',120000.00,'2023-07-05','2023-11-27');

--13. Проверка добавления проекта
SELECT * FROM Projects

--14.  Назначаем сотрудников на новый проект  !!!!!!!!!!   без хардкода

INSERT INTO EmployeeProjects(EmployeeID,ProjectID,HoursWorked)
SELECT 
      e.EmployeeID,
      p.ProjectID,
      CASE 
       	   WHEN e.FirstName = 'Alice' THEN 180
       	   WHEN e.FirstName = 'Bob' THEN 160
      end AS HoursWorked       
FROM  Projects p
CROSS JOIN Employees e
WHERE LOWER( p.ProjectName) = LOWER('New CRM-system development')
  AND (e.FirstName, e.LastName) 
  IN (
      ('Alice', 'Smith'),
      ('Bob', 'Johnson')
  )

--15. Проверяем результаты добавления
SELECT * FROM EmployeeProjects ORDER BY EmployeeID

COMMIT;













