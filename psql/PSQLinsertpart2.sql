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

postgres=# create table c19 (cstate char(2), cdate date, cnew integer, crecov integer, cpassed integer);
CREATE TABLE
postgres=# \d c19
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           |          |
 cdate   | date         |           |          |
 cnew    | integer      |           |          |
 crecov  | integer      |           |          |
 cpassed | integer      |           |          |


postgres=# insert into c19 values ('ap', '2021-01-01', 10, 5, 1);
INSERT 0 1
postgres=# insert into c19 values ('ap', '2021-01-01', 20, 6, 2);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-01 |   10 |      5 |       1
 ap     | 2021-01-01 |   20 |      6 |       2
(2 rows)


postgres=# insert into c19 (cstate, cdate, cnew) values ('tn','2021-01-01',12);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-01 |   10 |      5 |       1
 ap     | 2021-01-01 |   20 |      6 |       2
 tn     | 2021-01-01 |   12 |        |
(3 rows)


postgres=# drop table c19;
DROP TABLE
postgres=# \d c19;
Did not find any relation named "c19".
postgres=# create table c19 (cstate char(2) not null, cdate date not null, cnew integer not null, crecov integer, cpassed integer);
CREATE TABLE
postgres=# \d c19;
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           | not null |
 cdate   | date         |           | not null |
 cnew    | integer      |           | not null |
 crecov  | integer      |           |          |
 cpassed | integer      |           |          |


postgres=# insert into c19 values ('ap','2021-01-02',100,40,5);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     40 |       5
(1 row)


postgres=# insert into c19 values ('ap','2021-01-02',100,40,5);
INSERT 0 1
postgres=# \d c19;
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           | not null |
 cdate   | date         |           | not null |
 cnew    | integer      |           | not null |
 crecov  | integer      |           |          |
 cpassed | integer      |           |          |


postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |  100 |     40 |       5
 ap     | 2021-01-02 |  100 |     40 |       5
(2 rows)


postgres=# drop table c19;
DROP TABLE
postgres=# create table c19 (cstate char(2) not null, cdate date not null, cnew integer not null check (cnew > 0), crecov integer, cpassed integer);
CREATE TABLE
postgres=# \d c19;
                   Table "public.c19"
 Column  |     Type     | Collation | Nullable | Default
---------+--------------+-----------+----------+---------
 cstate  | character(2) |           | not null |
 cdate   | date         |           | not null |
 cnew    | integer      |           | not null |
 crecov  | integer      |           |          |
 cpassed | integer      |           |          |
Check constraints:
    "c19_cnew_check" CHECK (cnew > 0)


postgres=# insert into c19 values ('ap','2021-01-02',0,40,5);
ERROR:  new row for relation "c19" violates check constraint "c19_cnew_check"
DETAIL:  Failing row contains (ap, 2021-01-02, 0, 40, 5).
postgres=# insert into c19 values ('ap','2021-01-02',1,40,5);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |    1 |     40 |       5
(1 row)


postgres=# drop table c19;
DROP TABLE
postgres=# create table c19 (cstate char(2) not null, cdate date not null, cnew integer not null, crecov integer, cpassed integer, primary key (cstate, cdate));
CREATE TABLE
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


postgres=# drop table c19;
DROP TABLE
postgres=#
postgres=# create table c19 (cstate char(2) not null, cdate date not null, cnew integer not null check (cnew > 0), crecov integer, cpassed integer,primary key(cstate, cdate));
CREATE TABLE
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


postgres=# insert into c19 values ('ap','2021-01-02',3,40,5);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-03',4,40,5);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-04',5,40,5);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |    3 |     40 |       5
 ap     | 2021-01-03 |    4 |     40 |       5
 ap     | 2021-01-04 |    5 |     40 |       5
(3 rows)


postgres=# insert into c19 values ('ap','2021-01-02',15,40,5);
ERROR:  duplicate key value violates unique constraint "c19_pkey"
DETAIL:  Key (cstate, cdate)=(ap, 2021-01-02) already exists.
postgres=#
postgres=# delete from c19;
DELETE 3
postgres=# select * from c19;
 cstate | cdate | cnew | crecov | cpassed
--------+-------+------+--------+---------
(0 rows)


postgres=# insert into c19 values ('ap','2021-01-01',100,40,2);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-02',40,20,8);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-03',70,10,6);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-03',2,4,5);
ERROR:  duplicate key value violates unique constraint "c19_pkey"
DETAIL:  Key (cstate, cdate)=(ap, 2021-01-03) already exists.
postgres=# insert into c19 values ('ap','2021-01-04',2,4,5);
INSERT 0 1
postgres=# insert into c19 values ('ap','2021-01-05',80,42,6);
INSERT 0 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-01 |  100 |     40 |       2
 ap     | 2021-01-02 |   40 |     20 |       8
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-04 |    2 |      4 |       5
 ap     | 2021-01-05 |   80 |     42 |       6
(5 rows)


postgres=# select * from c19 where cnew > 50;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-01 |  100 |     40 |       2
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-05 |   80 |     42 |       6
(3 rows)


postgres=# select * from c19 where cpassed > 5;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |   40 |     20 |       8
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-05 |   80 |     42 |       6
(3 rows)


postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-01 |  100 |     40 |       2
 ap     | 2021-01-02 |   40 |     20 |       8
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-04 |    2 |      4 |       5
 ap     | 2021-01-05 |   80 |     42 |       6
(5 rows)


postgres=# delete from c19 where cnew = 100;
DELETE 1
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2021-01-02 |   40 |     20 |       8
 ap     | 2021-01-03 |   70 |     10 |       6
 ap     | 2021-01-04 |    2 |      4 |       5
 ap     | 2021-01-05 |   80 |     42 |       6
(4 rows)


postgres=#