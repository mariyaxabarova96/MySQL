

DROP DATABASE IF EXISTS Starbucks;
CREATE DATABASE Starbucks;
USE Starbucks;

-- Основные таблицы, связанные с покупателем 


DROP TABLE IF EXISTS bonus_cards;
CREATE TABLE bonus_cards(
id SERIAL PRIMARY KEY,
bonus_card_number CHAR(10) NOT NULL,
created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS buyers;
CREATE TABLE buyers(
id SERIAL PRIMARY KEY,
first_name VARCHAR(200) NOT NULL,
last_name VARCHAR(200) NOT NULL,
email VARCHAR(70) NOT NULL,
phone char(11) NOT NULL,
bonus_card_number BIGINT UNSIGNED,
password_hash char(30) NOT NULL,
UNIQUE KEY `email_idx` (`email`),
UNIQUE KEY `phone_idx` (`phone`),
CONSTRAINT `phone_check` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$')),

FOREIGN KEY (bonus_card_number) REFERENCES bonus_cards(id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);



-- Основные таблицы, связанные с работниками 


DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
id SERIAL PRIMARY KEY,
start_work_at TIMESTAMP DEFAULT NOW(),
end_work_at TIMESTAMP DEFAULT NOW(), 
employee_password VARCHAR(50)
);

DROP TABLE IF EXISTS employee_photo;
CREATE TABLE employee_photo(
id SERIAL PRIMARY KEY,
file_name VARCHAR(200) NOT NULL,
path VARCHAR(200) NOT NULL
);

DROP TABLE IF EXISTS vacation_days;
CREATE TABLE vacation_days(
id SERIAL PRIMARY KEY,
vacation_days INT NOT NULL
);


DROP TABLE IF EXISTS cash_mashine;
CREATE TABLE cash_mashine(
id SERIAL PRIMARY KEY,
mashine_number BIGINT UNSIGNED,
employee_id BIGINT UNSIGNED,

FOREIGN KEY (mashine_number) REFERENCES employee(id)
ON DELETE RESTRICT
ON UPDATE CASCADE
);



DROP TABLE IF EXISTS employee_profiles;
CREATE TABLE employee_profiles(
id SERIAL PRIMARY KEY, 
employee_id BIGINT UNSIGNED,
first_name VARCHAR(200) NOT NULL,
last_name VARCHAR(200) NOT NULL,
age INT NOT NULL,
phone BIGINT UNSIGNED UNIQUE,
role_at_work VARCHAR(200),
photo BIGINT UNSIGNED DEFAULT 1,
vacation_days BIGINT UNSIGNED,

INDEX employee_name_idx (first_name, last_name),

FOREIGN KEY (photo) REFERENCES employee_photo(id)
ON DELETE SET NULL 
ON UPDATE CASCADE,

FOREIGN KEY (employee_id) REFERENCES employee(id)
ON DELETE RESTRICT
ON UPDATE CASCADE,

FOREIGN KEY (vacation_days) REFERENCES vacation_days(id)
);

-- Основные таблицы, связанные с кофейней




DROP TABLE IF EXISTS production;
CREATE TABLE production (
id SERIAL PRIMARY KEY,
drinks_id BIGINT UNSIGNED,
food_id BIGINT UNSIGNED,
deserts_id BIGINT UNSIGNED,
coffee_id BIGINT UNSIGNED
);

-- добавление внешних ключей

ALTER TABLE production ADD CONSTRAINT from_drinks_id_to_drinks_table FOREIGN KEY (drinks_id) REFERENCES drinks(id) 
ON DELETE CASCADE;

ALTER TABLE production ADD CONSTRAINT from_food_id_to_food_table FOREIGN KEY (food_id) REFERENCES food(id) 
ON DELETE CASCADE;

ALTER TABLE production ADD CONSTRAINT from_deserts_id_to_desert_table FOREIGN KEY (deserts_id) REFERENCES desert(id) 
ON DELETE CASCADE;

ALTER TABLE production ADD CONSTRAINT from_coffee_id_to_coffee_table FOREIGN KEY (coffee_id) REFERENCES coffee(id) 
ON DELETE CASCADE;


DROP TABLE IF EXISTS coffee;
CREATE TABLE coffee(
id SERIAL PRIMARY KEY,
name_of_coffee VARCHAR(200),
created_at TIMESTAMP DEFAULT NOW()
);


DROP TABLE IF EXISTS drinks;
CREATE TABLE drinks(
id SERIAL PRIMARY KEY,
name_of_drink VARCHAR(200),
created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS food;
CREATE TABLE food(
id SERIAL PRIMARY KEY,
name_of_food VARCHAR(200),
created_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS desert;
CREATE TABLE desert(
id SERIAL PRIMARY KEY,
name_of_desert VARCHAR(200),
created_at TIMESTAMP DEFAULT NOW()
);


-- Таблица взаимодействия работника и покупателя 

DROP TABLE IF EXISTS visit_starbucks;
CREATE TABLE visit_starbucks(
id SERIAL PRIMARY KEY,
buyer_id BIGINT UNSIGNED,
employee_id BIGINT UNSIGNED,
production_id BIGINT UNSIGNED,
today_date TIMESTAMP DEFAULT NOW(),

FOREIGN KEY (buyer_id) REFERENCES buyers(id),
FOREIGN KEY (employee_id) REFERENCES employee(id),
FOREIGN KEY (production_id) REFERENCES production(id)
);













