-- 1. Какой ежемесячный доход приносят активные договоры аренды по типам недвижимости?

SELECT 
     p.type,
     -- Суммируем арендную плату
     SUM(f.monthly_rent) AS current_monthly_revenue
from
     fact_rental_agreements f
JOIN 
     dim_property p 
ON 
      f.property_sk = p.property_sk
      
-- Фильтруем только активные на текущую дату договоры
WHERE  
      CURRENT_DATE 
BETWEEN   
      f.contract_start_date 
AND 
      f.contract_end_date
GROUP BY 
       p.type
ORDER BY        
       current_monthly_revenue DESC;



-- 2. Какой средний срок аренды для недвижимости в этом году?


SELECT 
     d.year,
     p.type,
     -- Вычисляем среднюю длительность аренды в днях
     avg(f.contract_end_date - f.contract_start_date) AS average_period   
from
     fact_rental_agreements f
JOIN 
     dim_property p 
ON 
      f.property_sk = p.property_sk
JOIN 
     dim_date d 
ON 
     f.date_sk = d.date_sk
     
--Отфильтровываем только договоры, подписанные в текущем году
where 
     d.year = EXTRACT(YEAR FROM CURRENT_DATE) 
      
GROUP BY 
       p.type,
       d.year
ORDER BY 
       average_period  ;     



-- 3. Каково текущее количество активных договоров аренды?
      
        
 SELECT 
     p.type,
     -- Считаем количество договоров
     count(f.rental_sk) AS active_contracts_count
from
     fact_rental_agreements f
JOIN 
     dim_property p 
ON 
      f.property_sk = p.property_sk
      
-- Фильтруем только активные на текущую дату договоры
where 
     CURRENT_DATE between f.contract_start_date and f.contract_end_date
      
GROUP BY 
        p.type 
        
        
        
-- 4. Какое количество  договоров аренды было заключено в каждом месяце?

        
 SELECT 
     d.year,
     d.month_name,
     d.month_number,
     -- Количество подписанных договоров
     count(f.rental_sk) AS amount_contracts
from
     fact_rental_agreements f
JOIN 
     dim_date d
ON 
      f.date_sk = d.date_sk   
      
-- Группируем по году, номеру и названию месяца
GROUP BY 
      d.year,
      d.month_number,
      d.month_name
      
-- Сортируем по году и номеру месяца
order by 
      d.year  DESC,
      d.month_number  
        