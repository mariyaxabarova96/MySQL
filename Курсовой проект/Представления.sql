USE Starbucks;

   
CREATE OR REPLACE VIEW employee_profiles_info AS
SELECT e.id, e.age, e.role_at_work 
FROM Starbucks.employee_profiles e 
LEFT JOIN Starbucks.vacation_days as vd 
ON e.id = vd.id 
LEFT JOIN Starbucks.employee_photo as ph 
ON e.id = ph.id;

   
CREATE OR REPLACE VIEW productions AS
SELECT pr.coffee_id , pr.food_id , pr.drinks_id 
  FROM Starbucks.production pr
   LEFT JOIN Starbucks.coffee AS c
    ON pr.coffee_id = c.id
    LEFT JOIN Starbucks.food AS f
    ON pr.food_id = f.id
    LEFT JOIN Starbucks.drinks AS d
    ON pr.drinks_id = d.id;
    