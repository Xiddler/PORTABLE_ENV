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

# INTERACTIVE SQLITE3 COMMANDS
See [cli sqlite3 shell](https://www.sqlite.org/cli.html)

## quickies

sqlite>.help
sqlite>.exit            Exit interactive shell
sqlite>
sqlite>
sqlite>

## special dot commands in the interactive shell

sqlite> .help

.archive ...             Manage SQL archives
.auth ON|OFF             Show authorizer callbacks
.backup ?DB? FILE        Backup DB (default "main") to FILE
.bail on|off             Stop after hitting an error.  Default OFF
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.connection [close] [#]  Open or close an auxiliary database connection
.crlf on|off             Whether or not to use \r\n line endings
.databases               List names and files of attached databases
.dbconfig ?op? ?val?     List or change sqlite3_db_config() options
.dbinfo ?DB?             Show status information about the database
.dump ?OBJECTS?          Render database content as SQL
.echo on|off             Turn command echo on or off
.eqp on|off|full|...     Enable or disable automatic EXPLAIN QUERY PLAN
.excel                   Display the output of next command in spreadsheet
.exit ?CODE?             Exit this program with return-code CODE
.expert                  EXPERIMENTAL. Suggest indexes for queries
.explain ?on|off|auto?   Change the EXPLAIN formatting mode.  Default: auto
.filectrl CMD ...        Run various sqlite3_file_control() operations
.fullschema ?--indent?   Show schema and the content of sqlite_stat tables
.headers on|off          Turn display of headers on or off
.help ?-all? ?PATTERN?   Show help text for PATTERN
.import FILE TABLE       Import data from FILE into TABLE
.indexes ?TABLE?         Show names of indexes
.intck ?STEPS_PER_UNLOCK?  Run an incremental integrity check on the db
.limit ?LIMIT? ?VAL?     Display or change the value of an SQLITE_LIMIT
.lint OPTIONS            Report potential schema issues.
.load FILE ?ENTRY?       Load an extension library
.log FILE|on|off         Turn logging on or off.  FILE can be stderr/stdout
.mode MODE ?OPTIONS?     Set output mode
.nonce STRING            Suspend safe mode for one command if nonce matches
.nullvalue STRING        Use STRING in place of NULL values
.once ?OPTIONS? ?FILE?   Output for the next SQL command only to FILE
.open ?OPTIONS? ?FILE?   Close existing database and reopen FILE
.output ?FILE?           Send output to FILE or stdout if FILE is omitted
.parameter CMD ...       Manage SQL parameter bindings
.print STRING...         Print literal STRING
.progress N              Invoke progress handler after every N opcodes
.prompt MAIN CONTINUE    Replace the standard prompts
.quit                    Stop interpreting input stream, exit if primary.
.read FILE               Read input from FILE or command output
.recover                 Recover as much data as possible from corrupt db.
.restore ?DB? FILE       Restore content of DB (default "main") from FILE
.save ?OPTIONS? FILE     Write database to FILE (an alias for .backup ...)
.scanstats on|off|est    Turn sqlite3_stmt_scanstatus() metrics on or off
.schema ?PATTERN?        Show the CREATE statements matching PATTERN
.separator COL ?ROW?     Change the column and row separators
.sha3sum ...             Compute a SHA3 hash of database content
.shell CMD ARGS...       Run CMD ARGS... in a system shell
.show                    Show the current values for various settings
.stats ?ARG?             Show stats or turn stats on or off
.system CMD ARGS...      Run CMD ARGS... in a system shell
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
.timeout MS              Try opening locked tables for MS milliseconds
.timer on|off            Turn SQL timer on or off
.trace ?OPTIONS?         Output each SQL statement as it is run
.version                 Show source, library and compiler versions
.vfsinfo ?AUX?           Information about the top-level VFS
.vfslist                 List all available VFSes
.vfsname ?AUX?           Print the name of the VFS stack
.width NUM1 NUM2 ...     Set minimum column widths for columnar output
.www                     Display output of the next command in web browser

## changing output formats

The sqlite3 program is able to show the results of a query in 14 different output formats:

    ascii
    box
    csv
    column
    html
    insert
    json
    line
    list
    markdown
    quote
    table
    tabs
    tcl 

You can use the ".mode" dot command to switch between these output formats. 

# Backup an sqlite3 db

-> % sqlite3 app.db '.backup backup.db'
