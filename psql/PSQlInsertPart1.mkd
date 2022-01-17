Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]: postgres
Password for user postgres:
psql (14.1)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# \l>
                                         List of databases
   Name    |  Owner   | Encoding |      Collate       |       Ctype        |   Access privileges
-----------+----------+----------+--------------------+--------------------+-----------------------
 accounts  | postgres | UTF8     | English_India.1252 | English_India.1252 |
 marketing | postgres | UTF8     | English_India.1252 | English_India.1252 |
 postgres  | postgres | UTF8     | English_India.1252 | English_India.1252 |
 template0 | postgres | UTF8     | English_India.1252 | English_India.1252 | =c/postgres          +
           |          |          |                    |                    | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_India.1252 | English_India.1252 | =c/postgres          +
           |          |          |                    |                    | postgres=CTc/postgres
(5 rows)


postgres=# create table mytab1(cid integer,cname char(20),ctype char(1),st_date date,cvalue real);
CREATE TABLE
postgres=# \d mytab1;
                  Table "public.mytab1"
 Column  |     Type      | Collation | Nullable | Default
---------+---------------+-----------+----------+---------
 cid     | integer       |           |          |
 cname   | character(20) |           |          |
 ctype   | character(1)  |           |          |
 st_date | date          |           |          |
 cvalue  | real          |           |          |


postgres=# \dt
         List of relations
 Schema |  Name  | Type  |  Owner
--------+--------+-------+----------
 public | mytab1 | table | postgres
(1 row)


postgres=# create table mytab2 (fname char(10), lname char(20));
CREATE TABLE
postgres=# \dt
         List of relations
 Schema |  Name  | Type  |  Owner
--------+--------+-------+----------
 public | mytab1 | table | postgres
 public | mytab2 | table | postgres
(2 rows)


postgres=# \d mytab2;
                  Table "public.mytab2"
 Column |     Type      | Collation | Nullable | Default
--------+---------------+-----------+----------+---------
 fname  | character(10) |           |          |
 lname  | character(20) |           |          |


postgres=# \d mytab1;
                  Table "public.mytab1"
 Column  |     Type      | Collation | Nullable | Default
---------+---------------+-----------+----------+---------
 cid     | integer       |           |          |
 cname   | character(20) |           |          |
 ctype   | character(1)  |           |          |
 st_date | date          |           |          |
 cvalue  | real          |           |          |


postgres=# insert into mytab1 values (
postgres(# 1, 'aadi sale', 't', '2021-08-01',10.25);
INSERT 0 1
postgres=# insert into mytab1 values (2, 'diwali sale', 'n', '2021-09-01', 9.25);
INSERT 0 1
postgres=# select * from mytab1;
 cid |        cname         | ctype |  st_date   | cvalue
-----+----------------------+-------+------------+--------
   1 | aadi sale            | t     | 2021-08-01 |  10.25
   2 | diwali sale          | n     | 2021-09-01 |   9.25
(2 rows)


postgres=# select cname, cvalue from mytab1;
        cname         | cvalue
----------------------+--------
 aadi sale            |  10.25
 diwali sale          |   9.25
(2 rows)


postgres=#