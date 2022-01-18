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


postgres=# select cstate, sum(cnew) from c19 group by cstate;
 cstate | sum
--------+-----
 tn     | 678
 ap     | 716
 up     | 802
(3 rows)


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


postgres=# select cstate, sum(crecov) from c19 group by cstate;
 cstate | sum
--------+-----
 tn     | 686
 ap     | 729
 up     | 990
(3 rows)


postgres=# select cstate, sum(crecov) from c19 group by cstate having sum(crecov) > 750;
 cstate | sum
--------+-----
 up     | 990
(1 row)


postgres=# select * from voters;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
   4 | Iqbal St        | Parthi  | 2022-01-18 13:58:31.571701 |  23
(4 rows)


postgres=# select vname, length(vname) from voters;
  vname  | length
---------+--------
 Mani    |      4
 Mathu   |      5
 Karthik |      7
 Parthi  |      6
(4 rows)


postgres=# select vname, length(vname) length(street) from voters;
ERROR:  syntax error at or near "("
LINE 1: select vname, length(vname) length(street) from voters;
                                          ^
postgres=# select vname, length(vname) ,length(street) from voters;
  vname  | length | length
---------+--------+--------
 Mani    |      4 |     15
 Mathu   |      5 |     12
 Karthik |      7 |     11
 Parthi  |      6 |      8
(4 rows)


postgres=# select street, left(street, 4) from voters;
     street      | left
-----------------+------
 Sannathi Street | Sann
 Iqbal Street    | Iqba
 East Street     | East
 Iqbal St        | Iqba
(4 rows)


postgres=# select street, right(street, 4) from voters;
     street      | right
-----------------+-------
 Sannathi Street | reet
 Iqbal Street    | reet
 East Street     | reet
 Iqbal St        | l St
(4 rows)


postgres=# select street, reverse(street, 4) from voters;
ERROR:  function reverse(character varying, integer) does not exist
LINE 1: select street, reverse(street, 4) from voters;
                       ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
postgres=# select street, reverse(street) from voters;
     street      |     reverse
-----------------+-----------------
 Sannathi Street | teertS ihtannaS
 Iqbal Street    | teertS labqI
 East Street     | teertS tsaE
 Iqbal St        | tS labqI
(4 rows)


postgres=# select street, substr(street, 2, 3) from voters;
     street      | substr
-----------------+--------
 Sannathi Street | ann
 Iqbal Street    | qba
 East Street     | ast
 Iqbal St        | qba
(4 rows)


postgres=# select * from voters;
 vid |     street      |  vname  |         created_on         | age
-----+-----------------+---------+----------------------------+-----
   1 | Sannathi Street | Mani    | 2022-01-18 13:43:18.546965 |  23
   3 | Iqbal Street    | Mathu   | 2022-01-18 13:43:59.945704 |  21
   2 | East Street     | Karthik | 2022-01-18 13:43:35.948766 |  22
   4 | Iqbal St        | Parthi  | 2022-01-18 13:58:31.571701 |  23
(4 rows)


postgres=# select created_on, extract(year from created_on) from voters;
         created_on         | extract
----------------------------+---------
 2022-01-18 13:43:18.546965 |    2022
 2022-01-18 13:43:59.945704 |    2022
 2022-01-18 13:43:35.948766 |    2022
 2022-01-18 13:58:31.571701 |    2022
(4 rows)


postgres=# select created_on, extract(month from created_on) from voters;
         created_on         | extract
----------------------------+---------
 2022-01-18 13:43:18.546965 |       1
 2022-01-18 13:43:59.945704 |       1
 2022-01-18 13:43:35.948766 |       1
 2022-01-18 13:58:31.571701 |       1
(4 rows)


postgres=# select created_on, extract(day from created_on) from voters;
         created_on         | extract
----------------------------+---------
 2022-01-18 13:43:18.546965 |      18
 2022-01-18 13:43:59.945704 |      18
 2022-01-18 13:43:35.948766 |      18
 2022-01-18 13:58:31.571701 |      18
(4 rows)


postgres=# select created_on, extract(hour from created_on) from voters;
         created_on         | extract
----------------------------+---------
 2022-01-18 13:43:18.546965 |      13
 2022-01-18 13:43:59.945704 |      13
 2022-01-18 13:43:35.948766 |      13
 2022-01-18 13:58:31.571701 |      13
(4 rows)


postgres=# select created_on, extract(minute from created_on) from voters;
         created_on         | extract
----------------------------+---------
 2022-01-18 13:43:18.546965 |      43
 2022-01-18 13:43:59.945704 |      43
 2022-01-18 13:43:35.948766 |      43
 2022-01-18 13:58:31.571701 |      58
(4 rows)


postgres=# select created_on, extract(second from created_on) from voters;
         created_on         |  extract
----------------------------+-----------
 2022-01-18 13:43:18.546965 | 18.546965
 2022-01-18 13:43:59.945704 | 59.945704
 2022-01-18 13:43:35.948766 | 35.948766
 2022-01-18 13:58:31.571701 | 31.571701
(4 rows)


postgres=# select created_on, extract(millisecond from created_on) from voters;
         created_on         |  extract
----------------------------+-----------
 2022-01-18 13:43:18.546965 | 18546.965
 2022-01-18 13:43:59.945704 | 59945.704
 2022-01-18 13:43:35.948766 | 35948.766
 2022-01-18 13:58:31.571701 | 31571.701
(4 rows)


postgres=# select created_on, extract(microsecond from created_on) from voters;
         created_on         | extract
----------------------------+----------
 2022-01-18 13:43:18.546965 | 18546965
 2022-01-18 13:43:59.945704 | 59945704
 2022-01-18 13:43:35.948766 | 35948766
 2022-01-18 13:58:31.571701 | 31571701
(4 rows)


postgres=# select created_on, extract(microsecond from created_on) extract(hour from created_on) from voters;
ERROR:  syntax error at or near "("
LINE 1: ...d_on, extract(microsecond from created_on) extract(hour from...
                                                             ^
postgres=# select created_on, extract(microsecond from created_on), extract(hour from created_on) from voters;
         created_on         | extract  | extract
----------------------------+----------+---------
 2022-01-18 13:43:18.546965 | 18546965 |      13
 2022-01-18 13:43:59.945704 | 59945704 |      13
 2022-01-18 13:43:35.948766 | 35948766 |      13
 2022-01-18 13:58:31.571701 | 31571701 |      13
(4 rows)


postgres=# select created_on, extract(microsecond from created_on), extract(QUARTER from created_on) from voters;
         created_on         | extract  | extract
----------------------------+----------+---------
 2022-01-18 13:43:18.546965 | 18546965 |       1
 2022-01-18 13:43:59.945704 | 59945704 |       1
 2022-01-18 13:43:35.948766 | 35948766 |       1
 2022-01-18 13:58:31.571701 | 31571701 |       1
(4 rows)


postgres=#