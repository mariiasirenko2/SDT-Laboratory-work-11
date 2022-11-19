/* Методи класу Location */
-- DROP TYPE Reminder FORCE;
CREATE OR REPLACE TYPE BODY Reminder AS

    /* конструктор екземплярів об'єктів класів.
       Вхідні параметри:
	   1) p_rname - назва нагадування
	   умова 1) якщо в таблиці Reminder вже існує вказане нагадування,
	   створюється екземпляр класу на основі даних таблиці,
	   інакше в таблиці Reminder створюється новий рядок з одночасним
	   створюється екземпляр класу 
	   Вихідний параметр - екземпляр об'єкту класу
	*/


	/* Функції отримання значень атрибутів */
	/* get_reminder_id */
    MEMBER FUNCTION get_reminder_id
	    RETURN NUMBER 
	IS
    BEGIN
       RETURN SELF.reminder_id;
    END get_reminder_id;

	/* get_r_name */
    MEMBER FUNCTION get_r_name
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.name;
    END get_r_name;	

    /* get_r_day */
    MEMBER FUNCTION get_r_day
	    RETURN VARCHAR 
	IS
    BEGIN
       RETURN SELF.day;
    END get_r_day;	


    /* get_r_time */
    MEMBER FUNCTION get_r_time
	    RETURN TIMESTAMP 
	IS
    BEGIN
       RETURN SELF.time;
    END get_r_time;	

END; 
/


