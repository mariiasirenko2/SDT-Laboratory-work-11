/* Створення об'єктного типу (класу) users */
CREATE OR REPLACE TABLE Users(
	user_id INT, -- id користувача
	name VARCHAR, --ім'я
	surname VARCHAR, --прізвище
	email VARCHAR
    	MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку користувачів - "Колекція екземплярів об`єктів класу Users */
CREATE TABLE Users_List IS TABLE OF users;
/

/* Створення об'єктного типу (класу) Reminder */
CREATE OR REPLACE TABLE Reminder (
	reminder_id INT, --айді нагадування
    name VARCHAR(20), --назва
	days VARCHAR(20), --дні коли робити нагадування
    time timestamp, --час нагадування
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 
/
/* Створення об'єктного типу (класу) Device */
CREATE OR REPLACE TABLE Device  (
	device_id INT, --айді девайсу
    name VARCHAR(20), --назва
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);


/* Створення об'єктного типу (класу) Collection */
CREATE OR REPLACE TABLE Collection AS OBJECT (
	collection_id INT, --айді колекції
    references VARCHAR(20), --назва
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку колекцій - "Колекція екземплярів об`єктів класу Collection */
CREATE TABLE Collection_List IS TABLE OF Collection;

/* Створення об'єктного типу (класу) Project */
CREATE OR REPLACE TABLE Project AS OBJECT (
	project_id NUMBER(10), --айді проекту
	name VARCHAR(100),--назва проекту
	details VARCHAR(100), --опис проекту
    keywords VARCHAR(100),--ключові слова проекту
    --ключовий колів типу #11224h
    keycolor VARCHAR,
    collections Collection_List,
	
    /* конструктор екземплярів об'єктів класів.
       	Вхідні параметри:
	   1) p_pname - назва проекту
	   умова 1) якщо в таблиці Project вже існує вказаний товар,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Project створюється новий рядок з одночасним
	   створюється екземпляр класу 
	 Вихідний параметр - екземпляр обєкту класу */
    	CONSTRUCTOR FUNCTION Project(p_pname VARCHAR)
        	RETURN SELF AS RESULT,
		/* Процедура зміни значення атрибутів */
		MEMBER PROCEDURE set_pname(p_product_id NUMBER, p_pname VARCHAR, details VARCHAR),
    		/* Функції отримання значень атрибутів */
		MEMBER FUNCTION get_project_id RETURN NUMBER,
		MEMBER FUNCTION get_pname RETURN VARCHAR,
		MEMBER FUNCTION get_details RETURN VARCHAR,
        MEMBER FUNCTION get_keywords RETURN VARCHAR,
		MEMBER FUNCTION get_keycolor RETURN VARCHAR,
        MEMBER FUNCTION get_collections RETURN Collection_List,

	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
); 

