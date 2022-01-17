
postgres=# drop table c19;
DROP TABLE
postgres=# \d c19;
Did not find any relation named "c19".
postgres=# create table c19(cstate char(2) not null check (cstate in ('ap','tn','up')),cdate date not null, cnew integer not null check (cnew > 0),crecov integer not null check (crecov > 0 AND crecov < 100),cpassed integer, primary key (cstate, cdate));
CREATE TABLE
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
    "c19_cstate_check" CHECK (cstate = ANY (ARRAY['ap'::bpchar, 'tn'::bpchar, 'up'::bpchar]))


postgres=# select * from c19;
 cstate | cdate | cnew | crecov | cpassed
--------+-------+------+------

postgres=# COPY c19 FROM 'C:\\Users\\ELCOT\\Desktop\\python\\psql\\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  could not open file "C:\\Users\\ELCOT\\Desktop\\python\\psql\\sample-c19.csv" for reading: Permission denied
HINT:  COPY FROM instructs the PostgreSQL server process to read a file. You may want a client-side facility such as psql's \copy.
postgres=# COPY c19 FROM 'C:\Users\ELCOT\Desktop\python\psql\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  could not open file "C:\Users\ELCOT\Desktop\python\psql\sample-c19.csv" for reading: Permission denied
HINT:  COPY FROM instructs the PostgreSQL server process to read a file. You may want a client-side facility such as psql's \copy.
postgres=# COPY c19 FROM 'C:\Users\ELCOT\Desktop\python\psql\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  could not open file "C:\Users\ELCOT\Desktop\python\psql\sample-c19.csv" for reading: Permission denied
HINT:  COPY FROM instructs the PostgreSQL server process to read a file. You may want a client-side facility such as psql's \copy.
postgres=# COPY c19 FROM 'C:\\Users\\ELCOT\\Desktop\\python\\psql\\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  could not open file "C:\\Users\\ELCOT\\Desktop\\python\\psql\\sample-c19.csv" for reading: Permission denied
HINT:  COPY FROM instructs the PostgreSQL server process to read a file. You may want a client-side facility such as psql's \copy.
postgres=# COPY c19 FROM 'D:\\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  new row for relation "c19" violates check constraint "c19_crecov_check"
DETAIL:  Failing row contains (ap, 2022-01-07, 24, 100, 2).
CONTEXT:  COPY c19, line 8: "ap,2022-01-07,24,100,2"
postgres=# truncate c19;
TRUNCATE TABLE
postgres=# COPY c19 FROM 'D:\\sample-c19.csv' DELIMITER ',' CSV HEADER;
ERROR:  new row for relation "c19" violates check constraint "c19_crecov_check"
DETAIL:  Failing row contains (ap, 2022-01-07, 24, 100, 2).
CONTEXT:  COPY c19, line 8: "ap,2022-01-07,24,100,2"
postgres=# truncate c19;
TRUNCATE TABLE
postgres=# COPY c19 FROM 'D:\\sample-c19.csv' DELIMITER ',' CSV HEADER;
COPY 45
postgres=# select * from c19;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2022-01-01 |   95 |     84 |       1
 ap     | 2022-01-02 |   20 |     16 |       6
 ap     | 2022-01-03 |   88 |     19 |       9
 ap     | 2022-01-04 |   41 |     45 |       5
 ap     | 2022-01-05 |   32 |     39 |       4
 ap     | 2022-01-06 |   63 |     48 |       5
 ap     | 2022-01-07 |   24 |     90 |       2
 ap     | 2022-01-08 |   18 |     18 |       4
 ap     | 2022-01-09 |   84 |     23 |       5
 ap     | 2022-01-10 |   33 |     87 |       2
 ap     | 2022-01-11 |   97 |     27 |      10
 ap     | 2022-01-12 |   60 |     75 |       2
 ap     | 2022-01-13 |   19 |     58 |       1
 ap     | 2022-01-14 |    6 |     82 |       6
 ap     | 2022-01-15 |   36 |     18 |       1
 tn     | 2022-01-01 |   77 |     68 |       9
 tn     | 2022-01-02 |   69 |     38 |       8
 tn     | 2022-01-03 |   38 |     21 |       3
 tn     | 2022-01-04 |    7 |     32 |       5
 tn     | 2022-01-05 |   64 |     67 |       2
 tn     | 2022-01-06 |   53 |     58 |       3
 tn     | 2022-01-07 |    7 |     28 |       2
 tn     | 2022-01-08 |   46 |     40 |       6
 tn     | 2022-01-09 |   51 |     19 |       6
 tn     | 2022-01-10 |   37 |     49 |       5
 tn     | 2022-01-11 |   73 |     38 |       7
 tn     | 2022-01-12 |   64 |     99 |       9
 tn     | 2022-01-13 |   87 |     36 |       9
 tn     | 2022-01-14 |    3 |      7 |       1
 tn     | 2022-01-15 |    2 |     86 |       7
 up     | 2022-01-01 |   61 |     98 |       4
 up     | 2022-01-02 |   67 |     20 |       3
 up     | 2022-01-03 |   86 |     91 |       2
 up     | 2022-01-04 |   82 |     84 |       1
 up     | 2022-01-05 |   22 |      9 |       9
 up     | 2022-01-06 |   61 |     22 |       3
 up     | 2022-01-07 |   53 |     75 |      10
 up     | 2022-01-08 |   56 |     66 |       9
 up     | 2022-01-09 |   84 |     54 |       3
 up     | 2022-01-10 |    4 |     86 |       8
 up     | 2022-01-11 |   22 |     73 |       4
 up     | 2022-01-12 |   38 |     54 |       5
 up     | 2022-01-13 |   67 |     82 |       6
 up     | 2022-01-14 |   94 |     93 |       8
 up     | 2022-01-15 |    5 |     83 |       6
(45 rows)


postgres=#
postgres=# select count(*) from c19;
 count
-------
    45
(1 row)


postgres=# select count(*) from c19 where cstate = 'up';
 count
-------
    15
(1 row)


postgres=# select count(*) from c19 where cnew > 50;
 count
-------
    24
(1 row)


postgres=# select * from c19 where cnew > 50;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 ap     | 2022-01-01 |   95 |     84 |       1
 ap     | 2022-01-03 |   88 |     19 |       9
 ap     | 2022-01-06 |   63 |     48 |       5
 ap     | 2022-01-09 |   84 |     23 |       5
 ap     | 2022-01-11 |   97 |     27 |      10
 ap     | 2022-01-12 |   60 |     75 |       2
 tn     | 2022-01-01 |   77 |     68 |       9
 tn     | 2022-01-02 |   69 |     38 |       8
 tn     | 2022-01-05 |   64 |     67 |       2
 tn     | 2022-01-06 |   53 |     58 |       3
 tn     | 2022-01-09 |   51 |     19 |       6
 tn     | 2022-01-11 |   73 |     38 |       7
 tn     | 2022-01-12 |   64 |     99 |       9
 tn     | 2022-01-13 |   87 |     36 |       9
 up     | 2022-01-01 |   61 |     98 |       4
 up     | 2022-01-02 |   67 |     20 |       3
 up     | 2022-01-03 |   86 |     91 |       2
 up     | 2022-01-04 |   82 |     84 |       1
 up     | 2022-01-06 |   61 |     22 |       3
 up     | 2022-01-07 |   53 |     75 |      10
 up     | 2022-01-08 |   56 |     66 |       9
 up     | 2022-01-09 |   84 |     54 |       3
 up     | 2022-01-13 |   67 |     82 |       6
 up     | 2022-01-14 |   94 |     93 |       8
(24 rows)


postgres=# select * from c19 where cnew > 50 and cstate = 'tn';
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2022-01-01 |   77 |     68 |       9
 tn     | 2022-01-02 |   69 |     38 |       8
 tn     | 2022-01-05 |   64 |     67 |       2
 tn     | 2022-01-06 |   53 |     58 |       3
 tn     | 2022-01-09 |   51 |     19 |       6
 tn     | 2022-01-11 |   73 |     38 |       7
 tn     | 2022-01-12 |   64 |     99 |       9
 tn     | 2022-01-13 |   87 |     36 |       9
(8 rows)


postgres=# select * from c19 where cnew > 50 and cstate = 'tn' and cpassed > 5;
 cstate |   cdate    | cnew | crecov | cpassed
--------+------------+------+--------+---------
 tn     | 2022-01-01 |   77 |     68 |       9
 tn     | 2022-01-02 |   69 |     38 |       8
 tn     | 2022-01-09 |   51 |     19 |       6
 tn     | 2022-01-11 |   73 |     38 |       7
 tn     | 2022-01-12 |   64 |     99 |       9
 tn     | 2022-01-13 |   87 |     36 |       9
(6 rows)


postgres=# select sum(cnew) from c19;
 sum
------
 2196
(1 row)


postgres=# select sum(cnew) from c19 where cstate = 'tn';
 sum
-----
 678
(1 row)


postgres=# select sum(cnew) from c19 where cstate = 'ap';
 sum
-----
 716
(1 row)


postgres=# select sum(cnew),sum(cpassed) from c19 where cstate = 'ap';
 sum | sum
-----+-----
 716 |  63
(1 row)


postgres=# select sum(cnew) as "new",sum(cpassed) as "passed" from c19 where cstate = 'ap';
 new | passed
-----+--------
 716 |     63
(1 row)


postgres=# select avg(cnew) as "new",avg(cpassed) as "passed" from c19 where cstate = 'ap';
         new         |       passed
---------------------+--------------------
 47.7333333333333333 | 4.2000000000000000
(1 row)


postgres=# select avg(cnew) as "new",avg(cpassed) as "passed" from c19 where cstate = 'tn';
         new         |       passed
---------------------+--------------------
 45.2000000000000000 | 5.4666666666666667
(1 row)


postgres=# select avg(cnew) as "new",avg(cpassed) as "passed" from c19 where cstate = 'up';
         new         |       passed
---------------------+--------------------
 53.4666666666666667 | 5.4000000000000000
(1 row)


postgres=# select max(cnew) from c19;
 max
-----
  97
(1 row)


postgres=# select min(cnew) from c19;
 min
-----
   2
(1 row)


postgres=# select cstate, sum(cnew) from c19 group by cstate;
 cstate | sum
--------+-----
 tn     | 678
 ap     | 716
 up     | 802
(3 rows)


postgres=# select cdate, sum(cne) from c19 group by cdate;
ERROR:  column "cne" does not exist
LINE 1: select cdate, sum(cne) from c19 group by cdate;
                          ^
HINT:  Perhaps you meant to reference the column "c19.cnew".
postgres=# select cdate, sum(cnew) from c19 group by cdate;
   cdate    | sum
------------+-----
 2022-01-02 | 156
 2022-01-10 |  74
 2022-01-15 |  43
 2022-01-12 | 162
 2022-01-09 | 219
 2022-01-14 | 103
 2022-01-06 | 177
 2022-01-11 | 192
 2022-01-07 |  84
 2022-01-08 | 120
 2022-01-04 | 130
 2022-01-05 | 118
 2022-01-03 | 212
 2022-01-13 | 173
 2022-01-01 | 233
(15 rows)


postgres=# select cdate, sum(cnew) from c19 group by cdate order by cdate;
   cdate    | sum
------------+-----
 2022-01-01 | 233
 2022-01-02 | 156
 2022-01-03 | 212
 2022-01-04 | 130
 2022-01-05 | 118
 2022-01-06 | 177
 2022-01-07 |  84
 2022-01-08 | 120
 2022-01-09 | 219
 2022-01-10 |  74
 2022-01-11 | 192
 2022-01-12 | 162
 2022-01-13 | 173
 2022-01-14 | 103
 2022-01-15 |  43
(15 rows)


postgres=# select cdate, sum(cnew) from c19 group by cdate order by 2;
   cdate    | sum
------------+-----
 2022-01-15 |  43
 2022-01-10 |  74
 2022-01-07 |  84
 2022-01-14 | 103
 2022-01-05 | 118
 2022-01-08 | 120
 2022-01-04 | 130
 2022-01-02 | 156
 2022-01-12 | 162
 2022-01-13 | 173
 2022-01-06 | 177
 2022-01-11 | 192
 2022-01-03 | 212
 2022-01-09 | 219
 2022-01-01 | 233
(15 rows)


postgres=# select cdate, sum(cnew) from c19 group by cdate order by 2 desc;
   cdate    | sum
------------+-----
 2022-01-01 | 233
 2022-01-09 | 219
 2022-01-03 | 212
 2022-01-11 | 192
 2022-01-06 | 177
 2022-01-13 | 173
 2022-01-12 | 162
 2022-01-02 | 156
 2022-01-04 | 130
 2022-01-08 | 120
 2022-01-05 | 118
 2022-01-14 | 103
 2022-01-07 |  84
 2022-01-10 |  74
 2022-01-15 |  43
(15 rows)


postgres=#