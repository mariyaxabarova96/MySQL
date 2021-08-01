use starbucks;


DELIMITER //
CREATE TRIGGER validate_buyers_first_name_last_name_insert BEFORE INSERT ON buyers
FOR EACH ROW BEGIN
  IF NEW.first_name IS NULL AND NEW.last_name IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both fist name and last name are NULL';
  END IF;
END//

CREATE TRIGGER validate_employees_first_name_last_name_insert BEFORE INSERT ON employee_profiles
FOR EACH ROW BEGIN
  IF NEW.first_name IS NULL AND NEW.last_name IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both fist name and last name are NULL';
  END IF;
END//

CREATE TRIGGER validate_cards_bonus_card_number BEFORE INSERT ON bonus_cards
FOR EACH ROW BEGIN
  IF NEW.bonus_card_number IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Bonus_card_number is NULL';
  END IF;
END//


-- Хранимые процедуры

DROP FUNCTION IF EXISTS is_user_by_id_exists;
DELIMITER //

CREATE FUNCTION is_user_by_id_exists (buyer_id INT)
RETURNS BOOLEAN READS SQL DATA
BEGIN
  RETURN EXISTS(SELECT 1 FROM Starbucks.buyers WHERE id = buyer_id);
END//


DELIMITER ;


DROP PROCEDURE IF EXISTS get_employee_profile_by_employee_id;
DELIMITER //
CREATE PROCEDURE get_employee_profile_by_employee_id(id INT)
BEGIN
	SELECT * FROM Starbucks.employee_profiles AS profile WHERE profile.id = id;
END //
DELIMITER ;


