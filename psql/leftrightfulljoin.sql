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

postgres=# \d places;
                      Table "public.places"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 scode  | character(2)          |           |          |
 dname  | character varying(20) |           |          |
 place  | character varying(20) |           |          |


postgres=# create table dist(scode char(2), dname varchar(20));
CREATE TABLE
postgres=# insert into dist values('tn','chennai');
INSERT 0 1
postgres=# insert into dist values('tn','chengalpattu');
INSERT 0 1
postgres=# insert into dist values('tn','salem');
INSERT 0 1
postgres=# insert into dist values('tn','thanjavur');
INSERT 0 1
postgres=# insert into dist values('tn','thiruvaroor');
INSERT 0 1
postgres=# insert into dist values('tn','nelli');
INSERT 0 1
postgres=# slect * from dist;
ERROR:  syntax error at or near "slect"
LINE 1: slect * from dist;
        ^
postgres=# select * from dist;
 scode |    dname
-------+--------------
 tn    | chennai
 tn    | chengalpattu
 tn    | salem
 tn    | thanjavur
 tn    | thiruvaroor
 tn    | nelli
(6 rows)


postgres=# select * from places;
 scode |    dname     |   place
-------+--------------+------------
 tn    | chennai      | teynampet
 tn    | chennai      | anna nagar
 tn    | chennai      | Koyambedu
 tn    | chengalpattu | paranoor
 tn    | karoor       | ambiniyoor
(5 rows)


postgres=# select a.dname,b.place from dist a,places b where a.dname = b.dname;
    dname     |   place
--------------+------------
 chennai      | Koyambedu
 chennai      | anna nagar
 chennai      | teynampet
 chengalpattu | paranoor
(4 rows)


postgres=# select a.dname,b.place from dist a left join places b where a.dname = b.dname;
ERROR:  syntax error at or near "where"
LINE 1: ...ct a.dname,b.place from dist a left join places b where a.dn...
                                                             ^
postgres=# select a.dname,b.place from dist a left join places b on a.dname = b.dname;
    dname     |   place
--------------+------------
 chennai      | Koyambedu
 chennai      | anna nagar
 chennai      | teynampet
 chengalpattu | paranoor
 salem        |
 thanjavur    |
 thiruvaroor  |
 nelli        |
(8 rows)


postgres=# select count(*) from places;
 count
-------
     5
(1 row)


postgres=# select count(*) from dist;
 count
-------
     6
(1 row)


postgres=# select a.dname,b.place from dist a left right places b on a.dname = b.dname;
ERROR:  syntax error at or near "right"
LINE 1: select a.dname,b.place from dist a left right places b on a....
                                                ^
postgres=# select a.dname,b.place from dist a right join places b on a.dname = b.dname;
    dname     |   place
--------------+------------
 chennai      | Koyambedu
 chennai      | anna nagar
 chennai      | teynampet
 chengalpattu | paranoor
              | ambiniyoor
(5 rows)


postgres=# select a.dname,b.place from dist a left join places b on a.dname = b.dname;
    dname     |   place
--------------+------------
 chennai      | Koyambedu
 chennai      | anna nagar
 chennai      | teynampet
 chengalpattu | paranoor
 salem        |
 thanjavur    |
 thiruvaroor  |
 nelli        |
(8 rows)


postgres=# select a.dname,b.place from dist a left join places b on a.dname = b.dname where b.dname ISNULL;
    dname    | place
-------------+-------
 salem       |
 thanjavur   |
 thiruvaroor |
 nelli       |
(4 rows)


postgres=# select a.dname,b.place from dist a right join places b on a.dname = b.dname where a.dname IS NULL;
 dname |   place
-------+------------
       | ambiniyoor
(1 row)


postgres=# select * from atm_txns;
 txnid | acnum |          txntime           | txntype | amount | atmid
-------+-------+----------------------------+---------+--------+-------
  9001 | 78901 | 2022-01-19 15:10:48.945612 | w       |   2500 |  5001
  9002 | 78901 | 2022-01-19 15:11:05.639859 | w       |   1500 |  5001
  9003 | 78901 | 2022-01-19 15:11:20.812599 | d       |    500 |  5001
(3 rows)


postgres=# copy atm_txns to 'd:\\myatm.csv' delimiter ',' csv header;
COPY 3
postgres=#