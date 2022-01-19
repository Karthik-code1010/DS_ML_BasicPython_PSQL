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

postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
(1 row)


postgres=# insert into customers values (102,'Parthi','2019-09-15','par1998ab');
INSERT 0 1
postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
 102 | Parthi  | 2019-09-15 | par1998ab
(2 rows)


postgres=# create table accounts (cid integer not null, acum integer not null primary key, actype char(2),aod date,branch integer);
CREATE TABLE
postgres=# \d accounts;
                Table "public.accounts"
 Column |     Type     | Collation | Nullable | Default
--------+--------------+-----------+----------+---------
 cid    | integer      |           | not null |
 acum   | integer      |           | not null |
 actype | character(2) |           |          |
 aod    | date         |           |          |
 branch | integer      |           |          |
Indexes:
    "accounts_pkey" PRIMARY KEY, btree (acum)


postgres=# insert into accounts values(101,12345,'SB','2018-01-01',2001);
INSERT 0 1
postgres=# insert into accounts values(101,22346,'SB','2019-05-01',2002);
INSERT 0 1
postgres=# insert into accounts values(101,45897,'CA','2020-12-01',2001);
INSERT 0 1
postgres=# insert into accounts values(102,78901,'LA','2017-12-08',3001);
INSERT 0 1
postgres=# select * from accounts;
 cid | acum  | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=# create table atm_txns(txnid integer primary key,acnum integer,txntime timestamp,txntype char(1),amount integer,atmid integer);
CREATE TABLE
postgres=# \d atm_txns;
                        Table "public.atm_txns"
 Column  |            Type             | Collation | Nullable | Default
---------+-----------------------------+-----------+----------+---------
 txnid   | integer                     |           | not null |
 acnum   | integer                     |           |          |
 txntime | timestamp without time zone |           |          |
 txntype | character(1)                |           |          |
 amount  | integer                     |           |          |
 atmid   | integer                     |           |          |
Indexes:
    "atm_txns_pkey" PRIMARY KEY, btree (txnid)


postgres=# insert into atm_txns values(9001,78901,now(),'w',2500,5001);
INSERT 0 1
postgres=# insert into atm_txns values(9002,78901,now(),'w',1500,5001);
INSERT 0 1
postgres=# insert into atm_txns values(9003,78901,now(),'d',500,5001);
INSERT 0 1
postgres=# select * from atm_txns;
 txnid | acnum |          txntime           | txntype | amount | atmid
-------+-------+----------------------------+---------+--------+-------
  9001 | 78901 | 2022-01-19 13:07:48.964924 | w       |   2500 |  5001
  9002 | 78901 | 2022-01-19 13:08:16.102918 | w       |   1500 |  5001
  9003 | 78901 | 2022-01-19 13:08:33.439186 | d       |    500 |  5001
(3 rows)


postgres=# select * from accounts;
 cid | acum  | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
 102 | Parthi  | 2019-09-15 | par1998ab
(2 rows)


postgres=# drop table acconts;
ERROR:  table "acconts" does not exist
postgres=# drop table accounts;
DROP TABLE
postgres=# create table accounts (cid integer not null references customers (cid), acum integer not null primary key, actype char(2),aod date,branch integer);
CREATE TABLE
postgres=# \d accounts;
                Table "public.accounts"
 Column |     Type     | Collation | Nullable | Default
--------+--------------+-----------+----------+---------
 cid    | integer      |           | not null |
 acum   | integer      |           | not null |
 actype | character(2) |           |          |
 aod    | date         |           |          |
 branch | integer      |           |          |
Indexes:
    "accounts_pkey" PRIMARY KEY, btree (acum)
Foreign-key constraints:
    "accounts_cid_fkey" FOREIGN KEY (cid) REFERENCES customers(cid)


postgres=# insert into accounts values(101,12345,'SB','2018-01-01',2001);
INSERT 0 1
postgres=# insert into accounts values(101,22346,'SB','2019-05-01',2002);
INSERT 0 1
postgres=# insert into accounts values(101,45897,'CA','2020-12-01',2001);
INSERT 0 1
postgres=# insert into accounts values(102,78901,'LA','2017-12-08',3001);
INSERT 0 1
postgres=# select * from accounts;
 cid | acum  | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=# insert into accounts values (103, 18998, 'LA', '2017-12-08',4001);
ERROR:  insert or update on table "accounts" violates foreign key constraint "accounts_cid_fkey"
DETAIL:  Key (cid)=(103) is not present in table "customers".
postgres=# drop table atm_txns;
DROP TABLE
postgres=# create table atm_txns(txnid integer primary key,acnum integer references accounts (acnum),txntime timestamp,txntype char(1),amount integer,atmid integer);
ERROR:  column "acnum" referenced in foreign key constraint does not exist
postgres=# create table atm_txns(txnid integer primary key,acnum integer references accounts (acum),txntime timestamp,txntype char(1),amount integer,atmid integer);
CREATE TABLE
postgres=# \d atm_txns;
                        Table "public.atm_txns"
 Column  |            Type             | Collation | Nullable | Default
---------+-----------------------------+-----------+----------+---------
 txnid   | integer                     |           | not null |
 acnum   | integer                     |           |          |
 txntime | timestamp without time zone |           |          |
 txntype | character(1)                |           |          |
 amount  | integer                     |           |          |
 atmid   | integer                     |           |          |
Indexes:
    "atm_txns_pkey" PRIMARY KEY, btree (txnid)
Foreign-key constraints:
    "atm_txns_acnum_fkey" FOREIGN KEY (acnum) REFERENCES accounts(acum)


postgres=# select acnum from accounts;
ERROR:  column "acnum" does not exist
LINE 1: select acnum from accounts;
               ^
HINT:  Perhaps you meant to reference the column "accounts.acum".
postgres=# select acum from accounts;
 acum
-------
 12345
 22346
 45897
 78901
(4 rows)


postgres=# insert into atm_txns values(9001,78901,now(),'w',2500,5001);
INSERT 0 1
postgres=# insert into atm_txns values(9002,78901,now(),'w',1500,5001);
INSERT 0 1
postgres=# insert into atm_txns values(9003,78901,now(),'d',500,5001);
INSERT 0 1
postgres=# delete from accounts where acum = 78901;
ERROR:  update or delete on table "accounts" violates foreign key constraint "atm_txns_acnum_fkey" on table "atm_txns"
DETAIL:  Key (acum)=(78901) is still referenced from table "atm_txns".
postgres=# delete from atm_txns;
DELETE 3
postgres=# delete from accounts where acum = 78901;
DELETE 1
postgres=# select * from accounts;
 cid | acum  | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
(3 rows)


postgres=# drop table accouts;
ERROR:  table "accouts" does not exist
postgres=# drop table accounts;
ERROR:  cannot drop table accounts because other objects depend on it
DETAIL:  constraint atm_txns_acnum_fkey on table atm_txns depends on table accounts
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
postgres=# drop table atm-txns;
ERROR:  syntax error at or near "-"
LINE 1: drop table atm-txns;
                      ^
postgres=# drop table atm_txns;
DROP TABLE
postgres=# deop table accounts;
ERROR:  syntax error at or near "deop"
LINE 1: deop table accounts;
        ^
postgres=# drop table accounts;
DROP TABLE
postgres=# \d customers;
                    Table "public.customers"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 cid    | integer               |           | not null |
 cname  | character varying(20) |           |          |
 doc    | date                  |           |          |
 pan    | character varying(20) |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# alter table customers add column address text;
ALTER TABLE
postgres=# \d customers;
                     Table "public.customers"
 Column  |         Type          | Collation | Nullable | Default
---------+-----------------------+-----------+----------+---------
 cid     | integer               |           | not null |
 cname   | character varying(20) |           |          |
 doc     | date                  |           |          |
 pan     | character varying(20) |           |          |
 address | text                  |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# alter table customer alter column address type varchar(100);
ERROR:  relation "customer" does not exist
postgres=# alter table customers alter column address type varchar(100);
ALTER TABLE
postgres=# \d customers;
                     Table "public.customers"
 Column  |          Type          | Collation | Nullable | Default
---------+------------------------+-----------+----------+---------
 cid     | integer                |           | not null |
 cname   | character varying(20)  |           |          |
 doc     | date                   |           |          |
 pan     | character varying(20)  |           |          |
 address | character varying(100) |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# alter table customer add column aadhaar varchar(10);
ERROR:  relation "customer" does not exist
postgres=# alter table customers add column aadhaar varchar(10);
ALTER TABLE
postgres=# alter table customers drop column aadhaar;
ALTER TABLE
postgres=# \d customer;
Did not find any relation named "customer".
postgres=# \d customers;
                     Table "public.customers"
 Column  |          Type          | Collation | Nullable | Default
---------+------------------------+-----------+----------+---------
 cid     | integer                |           | not null |
 cname   | character varying(20)  |           |          |
 doc     | date                   |           |          |
 pan     | character varying(20)  |           |          |
 address | character varying(100) |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# create table mybill(bid integer not null primary key,amount integer, bdate timestamp);
CREATE TABLE
postgres=# \d mybill;
                         Table "public.mybill"
 Column |            Type             | Collation | Nullable | Default
--------+-----------------------------+-----------+----------+---------
 bid    | integer                     |           | not null |
 amount | integer                     |           |          |
 bdate  | timestamp without time zone |           |          |
Indexes:
    "mybill_pkey" PRIMARY KEY, btree (bid)


postgres=# insert into mybill values(1,100,now());
INSERT 0 1
postgres=# insert into mybill values(1,110,now());
ERROR:  duplicate key value violates unique constraint "mybill_pkey"
DETAIL:  Key (bid)=(1) already exists.
postgres=# insert into mybill values(2,110,now());
INSERT 0 1
postgres=# insert into mybill values(3,120,now());
INSERT 0 1
postgres=# insert into mybill values(4,130,now());
INSERT 0 1
postgres=# select * from mybill;
 bid | amount |           bdate
-----+--------+----------------------------
   1 |    100 | 2022-01-19 14:50:14.839807
   2 |    110 | 2022-01-19 14:50:32.592613
   3 |    120 | 2022-01-19 14:50:42.058564
   4 |    130 | 2022-01-19 14:50:50.342971
(4 rows)


postgres=# drop table mybill;
DROP TABLE
postgres=# create table mybill(bid serial primary key,amount integer, bdate timestamp);
CREATE TABLE
postgres=# \d mybill;
                                       Table "public.mybill"
 Column |            Type             | Collation | Nullable |               Default
--------+-----------------------------+-----------+----------+-------------------------------------
 bid    | integer                     |           | not null | nextval('mybill_bid_seq'::regclass)
 amount | integer                     |           |          |
 bdate  | timestamp without time zone |           |          |
Indexes:
    "mybill_pkey" PRIMARY KEY, btree (bid)


postgres=# select * from mybill;
 bid | amount | bdate
-----+--------+-------
(0 rows)


postgres=# insert into mybill (amount, bdate) values (110, now());
INSERT 0 1
postgres=# insert into mybill (amount, bdate) values (120, now());
INSERT 0 1
postgres=# insert into mybill (amount, bdate) values (130, now());
INSERT 0 1
postgres=# select * from mybill;
 bid | amount |           bdate
-----+--------+----------------------------
   1 |    110 | 2022-01-19 14:56:05.788944
   2 |    120 | 2022-01-19 14:56:13.004828
   3 |    130 | 2022-01-19 14:56:23.398223
(3 rows)


postgres=# \d customers;
                     Table "public.customers"
 Column  |          Type          | Collation | Nullable | Default
---------+------------------------+-----------+----------+---------
 cid     | integer                |           | not null |
 cname   | character varying(20)  |           |          |
 doc     | date                   |           |          |
 pan     | character varying(20)  |           |          |
 address | character varying(100) |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# alter table customers drop column address;
ALTER TABLE
postgres=# \d customers;
                    Table "public.customers"
 Column |         Type          | Collation | Nullable | Default
--------+-----------------------+-----------+----------+---------
 cid    | integer               |           | not null |
 cname  | character varying(20) |           |          |
 doc    | date                  |           |          |
 pan    | character varying(20) |           |          |
Indexes:
    "customers_pkey" PRIMARY KEY, btree (cid)


postgres=# \d accounts;
Did not find any relation named "accounts".
postgres=# create table accounts(cid integer not null references customers(cid),acnum integer not null primary key,actype char(2),aod date,branch integer);
CREATE TABLE
postgres=# insert into accounts values (101, 12345, 'SB', '2018-01-01', 2001);
INSERT 0 1
postgres=# insert into accounts values (101, 22346, 'SB', '2019-05-01', 2002);
INSERT 0 1
postgres=# insert into accounts values (101, 45897, 'CA', '2020-12-01', 2001);
INSERT 0 1
postgres=# insert into accounts values (102, 78901, 'LA', '2017-12-08', 3001);
INSERT 0 1
postgres=# select * from accounts;
 cid | acnum | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
 102 | Parthi  | 2019-09-15 | par1998ab
(2 rows)


postgres=# create table atm_txns
postgres-# (
postgres(# txnid integer primary key,
postgres(# acnum integer references accounts (acnum),
postgres(# txntime timestamp,
postgres(# txntype char(1),
postgres(# amount integer,
postgres(# atmid integer
postgres(# );
CREATE TABLE
postgres=# insert into atm_txns values(9001,78901, now(),'w',2500, 5001);
INSERT 0 1
postgres=# insert into atm_txns values(9002,78901, now(),'w',1500, 5001);
INSERT 0 1
postgres=# insert into atm_txns values(9003,78901, now(),'d',500, 5001);
INSERT 0 1
postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
 102 | Parthi  | 2019-09-15 | par1998ab
(2 rows)


postgres=# select * from accounts;
 cid | acnum | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=# select * from atm_txns;
 txnid | acnum |          txntime           | txntype | amount | atmid
-------+-------+----------------------------+---------+--------+-------
  9001 | 78901 | 2022-01-19 15:10:48.945612 | w       |   2500 |  5001
  9002 | 78901 | 2022-01-19 15:11:05.639859 | w       |   1500 |  5001
  9003 | 78901 | 2022-01-19 15:11:20.812599 | d       |    500 |  5001
(3 rows)


postgres=# select c.cid, c.cname, pan, a.acnum, actype, aod, branch from customers c, accounts a;
 cid |  cname  |    pan    | acnum | actype |    aod     | branch
-----+---------+-----------+-------+--------+------------+--------
 101 | Karthik | igp1998pn | 12345 | SB     | 2018-01-01 |   2001
 102 | Parthi  | par1998ab | 12345 | SB     | 2018-01-01 |   2001
 101 | Karthik | igp1998pn | 22346 | SB     | 2019-05-01 |   2002
 102 | Parthi  | par1998ab | 22346 | SB     | 2019-05-01 |   2002
 101 | Karthik | igp1998pn | 45897 | CA     | 2020-12-01 |   2001
 102 | Parthi  | par1998ab | 45897 | CA     | 2020-12-01 |   2001
 101 | Karthik | igp1998pn | 78901 | LA     | 2017-12-08 |   3001
 102 | Parthi  | par1998ab | 78901 | LA     | 2017-12-08 |   3001
(8 rows)


postgres=# select c.cid, c.cname, pan, a.acnum, actype, aod, branch from customers c, accounts a where c.cid = a.cid;
 cid |  cname  |    pan    | acnum | actype |    aod     | branch
-----+---------+-----------+-------+--------+------------+--------
 101 | Karthik | igp1998pn | 12345 | SB     | 2018-01-01 |   2001
 101 | Karthik | igp1998pn | 22346 | SB     | 2019-05-01 |   2002
 101 | Karthik | igp1998pn | 45897 | CA     | 2020-12-01 |   2001
 102 | Parthi  | par1998ab | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=#