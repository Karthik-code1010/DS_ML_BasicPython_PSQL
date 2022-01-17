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

postgres=# \l
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


postgres=# \c accounts;
You are now connected to database "accounts" as user "postgres".
accounts=# \c postgres;
You are now connected to database "postgres" as user "postgres".
postgres=# \d;
invalid command \d;
Try \? for help.
postgres=# \d c19;
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           | not null |
 cdate   | date         |           | not null |
 cnew    | integer      |           | not null |
 crecov  | integer      |           |          |
 cpassed | integer      |           |          |
Indexes:
    "c19_pkey" PRIMARY KEY, btree (cstate, cdate)
Check constraints:
    "c19_cnew_check" CHECK (cnew > 0)


postgres=# insert into c19 values ('ap','2021-01-02',100, 40, 5);
ERROR:  duplicate key value violates unique constraint "c19_pkey"
DETAIL:  Key (cstate, cdate)=(ap, 2021-01-02) already exists.
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |   40 |     20 |       8
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-04 |    2 |      4 |       5
 ap     | 2021-01-05 |   80 |     42 |       6
(4 rows)


postgres=# drop c19;
ERROR:  syntax error at or near "c19"
LINE 1: drop c19;
             ^
postgres=# drop table c19;
DROP TABLE
postgres=# create table c19(cstate char(2) not null check (cstate in ('ap','tn')),)
postgres-# ;
ERROR:  syntax error at or near ")"
LINE 1: ... c19(cstate char(2) not null check (cstate in ('ap','tn')),)
                                                                      ^
postgres=# create table c19(cstate char(2) not null check (cstate in ('ap','tn')),cdate date not null, cnew integer not null check (cnew > 0),crecov integer,cpassed integer, primary key (cstate, cdate));
CREATE TABLE
postgres=# insert into c19 values ('ap','2021-01-02', 100, 40, 5);
INSERT 0 1
postgres=# insert into c19 values ('tn','2021-01-02', 100, 40, 5);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     40 |       5
 tn     | 2021-01-02 |  100 |     40 |       5
(2 rows)


postgres=# insert into c19 values ('up','2021-01-02', 100, 40, 5);
ERROR:  new row for relation "c19" violates check constraint "c19_cstate_check"
DETAIL:  Failing row contains (up, 2021-01-02, 100, 40, 5).
postgres=# drop table c19;
DROP TABLE
postgres=# create table c19(cstate char(2) not null check (cstate in ('ap','tn')),cdate date not null, cnew integer not null check (cnew > 0),crecov integer not null check (crecov > 0 AND crecov < 100),cpassed integer, primary key (cstate, cdate));
CREATE TABLE
postgres=# insert into c19 values ('ap','2021-01-02', 100, 40, 5);
INSERT 0 1
postgres=# insert into c19 values ('tn','2021-01-02', 100, 140, 5);
ERROR:  new row for relation "c19" violates check constraint "c19_crecov_check"
DETAIL:  Failing row contains (tn, 2021-01-02, 100, 140, 5).
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     40 |       5
(1 row)


postgres=# create table state(scode char(2) not null unique, sname varchar(30) not null);
CREATE TABLE
postgres=# \d states;
Did not find any relation named "states".
postgres=# \d state;
                      Table "public.state"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 scode  | character(2)          |           | not null |
 sname  | character varying(30) |           | not null |
Indexes:
    "state_scode_key" UNIQUE CONSTRAINT, btree (scode)


postgres=#  insert into state values ('ap','andhra pradesh');
INSERT 0 1
postgres=#  insert into state values ('bh','bihar');
INSERT 0 1
postgres=#  insert into state values ('tn','tamil nadu');
INSERT 0 1
postgres=#  insert into state values ('tn','tamizh nadu');
ERROR:  duplicate key value violates unique constraint "state_scode_key"
DETAIL:  Key (scode)=(tn) already exists.
postgres=# select * from state;
 scode |     sname
-------+----------------
 ap    | andhra pradesh
 bh    | bihar
 tn    | tamil nadu
(3 rows)


postgres=# \d c19;
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           | not null |
 cdate   | date         |           | not null |
 cnew    | integer      |           | not null |
 crecov  | integer      |           | not null |
 cpassed | integer      |           |          |
Indexes:
    "c19_pkey" PRIMARY KEY, btree (cstate, cdate)
Check constraints:
    "c19_cnew_check" CHECK (cnew > 0)
    "c19_crecov_check" CHECK (crecov > 0 AND crecov < 100)
    "c19_cstate_check" CHECK (cstate = ANY (ARRAY['ap'::bpchar, 'tn'::bpchar]))


postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     40 |       5
(1 row)


postgres=# truncate c19;
TRUNCATE TABLE
postgres=# insert into c19 values ('ap','2021-01-02', 100, 41, 5);
INSERT 0 1
postgres=# insert into c19 values ('tn','2021-01-03', 150, 42, 6);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-04', 160, 43, 7);
INSERT 0 1
postgres=# insert into c19 values ('tn','2021-01-05', 170, 44, 8);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     41 |       5
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
 tn     | 2021-01-05 |  170 |     44 |       8
(4 rows)


postgres=# select * from c19 where cnew > 130;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
 tn     | 2021-01-05 |  170 |     44 |       8
(3 rows)


postgres=# select * from c19 where cnew > 130 and crecov  43;
ERROR:  syntax error at or near "43"
LINE 1: select * from c19 where cnew > 130 and crecov  43;
                                                       ^
postgres=# select * from c19 where cnew > 130 and crecov > 43;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2021-01-05 |  170 |     44 |       8
(1 row)


postgres=# select * from c19 where cnew > 130 or crecov > 10;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     41 |       5
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
 tn     | 2021-01-05 |  170 |     44 |       8
(4 rows)


postgres=# select * from c19 where where cstate = 'ap';
ERROR:  syntax error at or near "where"
LINE 1: select * from c19 where where cstate = 'ap';
                                ^
postgres=# select * from c19 where cstate = 'ap';
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     41 |       5
 ap     | 2021-01-04 |  160 |     43 |       7
(2 rows)


postgres=# select * from c19 where cstate in ('ap', 'tn');
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     41 |       5
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
 tn     | 2021-01-05 |  170 |     44 |       8
(4 rows)


postgres=# select * from c19 where cnew > 130 and crecov > 43;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2021-01-05 |  170 |     44 |       8
(1 row)


postgres=# delete * from c19 where cnew > 130 and crecov > 43;
ERROR:  syntax error at or near "*"
LINE 1: delete * from c19 where cnew > 130 and crecov > 43;
               ^
postgres=# delete from c19 where cnew > 130 and crecov > 43;
DELETE 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     41 |       5
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
(3 rows)


postgres=# select * from c19 where cnew between 140 and 200;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2021-01-03 |  150 |     42 |       6
 ap     | 2021-01-04 |  160 |     43 |       7
(2 rows)


postgres=#