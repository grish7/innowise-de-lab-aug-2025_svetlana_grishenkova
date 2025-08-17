--Задание 2: DDL
--● Цель: Практика создания и изменения структуры таблиц.
--● Действия:
--1. Создать новую таблицу с именем Departments со столбцами:
--DepartmentID (SERIAL PRIMARY KEY), DepartmentName
--(VARCHAR(50), UNIQUE, NOT NULL), Location (VARCHAR(50)).
--2. Изменить таблицу Employees, добавив новый столбец с именем
--Email (VARCHAR(100)).
--3. Добавить ограничение UNIQUE к столбцу Email в таблице
--Employees, предварительно заполнив любыми значениями
--4. Переименовать столбец Location в таблице Departments в
--OfficeLocation.


BEGIN ;

--1. Создание новой таблицы Departments
CREATE TABLE Departments (
DepartmentID SERIAL PRIMARY KEY,
DepartmentName VARCHAR(50)  UNIQUE NOT NULL,
Location VARCHAR(50)
    );

--2. Проверка созданной таблицы
SELECT * FROM Departments

--3. добаляется новый столбец с именем Email
ALTER TABLE Employees ADD COLUMN Email VARCHAR(100);

-- 4.Проверка
SELECT * FROM Employees ORDER BY EmployeeID;

--5. обновление данных используя условный оператор
UPDATE Employees
SET Email = CASE EmployeeID 
WHEN 1 THEN 'alice@gmail.com'
WHEN 2 THEN 'bob@gmail.com'
WHEN 3 THEN 'charlie@gmail.com'
WHEN 4 THEN 'diana@gmail.com'
WHEN 5 THEN 'eve@gmail.com'
WHEN 6 THEN 'john@gmail.com'
WHEN 7 THEN 'david@gmail.com'
END
WHERE EmployeeID BETWEEN 1 AND 7

-- 6.Проверка
SELECT * FROM Employees ORDER BY EmployeeID;

--7. Добавление ограничения UNIQUE к столбцу Email
ALTER TABLE Employees ADD CONSTRAINT uk_email UNIQUE (Email);

--8. Переименовать столбец Location
ALTER TABLE Departments RENAME COLUMN Location TO OfficeLocation;
-- 9.Проверка
SELECT * FROM Departments ;

COMMIT;