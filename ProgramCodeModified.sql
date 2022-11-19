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

/* Створення об'єктного типу (класу) Collection */
CREATE OR REPLACE TABLE Collection  (
	collection_id INT, --айді колекції
    references VARCHAR(20), --назва
	/* Процедура виводу на екран значень атрибутів */
    	MEMBER PROCEDURE display
);

/* Створення типу для зберігання списку колекцій - "Колекція екземплярів об`єктів класу Collection */
CREATE TABLE Collection_List IS TABLE OF Collection;

/* Створення об'єктного типу (класу) Project */
CREATE OR REPLACE TABLE Project (
	project_id NUMBER(10), --айді проекту
	name VARCHAR(100),--назва проекту
	details VARCHAR(100), --опис проекту
        keywords VARCHAR(100),--ключові слова проекту
        --ключовий колів типу #11224h
        keycolor VARCHAR,
        collections Collection_List)
	

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

