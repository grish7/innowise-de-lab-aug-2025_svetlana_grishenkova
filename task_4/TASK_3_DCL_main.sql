--Задание 3: DCL
--● Цель: Научиться создавать пользователей (роли в PostgreSQL) и
--предоставлять/отзывать базовые разрешения.
--● Действия:
--1. Создать нового пользователя PostgreSQL (роль) с именем hr_user и
--простым паролем.
--2. Предоставить hr_user право SELECT на таблицу Employees.
--3. Тест: В новой сессии подключиться как hr_user и попытаться
--выполнить SELECT * FROM Employees;. (Должно сработать).
--4. Как hr_user, попытаться выполнить INSERT нового сотрудника в
--Employees. (Должно завершиться неудачей).
--5. Как пользователь-администратор, предоставить hr_user права
--INSERT и UPDATE на таблицу Employees.
--6. Тест: Как hr_user, попробовать выполнить INSERT и UPDATE
--сотрудника. (Теперь должно сработать).





--1. Создаем нового пользователя
CREATE ROLE hr_user WITH PASSWORD '1234';

-- 2. Даём право SELECT на таблицу Employees
GRANT SELECT ON Employees TO hr_user;

--3. Проверяем, что роль создана
SELECT rolname FROM pg_roles WHERE rolname = 'hr_user';

-- 4. Даём доступ к схеме 
GRANT USAGE ON SCHEMA public TO hr_user;

--5. Даём право INSERT, UPDATE на таблицу Employees
GRANT INSERT, UPDATE ON Employees TO hr_user;

-- 6. Даём права на последовательность
GRANT USAGE, SELECT ON  SEQUENCE employees_employeeId_seq TO hr_user;








