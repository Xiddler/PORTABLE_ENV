# sqlite3 
# tutorial at https://www.sqlitetutorial.net/


# create database and launch interactive shell
sqlite3 example.db

# create table
sqlite3 example.db "CREATE TABLE Os(ID INTEGER PRIMARY KEY, Name TEXT, Year INTEGER);"
sqlite3 example.db "CREATE TABLE todos(ID INTEGER PRIMARY KEY, Item TEXT, Date INTEGER);"

# insert data
sqlite3 example.db "INSERT INTO 'Os' VALUES(1,'Linux',1991);"

# list tables
sqlite3 example.db ".tables"

# view records in table
sqlite3 example.db "SELECT * FROM 'Os';"

# view records in table conditionally
sqlite example.db "SELECT * FROM 'Os' WHERE Year='1991';"

# view records with fuzzy matching
sqlite3 ~/example.db "SELECT * FROM 'Os' WHERE Year like '19%';"

# if you want to include unmatched rows. 
Left join: Include unmatched rows from the first table. 
Right join: Include unmatched rows from the second table. 
Outer join: Include unmatched rows from both tables. 
Inner join: Don't include any unmatched rows.


# ALTERNATIVE SETTING UP


## Make new .sql file
->% vim db.sql 

CREATE TABLE IF NOT EXISTS employees (

id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
age INTEGER,
start_date, DATE,
title TEXT NOT NULL,
department TEXT NOT NULL,
paygrade TEXT NOT NULL );


## Create database file
->% sqlite3 companydata.db
sqlite3> .read db.sql

sqlite3> .tables
employees

## insert data 
sqlite3> INSERT INTO employees (name, age, start_date, title, department, paygrade) VALUES('Donagh', 62, 2024-09-06, 'Senior Engineer', 'Technical', 'Medium');
[ Note: Date should be in single quotes thus: '2024-09-06' 


sqlite3> DELETE FROM employees WHERE name='Donagh';

sqlite3> INSERT INTO employees (name, age, start_date, title, department, paygrade) VALUES('Donagh', 62, '2024-09-06', 'Senior Engineer', 'Technical', 'Medium');


sqlite3> INSERT INTO employees (name, age, start_date, title, department, paygrade) VALUES('Mary', 22, '2024-09-03', 'Secretary', 'Admin', 'Low');

sqlite> SELECT * FROM employees;

id  name    age  start_date  title            department  paygrade
--  ------  ---  ----------  ---------------  ----------  --------
2   Donagh  62   2024-09-06  Senior Engineer  Technical   Medium
3   Mary    22   2024-09-03  Secretary        Admin       Low
Run Time: real 0.000 user 0.000000 sys 0.000141

See /home/donagh/REPOS/2programming/python/2python_studies/sqlite3/pyth_nice.py
