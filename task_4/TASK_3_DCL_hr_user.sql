--1.Проверка текущих данных в таблице Employees
SELECT * FROM Employees;

-- 2. Попытка вставки нового сотрудника  (ОШИБКА)
  INSERT INTO Employees (FirstName, LastName,Department,Salary,Email)
  VALUES ('Betty', 'Doe', 'IT', 62000.00,'betty@gmail.com') 
  
  -- 3. Повторная попытка вставки нового сотрудника (СРАБОТАЛО)
  INSERT INTO Employees (FirstName, LastName,Department,Salary,Email)
  VALUES ('Betty', 'Doe', 'IT', 62000.00,'betty@gmail.com') 
  
  --4. Проверка
  SELECT * FROM Employees;


result :
+------------+-----------+-----------+------------+---------+--------------------+
| EmployeeID | FirstName | LastName  | Department | Salary  |        Email       |
+------------+-----------+-----------+------------+---------+--------------------+
|          1 | Alice     |  Smith    |  HR        |   65000 |  alice@gmail.com   |
|          2 | Bob       |  Johnson  |  IT        |   75000 |  bob@gmail.com     |
|          3 | Charlie   |  Brown    | Finance    |   62000 |  charlie@gmail.com |
|          5 | Eve       |  Davis    |  HR        |   58000 |  eve@gmail.com     |
|          6 | John      |  Doe      |  IT        |   82000 |  john@gmail.com    |
|          7 | David     | Robinson  |  IT        |   76000 |  david@gmail.com   |
|          8 | Betty     |  Doe      |  IT        |   62000 |  betty@gmail.com   |
+------------+-----------+-----------+------------+---------+--------------------+

