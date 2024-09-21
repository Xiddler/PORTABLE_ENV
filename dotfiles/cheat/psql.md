Opened 2024-09-20


# ensure it is installed 

See zim-wiki 
--▷ MAJORS:databases:PostGRES
--▷ LINUX:1Linux Live USB:01installed apps:postgresql

# check psql service is good

->% sudo systemctl status psql.service

# get postgres Linux command help

->% postgres --help

# open the ps shell prompt

->%  sudo -i -u postgres

[postgres@donagh-satellitep50c ~]$                                  ◁-- ps shell prompt to allow connnection to postgres


# connect to psql

[postgres@donagh-satellitep50c ~]$ psql
postgres=#

# get help in postgres DB Engine

postgres=# \?

postgres=# \d[S+]                 list tables, views, and sequences
postgres=# \d[S+]  NAME           describe table, view, sequence, or index


# quit postgres connection


postgres=# \q


# psql is the PostgreSQL terminal interface. 

 Connection options:
 -U username (if not specified current OS user is used).
 -p port.
 -h server hostname/address.

# connect to a specific database:

psql -U postgres -h serverAddress -d dbName

# get databases on a server:

psql -U postgres -h serverAddress --list

# execute sql query and save output to file:

psql -U postgres -d dbName -c 'select * from tableName;' -o fileName

# execute query and get tabular html output:

psql -U postgres -d dbName -H -c 'select * from tableName;'

# execute query and save resulting rows to csv file:

psql -U postgres -d dbName -t -A -P fieldsep=',' -c 'select * from tableName;' -o fileName.csv

# read commands from file:

psql -f fileName

# restore databases from file:

psql -f fileName.backup postgres


