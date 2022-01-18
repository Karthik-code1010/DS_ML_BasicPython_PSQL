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

postgres=# create table voters (vid integer, street varchar(20),vname varchar(20),created_on timestamp, age integer);
CREATE TABLE
postgres=# \d voters;
                           Table "public.voters"
   Column   |            Type             | Collation | Nullable | Default
------------+-----------------------------+-----------+----------+---------
 vid        | integer                     |           |          |
 street     | character varying(20)       |           |          |
 vname      | character varying(20)       |           |          |
 created_on | timestamp without time zone |           |          |
 age        | integer                     |           |          |


postgres=# insert into voters values (1, 'Sannathi Street','Karthik',now(),22);
INSERT 0 1
postgres=# select * from voters;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Karthik | 2022-01-18 13:40:35.439639 |  22
(1 row)


postgres=# insert into voters values (1, 'Sannathi Street','Mani',now(),23);
INSERT 0 1
postgres=# insert into voters values (1, 'Sannathi Street','Mathu',now(),21);
INSERT 0 1
postgres=# delete from voters;
DELETE 3
postgres=# select * from voters;
 vid | street | vname | created_on | age
-----+--------+-------+------------+-----
(0 rows)


postgres=# insert into voters values (1, 'Sannathi Street','Mani',now(),23);
INSERT 0 1
postgres=# insert into voters values (2, 'Sannathi Street','Karthik',now(),22);
INSERT 0 1
postgres=# insert into voters values (3, 'Iqbal Street','Mathu',now(),21);
INSERT 0 1
postgres=# select * from voters;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   2 | Sannathi Street | Karthik | 2022-01-18 13:43:35.948766 |  22
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
(3 rows)


postgres=# update voters set street='East Street' where vid=2;
UPDATE 1
postgres=# select * from voters;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
(3 rows)


postgres=# select * from voters order by vid;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
(3 rows)


postgres=# select * from voters where street = 'Iqbal Street';
 vid |    street    | vname |         created_on         | age
-----+--------------+-------+----------------------------+-----
   3 | Iqbal Street | Mathu | 2022-01-18 13:43:59.945704 |  21
(1 row)


postgres=# select * from voters where street like 'Iq%';
 vid |    street    | vname |         created_on         | age
-----+--------------+-------+----------------------------+-----
   3 | Iqbal Street | Mathu | 2022-01-18 13:43:59.945704 |  21
(1 row)


postgres=# insert into voters values (4, 'Iqbal St','Parthi',now(),23);
INSERT 0 1
postgres=# select * from voters where street like 'Iq%';
 vid |    street    | vname  |         created_on         | age
-----+--------------+--------+----------------------------+-----
   3 | Iqbal Street | Mathu  | 2022-01-18 13:43:59.945704 |  21
   4 | Iqbal St     | Parthi | 2022-01-18 13:58:31.571701 |  23
(2 rows)


postgres=# select * from voters where street like '%t';
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
   4 | Iqbal St        | Parthi  | 2022-01-18 13:58:31.571701 |  23
(4 rows)


postgres=# select * from voters where street like '%ar%';
 vid | street | vname | created_on | age
-----+--------+-------+------------+-----
(0 rows)


postgres=# select * from voters where street like '%a%';
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
   4 | Iqbal St        | Parthi  | 2022-01-18 13:58:31.571701 |  23
(4 rows)


postgres=# select * from voters where street like '%art%';
 vid | street | vname | created_on | age
-----+--------+-------+------------+-----
(0 rows)


postgres=# select * from voters where street like '%r%';
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
(3 rows)


postgres=# select * from voters where vname like '%ar%';
 vid |   street    |  vname  |         created_on         | age
-----+-------------+---------+----------------------------+-----
   2 | East Street | Karthik | 2022-01-18 13:43:35.948766 |  22
   4 | Iqbal St    | Parthi  | 2022-01-18 13:58:31.571701 |  23
(2 rows)


postgres=# select vid, street, age, vname from voters;
 vid |     street      | age |  vname
-----+-----------------+-----+---------
   1 | Sannathi Street |  23 | Mani
   3 | Iqbal Street    |  21 | Mathu
   2 | East Street     |  22 | Karthik
   4 | Iqbal St        |  23 | Parthi
(4 rows)


postgres=# select vid, street, age, upper(vname) from voters;
 vid |     street      | age |  upper
-----+-----------------+-----+---------
   1 | Sannathi Street |  23 | MANI
   3 | Iqbal Street    |  21 | MATHU
   2 | East Street     |  22 | KARTHIK
   4 | Iqbal St        |  23 | PARTHI
(4 rows)


postgres=# select vid, street, age, lower(vname) from voters;
 vid |     street      | age |  lower
-----+-----------------+-----+---------
   1 | Sannathi Street |  23 | mani
   3 | Iqbal Street    |  21 | mathu
   2 | East Street     |  22 | karthik
   4 | Iqbal St        |  23 | parthi
(4 rows)


postgres=#