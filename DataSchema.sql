create table users( 
    user_id INT PRIMARY KEY, 
	name VARCHAR, 
	surname VARCHAR, 
	email VARCHAR CHECK(email ~* '^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$') UNIQUE 
);
create table reminder(
     reminder_id INT PRIMARY KEY,
     name VARCHAR,
     days VARCHAR,
     time timestamp
);
create table device(
     device_id INT PRIMARY KEY,
     name VARCHAR
);
create table shedule( 
   user_id INT REFERENCES users(user_id), 
   reminder_id INT REFERENCES reminder(reminder_id),
   device_id INT REFERENCES device(device_id)
);
create table project( 
     project_id INT PRIMARY KEY,
     name VARCHAR, 
	 details VARCHAR,
     keywords VARCHAR, 
     keycolor VARCHAR CHECK( keycolor ~* '#([0-9a-fA-F]{2}){3}|([0-9a-fA-F]){3}$')
);
create table collections( 
     collections_id INT PRIMARY KEY, 
     name VARCHAR, 
	 reference bytea, 
     user_id INT REFERENCES users(user_id),
     project_id INT REFERENCES project(project_id) 
);
create table graphic_editor(
     graphic_editor_id INT PRIMARY KEY, 
     name VARCHAR, 
     type VARCHAR
);
create table editor_user(
     user_id INT REFERENCES users(user_id),
     graphic_editor_id INT REFERENCES graphic_editor(graphic_editor_id)
);
