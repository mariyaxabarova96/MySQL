-- Заполнение таблиц 

USE Starbucks;

--таблица бонусных карт

INSERT INTO bonus_cards (bonus_card_number)
	VALUES ('1234567890'), 
		   ('1234567899'), 
		   ('1234567898'), 
		   ('1234567789'), 
		   ('1234566789'), 
		   ('1234556789'), 
		   ('1234567800'), 
		   ('1123456789'), 
		   ('1223456789'), 
		   ('1234456789');
	
SELECT * FROM Starbucks.bonus_cards;


-- таблица покупателей

INSERT INTO Starbucks.buyers (first_name, last_name, email, phone, password_hash)
VALUES ('Иван', 'Иванов','ivanov@mail.ru', 89636095193 , 'abcfghjkrosdlknrpabfklbeojhf'),
	   ('Иван', 'Андрей','ivanova@mail.ru', 89636095198 , 'abcfghjkrosdlknrpabfklbeojhg'),
	   ('Петр', 'Лаврентьев','lavrentyev@mail.ru', 89636095191 , 'abcfghjkrosdlknrpabfklbeojhk'),
	   ('Светлана', 'Львова','lvova@mail.ru', 89636095197 , 'abcfghjkrosdlknrpabfklbeojhr'),
	   ('Мария', 'Петрова','petrova@mail.ru', 89636095196 , 'abcfghjkrosdlknrpabfklbeojhd'),
	   ('Геннадий', 'Иванов','ivanovgena@mail.ru', 89636095194 , 'abcfghjkrosdlknrpabfklbeааjl'),
	   ('Арсений', 'Кузнецов','kuznetsov@mail.ru', 89638095193 , 'abcfghjkrosdlknttabfklbeojhi'),
	   ('Ксения', 'Коробочкина','korobotchkina@mail.ru', 89636095190 , 'abcfghjkrosdlbnrpabfklbeojhs'),
	   ('Виталия', 'Моргенштерн','morgen@mail.ru', 89236095193 , 'ebcfghjkrosdlknrpabfklbeojhq'),
	   ('Марина', 'Иванова','ivanovas@mail.ru', 89636495193 , 'abcfghlkrosdlknrpabfklbeojhz');

SELECT * FROM Starbucks.buyers ;


INSERT INTO Starbucks.employee (employee_password)
VALUES ('12345'),
	   ('23456'),
	   ('abcdfg'),
	   ('6789040');
	  
SELECT * FROM Starbucks.employee;

INSERT INTO Starbucks.employee_photo (file_name, path)
VALUES ('Yurii', 'c:/my_computer/photo_1'),
	   ('Nadya', 'c:/my_computer/photo_2'),
	   ('Masha', 'c:/my_computer/photo_3'),
	   ('Sveta', 'c:/my_computer/photo_4'); 
SELECT * FROM Starbucks.employee_photo ;

INSERT INTO Starbucks.vacation_days (vacation_days)
VALUES (5),
	   (14),
	   (28),
	   (10); 
SELECT * FROM Starbucks.vacation_days;

INSERT INTO Starbucks.cash_mashine(employee_id)
VALUES (1), (2), (4), (3);
SELECT * FROM Starbucks.cash_mashine;

INSERT INTO Starbucks.employee_profiles (first_name, last_name, age, phone, role_at_work)
VALUES ('Инна', 'Горохова', 24, 89124829567, 'бариста'), 
	   ('Валерий', 'Пиотрович', 32, 89124829568, 'администратор'), 
	   ('Анна', 'Антонова', 21, 89124829563, 'бариста'),
	   ('Алексей', 'Ивановский', 23, 89124829867, 'помощник бариста');
	  
SELECT * FROM Starbucks.employee_profiles;


INSERT INTO Starbucks.coffee(name_of_coffee)
VALUES ('Капучино'), ('Латте'), ('Раф'), ('Латте-маккиато'), ('Эспрессо'), ('Маття');
SELECT * FROM coffee;

INSERT INTO Starbucks.drinks (name_of_drink)
VALUES ('Чай'), ('Лимонад'), ('Айс ти'), ('Молочный коктель'), ('Минеральная вода');
SELECT * FROM drinks;

INSERT INTO Starbucks.food (name_of_food)
VALUES ('Салат'), ('Киш'), ('Сэндвич'), ('Кекс'), ('Орешки'), ('Круассан');
SELECT * FROM food;

INSERT INTO Starbucks.desert (name_of_desert)
VALUES ('Мороженое шоколадное'), ('Круассан миндальный'), ('Чизкейк'), ('Черничный маффин');
SELECT * FROM desert;




