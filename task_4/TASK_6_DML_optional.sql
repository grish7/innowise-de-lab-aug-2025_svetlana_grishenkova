--Задание 6: DML (Optional)
--● Цель: Объединение DML-операций с JOIN, подзапросами и условной логикой.
--● Действия:
--1. Найти ProjectName всех проектов, в которых 'Bob Johnson'
--работал более 150 часов.
--2. Увеличить Budget всех проектов на 10%, если к ним назначен хотя
--бы один сотрудник из отдела 'IT'.
--3. Для любого проекта, у которого еще нет EndDate (EndDate IS
--NULL), установить EndDate на один год позже его StartDate.
--4. Вставить нового сотрудника и немедленно назначить его на проект
--'Website Redesign' с 80 отработанными часами, все в рамках одной
--транзакции. Использовать предложение RETURNING


BEGIN
	
--1.поиск ProjectName для 'Bob Johnson'
	
  SELECT 
     p.ProjectName    
  FROM Projects p
  WHERE EXISTS  (
        SELECT 1
         FROM  Employeeprojects ep
         JOIN Employees e ON ep.EmployeeID = e.EmployeeID
         WHERE ep.ProjectId = p.ProjectID
         AND e.FirstName = 'Bob' AND e.LastName = 'Johnson'
         AND ep.HoursWorked > 150
          ) 

--2.точка сохранения перед обновлением бюджета
          
  SAVEPOINT before_update_Budget; 

--3.Увеличить Budget проектов на 10%, если к ним назначен IT-сотрудник

  UPDATE Projects p
  SET Budget = Budget * 1.10
  WHERE EXISTS (
        SELECT 1
        FROM  EmployeeProjects ep
        JOIN Employees e ON ep.EmployeeID = e.EmployeeID
        WHERE ep.ProjectID = p.ProjectID                 
        AND e.Department = 'IT'
)

--4. Смотрим, что получилось

 SELECT * FROM Projects 


--5.точка сохранения перед обновлением EndDate
 
 SAVEPOINT before_update_EndDate; 

-- 6. Установить EndDate для проектов без даты окончания

 UPDATE Projects
 SET    EndDate = (StartDate + INTERVAL '1 year')::DATE
 WHERE  EndDate IS NULL;


--7.точка сохранения перед Вставить нового сотрудника и назначить на проект

 SAVEPOINT before_add_new_employee; 

--8 Вставить нового сотрудника и назначить на проект

  WITH new_employee AS(
             INSERT INTO Employees (FirstName, LastName,Department,Salary)
             VALUES ('Tom', 'White', 'IT', 78000.00)
             RETURNING EmployeeID
  ),
    target_project AS (
              SELECT ProjectID 
              FROM Projects
              WHERE ProjectName = 'Website Redesign'
    )
  INSERT INTO EmployeeProjects (EmployeeID, ProjectID, HoursWorked)
  SELECT 
       n.EmployeeID, 
       t.ProjectID, 
       80
  FROM 
       new_employee n
  CROSS JOIN  
       target_project t
  RETURNING EmployeeID, ProjectID

  
COMMIT




