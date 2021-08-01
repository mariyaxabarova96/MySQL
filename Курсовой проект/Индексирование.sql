USE Starbucks;

-- Индексы для покупателей
CREATE INDEX buyers_first_name_last_name_idx ON buyers(first_name, last_name);

--  Индексы для работников 
CREATE INDEX employees_first_name_last_name_idx ON employee_profiles(first_name, last_name);
