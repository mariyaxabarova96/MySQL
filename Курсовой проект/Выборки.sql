USE Starbucks;

-- Простые выборки

SELECT coffee_id FROM Starbucks.production WHERE id = (SELECT name_of_coffee FROM Starbucks.coffee  WHERE name_of_coffee = 'Латте');

SELECT first_name, 
	   last_name,
	   (SELECT bonus_card_number FROM bonus_cards WHERE id = 4) as bonus_card_number 
FROM Starbucks.buyers 
WHERE id = 3
GROUP BY id;


-- с использованием присоединения 
SELECT
  p.id,
  p.age,
  p.phone,
  p.role_at_work,
  CONCAT(p.first_name, ' ', p.last_name) AS name,
  p.photo,
  p.vacation_days,
  u.employee_password
  FROM Starbucks.employee AS u 
   JOIN Starbucks.employee_profiles AS p
    ON u.id = p.employee_id ;
   
   

