--Задание 5: Функции и представления
--● Цель: Понять и создать простые SQL-функции и представления в PostgreSQL.
--● Действия:
--1. Функция: Создать функцию PostgreSQL с именем
--CalculateAnnualBonus, которая принимает employee_id и
--Salary в качестве входных данных и возвращает рассчитанную
--сумму бонуса (10 % от Salary) для этого сотрудника. Используйте
--PL/pgSQL для тела функции.
--2. Использовать эту функцию в операторе SELECT, чтобы увидеть
--потенциальный бонус для каждого сотрудника.
--3. Представление (View): Создать представление с именем
--IT_Department_View, которое показывает EmployeeID,
--FirstName, LastName и Salary только для сотрудников из отдела 'IT'.
--4. Выбрать данные из вашего представления IT_Department_View.



--1. Создать функцию CalculateAnnualBonus
CREATE OR REPLACE FUNCTION CalculateAnnualBonus (
employee_id  INTEGER, 
salary  DECIMAL(10,2)
)
RETURNS DECIMAL (10,2)
LANGUAGE plpgsql
AS $$
BEGIN
  RETURN salary * 0.10 ;
END;
$$;

--2. Использовать  функцию CalculateAnnualBonus в операторе SELECT
SELECT 
    EmployeeID,
    FirstName,
    Salary,
    CalculateAnnualBonus(EmployeeID, Salary) AS Bonus   
FROM Employees;


--3. Создать представление (View) IT_Department_View

CREATE VIEW IT_Department_View AS 
SELECT 
       EmployeeID, 
       FirstName,
       LastName, 
       Salary
FROM Employees
WHERE Department = 'IT'

--4.   Выбрать данные из представления IT_Department_View
SELECT 
       EmployeeID, 
       FirstName,
       LastName, 
       Salary
FROM 
       IT_Department_View
       




