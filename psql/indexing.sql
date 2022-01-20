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

postgres=# select * from atm_txns;
 txnid | acnum |          txntime           | txntype | amount | atmid
-------+-------+----------------------------+---------+--------+-------
  9001 | 78901 | 2022-01-19 15:10:48.945612 | w       |   2500 |  5001
  9002 | 78901 | 2022-01-19 15:11:05.639859 | w       |   1500 |  5001
  9003 | 78901 | 2022-01-19 15:11:20.812599 | d       |    500 |  5001
(3 rows)


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
    "atm_txns_acnum_fkey" FOREIGN KEY (acnum) REFERENCES accounts(acnum)


postgres=# \timing on
Timing is on.
postgres=# select * from atm_txns;
 txnid | acnum |          txntime           | txntype | amount | atmid
-------+-------+----------------------------+---------+--------+-------
  9001 | 78901 | 2022-01-19 15:10:48.945612 | w       |   2500 |  5001
  9002 | 78901 | 2022-01-19 15:11:05.639859 | w       |   1500 |  5001
  9003 | 78901 | 2022-01-19 15:11:20.812599 | d       |    500 |  5001
(3 rows)


Time: 5.253 ms
postgres=# select * from customers;
 cid |  cname  |    doc     |    pan
-----+---------+------------+-----------
 101 | Karthik | 2018-01-01 | igp1998pn
 102 | Parthi  | 2019-09-15 | par1998ab
(2 rows)


Time: 31.271 ms
postgres=# selct * from accouns;
ERROR:  syntax error at or near "selct"
LINE 1: selct * from accouns;
        ^
Time: 26.571 ms
postgres=# select * from accouns;
ERROR:  relation "accouns" does not exist
LINE 1: select * from accouns;
                      ^
Time: 43.556 ms
postgres=# select * from accounts;
 cid | acnum | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


Time: 5.090 ms
postgres=# \timing off
Timing is off.
postgres=# select * from accounts;
 cid | acnum | actype |    aod     | branch
-----+-------+--------+------------+--------
 101 | 12345 | SB     | 2018-01-01 |   2001
 101 | 22346 | SB     | 2019-05-01 |   2002
 101 | 45897 | CA     | 2020-12-01 |   2001
 102 | 78901 | LA     | 2017-12-08 |   3001
(4 rows)


postgres=#
postgres=# \timing on
Timing is on.
postgres=# create table large_data(name varchar(100),ccnumber varchar(30),city varchar(30), age integer, phone varhar(20));
ERROR:  type "varhar" does not exist
LINE 1: ... varchar(30),city varchar(30), age integer, phone varhar(20)...
                                                             ^
Time: 85.250 ms
postgres=# create table large_data(name varchar(100),ccnumber varchar(30),city varchar(30), age integer, phone varchar(20));
CREATE TABLE
Time: 68.601 ms
postgres=# \d large_data;
                     Table "public.large_data"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 name     | character varying(100) |           |          |
 ccnumber | character varying(30)  |           |          |
 city     | character varying(30)  |           |          |
 age      | integer                |           |          |
 phone    | character varying(20)  |           |          |


postgres=# copy large_data from 'd:\\convertcsv.csv' delimiter ',' csv header;
COPY 100000
Time: 1751.024 ms (00:01.751)
postgres=# select count(*) from large_data;
 count
--------
 100000
(1 row)


Time: 76.884 ms
postgres=# select * from large_data where name like 'Georg%';
        name         |     ccnumber     |   city    |   age   |     phone
---------------------+------------------+-----------+---------+----------------
 Georgie Anderson    | 5018185167892429 | Tivpuuk   | -209495 | (224) 571-6681
 Georgia Christensen | 6377193010086747 | Tizezja   | -418587 | (834) 873-4019
 Georgia Nguyen      | 5610386598830226 | Wevgoriz  |  -73523 | (556) 513-8699
 Georgia Adkins      | 5610825975409187 | Dosiinu   |  848689 | (736) 642-9390
 Georgia Fowler      | 4246173776008964 | Zirmeha   |  174524 | (426) 909-9155
 Georgie Rice        | 5103553780956093 | Zepvudor  |  -72839 | (456) 392-2498
 George Harper       | 3528447660315524 | Boaluoki  |  391266 | (861) 586-2328
 George Morrison     | 6296530367012933 | Sogaon    |  901775 | (619) 409-2330
 Georgie Harper      | 5480100879920599 | Fefanbih  | -284289 | (606) 985-4937
 George Cannon       | 5018010005229024 | Cifido    |  243505 | (738) 414-5477
 George Owens        | 349288843854432  | Hezlotuk  |  334564 | (635) 444-4288
 Georgia Hansen      | 342627626890500  | Upjahew   |  321545 | (857) 661-1729
 Georgia Carson      | 4026310263094273 | Igahehmog |  864705 | (211) 437-3824
 Georgie Doyle       | 5018629937564628 | Rothuro   | -309055 | (679) 931-8527
 Georgia McGuire     | 6214737633101601 | Atuvuog   | -606903 | (952) 833-1930
 Georgie Hardy       | 4903269146730339 | Vetnawi   | -755164 | (615) 409-1995
 Georgie Morton      | 6334543022232063 | Iwdoje    |  747153 | (254) 606-1529
 Georgie Murray      | 6011469868899361 | Gojborra  |  347601 | (331) 959-9434
 Georgia Price       | 5456300128162072 | Zutali    | -442407 | (269) 652-9438
 George Richardson   | 6011692933663070 | Asinumuje |  606878 | (842) 671-6366
 Georgie Day         | 346113854540204  | Licvopca  |  140998 | (255) 211-3764
 Georgie Price       | 5018672808955996 | Awduno    |  957960 | (479) 393-4158
 George Peters       | 30002351644505   | Mucfanhak |  316678 | (886) 766-7018
 George Adams        | 6334421928043019 | Vizbaru   |   72673 | (217) 221-5905
 Georgia Griffith    | 4903347798734492 | Lukdusika | -343108 | (801) 880-7494
 Georgie Ray         | 5610002196234113 | Odolagji  | -168360 | (276) 853-8757
 George Larson       | 5018802712870805 | Zeibne    | -754696 | (283) 650-3554
 George Nunez        | 6260583839144976 | Enifidru  | -701023 | (480) 385-3082
 George May          | 3528958645449881 | Roevemiv  |  434962 | (438) 798-2383
 Georgia Lane        | 6304500190520543 | Roretoje  |  933573 | (558) 443-9108
 Georgia Collier     | 5610844383216845 | Bovaldi   | -245827 | (674) 896-2987
 George Hughes       | 5610645835449052 | Rucroil   | -978342 | (534) 757-5704
 George Maxwell      | 5610562881719207 | Zitonka   |  176714 | (506) 733-6742
 Georgia Leonard     | 30037933803724   | Rovvirfek |  862658 | (245) 874-4211
 Georgia McKenzie    | 5018380926979514 | Zauvepu   |  368019 | (940) 654-3496
 Georgie Schmidt     | 5160408030059828 | Sesloibo  |  894234 | (513) 540-5901
 Georgia Summers     | 5477963201697275 | Hiaptep   | -447427 | (243) 379-6460
 George Daniel       | 6011568597646421 | Nogkivfe  |  393898 | (659) 620-1561
 Georgia Day         | 6304780327919947 | Dihhane   |   73803 | (679) 337-9983
 George Terry        | 201409364875229  | Ebsaruh   |  181004 | (329) 469-1303
 George Clark        | 4903939204488240 | Ceefiguh  | -649774 | (725) 880-2890
 Georgie Mendoza     | 6011850459223469 | Pocjalwa  | -438075 | (632) 620-8722
 Georgia Daniel      | 4302758314829391 | Eccewer   |  542352 | (722) 618-6673
 George Soto         | 6222184281489121 | Dajocvu   | -639138 | (836) 828-3247
 Georgie Higgins     | 6370607194410610 | Cezjido   |  799496 | (381) 458-9104
 Georgie French      | 345230727035021  | Biwiovu   | -958279 | (258) 630-1840
 Georgia Matthews    | 5141912545965712 | Cipdijo   | -351757 | (711) 956-6607
 Georgia Valdez      | 5199875448846191 | Naduktus  | -258284 | (204) 646-3571
 Georgie Washington  | 36827401383959   | Sulaker   |  280185 | (751) 444-3871
 Georgie Hopkins     | 6334413405436568 | Godatroj  | -218337 | (470) 585-2942
 Georgia Jackson     | 5402529078292928 | Febgubu   | -732244 | (637) 498-8210
 Georgia Grant       | 6011091815076685 | Todkakgen |  603044 | (208) 865-3738
 George Welch        | 5610940636553859 | Vabatig   |  348946 | (532) 984-1462
 Georgia Munoz       | 4026853271652970 | Fifbagle  | -614389 | (684) 942-8688
 George Jenkins      | 5018938506924240 | Zucmidu   | -111191 | (233) 401-4711
 George Snyder       | 36317883491629   | Vukavpar  | -145019 | (886) 826-1554
 Georgia Woods       | 6334814789801980 | Watunpal  |    7481 | (454) 666-5387
 George Dean         | 343892234598536  | Favankek  | -574216 | (230) 796-3710
 George Robertson    | 5183518057020637 | Ehuihja   |  830223 | (664) 395-7441
 George Rogers       | 3528415232531084 | Wudlaazu  |  436188 | (352) 898-3832
 Georgia Fernandez   | 6011097466848397 | Hivabili  |  776786 | (569) 582-3123
 George Nguyen       | 30021284276243   | Cihbezuji | -226128 | (607) 554-2669
 George Norris       | 6228254511408722 | Azojumzi  | -543924 | (914) 768-8197
 Georgie Quinn       | 30004341692487   | Wovebnip  |  399656 | (869) 907-7602
 George Harvey       | 5418868333887862 | Edaubuluf |  801728 | (727) 398-6898
 Georgie Schwartz    | 30049803191601   | Sazdukap  |  776051 | (766) 324-7268
 Georgie Oliver      | 4903830163800105 | Buhvuvaw  | -476493 | (973) 249-6170
 Georgia Clark       | 5018987469913740 | Korrasde  | -843384 | (885) 716-3604
 George Garrett      | 4026176675985493 | Hawnigiz  |   23684 | (836) 912-8622
 George Weber        | 6304595032762139 | Upsilpa   |  588467 | (382) 300-1796
 George Carpenter    | 201450125753495  | Sorgoson  | -266689 | (526) 224-5292
 Georgie Gilbert     | 30048537127543   | Ucnugam   | -259782 | (700) 286-9342
 Georgie Briggs      | 343350845525273  | Ipuzipra  | -966015 | (278) 691-4119
 Georgie Ruiz        | 6279750290566943 | Ubuktoj   |  287373 | (866) 483-3984
 Georgia Leonard     | 4903098578841755 | Ulfaum    | -115067 | (415) 886-8260
 Georgia Alvarado    | 6334949957454251 | Toaseni   | -885515 | (310) 444-6074
 Georgie Hoffman     | 6370885485713286 | Larare    | -105353 | (327) 626-6500
 Georgia Schwartz    | 30033528857548   | Ruzcudzo  | -369501 | (745) 829-8146
 Georgie Todd        | 6304003499696320 | Fuzagmut  |  414122 | (956) 341-5966
 George Hines        | 346592830488275  | Kevuwo    |  756480 | (200) 450-6267
 Georgia Colon       | 5401379268159177 | Jegockek  | -625754 | (670) 500-7757
 Georgia Long        | 5130728860505682 | Wogsodce  | -788328 | (947) 888-3836
 George Hopkins      | 201425907524330  | Istomi    | -774660 | (988) 536-9954
 Georgia Matthews    | 4903322116469469 | Pobiwirok |  443183 | (589) 839-6546
 George Goodwin      | 6011143072543335 | Fodogeh   |  582573 | (572) 996-8632
 George Montgomery   | 4903147347887761 | Hihufi    |  281073 | (630) 340-7965
 Georgie Swanson     | 6373999049610693 | Vukafza   |  962450 | (266) 822-5875
 Georgie Wheeler     | 6372142043425617 | Panejvis  |  713440 | (452) 531-2762
 Georgie Rodriguez   | 6293327384786323 | Ofiejlo   |  357296 | (877) 588-7298
 Georgie Alvarez     | 4903612523893784 | Sinmono   | -138266 | (515) 585-3729
 George Roberson     | 5171510629510520 | Hiehfos   |  898359 | (665) 357-2068
 Georgie Freeman     | 30008818149459   | Dezmahjar |    6704 | (246) 575-6720
 George Herrera      | 6231670236980692 | Inufrew   | -209949 | (521) 921-6250
 Georgie West        | 30067192600131   | Jukjepmec | -487941 | (330) 992-5742
 Georgia Sutton      | 30056367702541   | Ukawiklo  |  926063 | (213) 443-5087
 George George       | 30000780301994   | Bisugge   |   -7242 | (441) 334-6252
 Georgia Griffith    | 5018774715380233 | Tifbactut | -604962 | (334) 563-8950
 Georgia Ball        | 340946399431447  | Bukiftak  |  768866 | (828) 869-1203
 Georgia Graves      | 6213588297641403 | Cewsidi   | -392489 | (812) 941-9582
 George Roy          | 6248158153000034 | Zemukto   | -970080 | (374) 269-7561
 Georgia Robertson   | 5610705649687030 | Ijfekot   |  941170 | (531) 485-4635
 Georgie Garner      | 6257174487312415 | Efviwba   |  995596 | (208) 249-7749
 George Martin       | 6263063556723614 | Nihuow    | -353284 | (442) 554-3438
 George Rowe         | 6011091252628980 | Okorane   | -501944 | (539) 658-2887
 Georgie Cross       | 4903575259564251 | Tafliwa   |  738317 | (873) 711-7359
 Georgia Ortega      | 4903582234874722 | Fatmesi   |  433500 | (815) 333-7555
 Georgie Hughes      | 4572990211442167 | Bujuvzal  |  -59562 | (805) 734-2572
 Georgie Colon       | 30044588155723   | Idlizsin  | -343030 | (516) 931-9933
 Georgia Montgomery  | 6334873755037938 | Mulvobsi  | -903053 | (726) 586-5235
 Georgia Estrada     | 6334122773614181 | Tinafot   |  588464 | (678) 782-8853
 Georgia Roy         | 4903306443827499 | Retojav   |  785782 | (639) 636-1815
 Georgie Rice        | 3528398559370254 | Raebla    |  666681 | (509) 660-5162
 Georgie Casey       | 4126444728609695 | Alanuvig  |  347363 | (229) 915-4540
 Georgia Rios        | 201470865420238  | Savackaj  |  665508 | (965) 612-2658
 Georgia Washington  | 201481822698279  | Tobnazeru |  508037 | (582) 447-6937
 Georgie Garcia      | 5610986123158371 | Utufefow  | -919021 | (662) 241-8562
 Georgia Keller      | 4026346386552268 | Ibiapotil |  945772 | (879) 823-6645
 Georgie Wilson      | 6011397307792626 | Sijutap   | -729973 | (267) 400-7680
 Georgie McKenzie    | 5018833259963638 | Didholo   |  709420 | (819) 810-3914
 Georgia Jenkins     | 3528992940130375 | Edonoir   |  572262 | (563) 605-1614
 Georgia Gibson      | 5610083477321886 | Mokobca   |  950477 | (953) 650-1861
 Georgia Oliver      | 201499857104740  | Ehlausa   |  814521 | (378) 369-2752
 Georgia Campbell    | 30082451368718   | Kamahiz   | -591354 | (361) 722-6440
 Georgie Rose        | 6271037796991793 | Bonpadmu  |  725851 | (760) 299-9964
 George Guzman       | 4164810761935234 | Arisalu   | -338496 | (543) 823-4197
 George Taylor       | 6246753498595847 | Gipmajnin | -285970 | (930) 846-2168
 Georgia Walton      | 345035301361481  | Cuopurec  | -775884 | (771) 986-6924
 Georgie Cummings    | 6011708686133044 | Akeavoge  |  864056 | (479) 402-3639
 George Wise         | 5018244178655356 | Anefela   | -938182 | (305) 389-5292
 George Harrison     | 36218319323032   | Kuwtapa   | -582206 | (327) 734-6441
 Georgia Boyd        | 6334384465133801 | Jugepoju  |  709478 | (832) 986-7968
 Georgie Little      | 5191343787268392 | Buwfutih  |  702903 | (640) 670-8661
 Georgia Nash        | 36124182507901   | Wavpicloc |  265729 | (318) 958-9267
 Georgie Young       | 3528961408719599 | Dajihdi   | -440207 | (908) 911-2081
 Georgia George      | 346714568139868  | Getasus   | -558760 | (824) 221-4008
 Georgie Thomas      | 5018027096722717 | Udgoku    | -140592 | (575) 975-9805
 George Rice         | 6272660849085591 | Irocijfah | -916873 | (411) 606-5995
 Georgia Bridges     | 36557883931526   | Wofuwet   | -224994 | (314) 353-8835
 George Garrett      | 4240429542074227 | Kehaezu   |  468314 | (650) 508-1387
 George Pratt        | 30092717991708   | Odewuco   |  858805 | (943) 304-6006
 Georgia Ortiz       | 5018548103296635 | Cebbedel  | -687447 | (763) 905-6630
 George Perry        | 6334729974415117 | Falokecu  | -755038 | (755) 545-9457
 Georgie Mendoza     | 201490383507415  | Jedejisif | -262873 | (888) 842-1320
 George Bowen        | 6334143351693579 | Cejepjak  |  724820 | (925) 496-8829
 Georgie Maldonado   | 3528550952864677 | Piluzo    | -997062 | (701) 563-4093
 George Fletcher     | 6334345273214653 | Rirakri   | -889333 | (231) 970-4516
 George McCoy        | 5442044267288614 | Ohjega    |  460339 | (711) 410-4879
 George Stevens      | 36188484353827   | Zorcuhtaj | -672085 | (757) 714-4225
 Georgie Simon       | 6334761187334546 | Banmobub  | -832848 | (622) 424-1708
 Georgie Barber      | 5018237712294294 | Nofodku   | -336759 | (824) 961-9740
 George Doyle        | 5133521505121271 | Wuuhlev   |  944983 | (482) 305-3392
 George Pierce       | 6264532624393765 | Zedhogsiw |  791994 | (531) 533-8292
 Georgia Myers       | 30001448609703   | Sutarvo   | -446624 | (311) 327-9450
 Georgia Reynolds    | 6264496675270316 | Fowvutvo  |  687112 | (977) 618-8829
 George Walton       | 4026265593686877 | Vukumoza  | -480649 | (438) 274-6012
 Georgia Reese       | 36696793927271   | Zapatah   | -337504 | (230) 664-8785
 Georgia Knight      | 6377062398855520 | Ogiumrac  | -410048 | (885) 350-8666
 Georgie Clark       | 3528234818190656 | Picobwa   | -717871 | (611) 597-5694
 George Ward         | 36018477304117   | Ovumosuh  |  512491 | (428) 637-6540
 George Richardson   | 5186159639622058 | Womibvin  | -533865 | (882) 373-4047
 George Robertson    | 36553265190625   | Uzopipop  | -895741 | (262) 249-2958
 Georgia Guzman      | 30085323578380   | Ivcavo    |  169679 | (214) 285-1845
 Georgia Garner      | 5018236305141193 | Denolpev  |  603757 | (240) 649-4918
 George Stephens     | 5610275224231000 | Atoakeman | -465553 | (543) 864-7874
 George Kelley       | 201430615052871  | Ludnasrop | -584854 | (943) 533-5728
 Georgia Oliver      | 5610583747956221 | Pabhutdo  |  613989 | (575) 651-7749
 Georgie Copeland    | 340165376983102  | Ilagenew  | -110281 | (907) 742-8021
 George Douglas      | 4903007007789162 | Walesir   |  126995 | (410) 303-6944
 Georgia Watkins     | 5402798134456260 | Tivakrel  |  464140 | (908) 981-1859
 Georgia Paul        | 201416078590358  | Rifsave   | -530567 | (259) 288-9212
 Georgie Harmon      | 349909428626693  | Teghebe   |  191323 | (264) 277-5474
 Georgie Walters     | 6011724547235811 | Kowgekves |  373130 | (640) 871-9196
 George Garza        | 6304478080200452 | Ivvecvo   |  -64705 | (457) 862-1709
 Georgia Baldwin     | 6304256972842353 | Rogowauw  | -415757 | (645) 843-7261
 Georgie Ramsey      | 346136047875088  | Mircomkac | -891054 | (425) 821-2099
 Georgie Nash        | 30069645788661   | Rifmavcim |  249098 | (372) 581-4350
 Georgia Castro      | 5018272997607423 | Fipucgu   |   99306 | (326) 890-8780
 George Phelps       | 4581279995848206 | Itokupi   | -572286 | (327) 812-9747
 Georgie Sanchez     | 5610208359918281 | Tehtefcag |   15290 | (205) 376-3879
 George Keller       | 4196227559786327 | Wunnehad  |  716548 | (627) 797-4017
 George Colon        | 30089126997573   | Sewtipu   |   51426 | (912) 855-2093
 Georgia Caldwell    | 3528568722354704 | Ituderho  |  156795 | (769) 991-6625
 George Zimmerman    | 30007518772727   | Uhlotag   | -637319 | (314) 596-3250
 Georgia Copeland    | 4903733673252603 | Irniszu   |  392909 | (633) 692-5749
 Georgie Steele      | 201480907558549  | Joivnun   |  289778 | (428) 792-4897
 Georgie Myers       | 6376195297689029 | Vojedo    | -808450 | (620) 625-2763
 George Thornton     | 5416327071008027 | Givinuvo  |  402801 | (622) 929-7355
 George Davis        | 36670377917925   | Nekewbu   | -111358 | (287) 787-7368
 Georgie Schwartz    | 5018136750872351 | Ebohoed   | -775373 | (818) 494-2616
 Georgia Byrd        | 4903062068621093 | Sebawi    |  650158 | (656) 587-5194
 George Townsend     | 5018603905036398 | Gijricze  |  783015 | (375) 699-6965
 Georgie Schneider   | 6304845654555968 | Najoru    |  121489 | (459) 422-5219
 Georgie Peters      | 4903113932576847 | Opedihu   | -929913 | (254) 679-3415
 Georgia Crawford    | 6334677491869748 | Sotokid   | -787324 | (565) 928-8343
 Georgie Craig       | 5018061871297819 | Wozejtor  |  820635 | (202) 309-2511
 Georgie McKenzie    | 36648320981347   | Bukelnup  |  568312 | (910) 724-4866
 Georgie Nichols     | 6372320091999416 | Vajsuifu  | -547358 | (856) 245-8672
 George Perry        | 4326263266103533 | Lealtoz   |  532054 | (916) 766-2020
 Georgie Floyd       | 5018740419913223 | Obcopoka  |   46911 | (470) 924-2524
 George Reeves       | 6379268666617496 | Hismadu   | -372027 | (570) 599-8080
 Georgia Ellis       | 6291887832894369 | Tovwawpu  |  358390 | (902) 941-8089
 Georgia Nash        | 6373178827976333 | Izimijgoc | -783564 | (826) 790-3343
 George Mack         | 201466982999898  | Hagsanes  | -643584 | (939) 750-1377
 Georgie Wade        | 6379142852066737 | Bucgafecu |  -23637 | (469) 636-4310
 George Moody        | 6334986214562302 | Arcuuzu   | -380830 | (333) 792-2469
 George Graves       | 6304781398283098 | Iciivco   | -782311 | (638) 502-6014
 Georgia Ryan        | 4026541858965952 | Gabatla   | -391983 | (623) 954-3534
 Georgie Campbell    | 5435029106993028 | Epmukco   | -546779 | (377) 671-5933
 George Steele       | 5018642805086038 | Lowavieca | -799981 | (209) 706-4493
 George Norton       | 349150466088724  | Junefzu   | -797876 | (965) 694-6201
 George Harvey       | 4280659536807049 | Sewobouc  | -446153 | (711) 733-2337
 George Paul         | 6304976489321423 | Azaapbu   |  598358 | (957) 997-1281
 Georgia Welch       | 5610119592262413 | Diahiwor  |  585954 | (914) 465-2114
 George Marshall     | 341231279578313  | Emluhuc   | -256608 | (839) 674-1663
 Georgia Lewis       | 4279787448045706 | Amuanudo  | -423623 | (638) 980-1077
 George Abbott       | 6250241340069479 | Fakarje   | -813773 | (349) 659-3756
 Georgie King        | 346945015737702  | Pemuak    | -123021 | (688) 990-4750
 George Curry        | 3528949515656457 | Demsijzo  |  733870 | (849) 487-9618
 Georgia Perkins     | 5018841077454847 | Rendurvog |  122870 | (505) 625-6765
 Georgie Larson      | 6370984215952288 | Losejbu   |  586746 | (915) 267-1529
 Georgia Marshall    | 3528617242984274 | Ejumagran | -472412 | (371) 323-2223
 Georgia Dennis      | 6260414964124049 | Henuksiz  |  303725 | (842) 519-7367
 Georgia Sutton      | 36456528900469   | Inewunabi |  127523 | (916) 315-2230
 Georgia Kennedy     | 201495953519591  | Vamomtor  | -221253 | (580) 210-1135
 Georgie Diaz        | 4308116077057193 | Kovafpu   |  716937 | (835) 209-5710
 George Watson       | 6304380692235670 | Rebunab   |  596122 | (918) 630-9314
 Georgie Douglas     | 5018830913730122 | Gekvuvmog | -736812 | (706) 824-1295
 Georgia Sutton      | 6334537817082725 | Pipkagig  | -441437 | (451) 224-3897
 Georgia Stone       | 4903346139426560 | Sobomcim  | -102949 | (256) 661-8794
 Georgie Becker      | 6304275364551539 | Atpihbu   |   64994 | (624) 346-5245
 Georgia Bowman      | 4798227399909123 | Keiffel   | -399162 | (453) 633-1548
 Georgia Terry       | 6376317500686291 | Izulopse  | -709957 | (259) 614-7028
 Georgie Bowen       | 4903143371754928 | Fodhadwi  | -838626 | (952) 496-1848
 Georgia Clayton     | 6011194677975141 | Ujoubesow | -279639 | (613) 302-7757
 George Daniel       | 5610475053844895 | Gafosro   |  410213 | (438) 232-8633
 Georgia Townsend    | 5610970764142563 | Anarpol   | -294532 | (541) 776-9273
 Georgia Craig       | 30017046965693   | Rofivwe   | -670846 | (703) 342-1723
 Georgia Bowman      | 5496205365475727 | Cuvbohak  | -439531 | (367) 870-3459
 Georgie Mendez      | 4903096699603492 | Igomineh  | -443738 | (672) 825-6878
 Georgia Valdez      | 30074184111259   | Hodutko   |  507380 | (368) 358-3366
 George Guzman       | 6334129424908680 | Fuegide   |  581017 | (620) 725-4599
 Georgia Moody       | 6304910863607560 | Pemuno    |   29119 | (722) 432-1891
 Georgia Snyder      | 6011194525361981 | Sanpomo   |  181240 | (485) 553-1690
 Georgia May         | 6371327697015605 | Zujubabu  |  163216 | (219) 873-2546
 Georgia Lamb        | 3528758176535862 | Reinwov   |  303096 | (308) 920-7803
 Georgia Hale        | 3528120700341012 | Legosles  |   -4505 | (705) 328-2557
 Georgia Chavez      | 4026863419619799 | Mitajkuf  |  466247 | (235) 621-9760
 Georgia Luna        | 30066603391942   | Onzanibi  | -972791 | (812) 732-2542
 Georgie Hicks       | 3528153662947880 | Wamzijive | -128040 | (806) 762-8351
 George Walters      | 341364609673437  | Weasohe   |   46046 | (272) 232-8851
 Georgia Mann        | 6373619746412785 | Etopijul  |  755494 | (454) 604-9482
 George Schwartz     | 201463981909671  | Oglodgop  | -569871 | (586) 989-7705
 Georgia Zimmerman   | 3528916294438597 | Huljawre  |  -86498 | (632) 966-4957
 Georgia Vega        | 4014318752374050 | Izvuosa   | -433556 | (817) 329-6068
 Georgia Adams       | 30097923154546   | Gocadvi   | -128014 | (883) 600-9622
 George Harrison     | 5436303256883431 | Pocjuvnoh | -834684 | (328) 979-5498
 Georgie Howell      | 4903263160651349 | Behlepoco | -342022 | (801) 930-7796
 George Collins      | 343093098139828  | Juvsodu   | -416098 | (550) 373-4292
 Georgie Maldonado   | 36214337913581   | Kajifzo   |  316447 | (958) 698-8018
 George Glover       | 201472234269981  | Cebovewo  |  949493 | (289) 489-4643
 George Cole         | 4026424580476210 | Pufazuw   |  931779 | (966) 325-4342
 Georgie Porter      | 6334632624714345 | Olhucen   |  313385 | (686) 777-8823
 Georgie Hawkins     | 6011739510637850 | Bofjufkul |  148513 | (615) 813-9920
 Georgia Roberts     | 6233958390144405 | Wezesvuh  | -251781 | (888) 473-2631
 Georgie Cole        | 5164922365718200 | Fafunu    | -934630 | (557) 390-1770
 George Adams        | 36980950172057   | Egzudba   |  444055 | (346) 776-5532
 Georgia Paul        | 3528519594692713 | Pevnoudu  | -358198 | (236) 450-1019
 Georgie Hogan       | 30014237285072   | Jepejcu   |  604334 | (468) 812-2844
 Georgia Cooper      | 6011321502564960 | Lenkoptih | -788391 | (281) 474-1514
 Georgie Foster      | 3528841441711904 | Uwsanve   |  646691 | (735) 309-2207
 Georgie Pope        | 36604151011001   | Vatrauc   | -672240 | (984) 758-1073
 George Cunningham   | 30013169892269   | Tirpalu   | -142976 | (644) 411-2462
 George Harmon       | 6334150340758801 | Nupovne   | -219755 | (559) 286-3664
 George Carson       | 4763887179251813 | Jaudgi    |  -91777 | (200) 266-3942
 George Anderson     | 5125580598075356 | Jeklagni  |  -63453 | (737) 848-9219
 George Blake        | 6334365812089085 | Caklinze  |  903228 | (730) 996-2200
 Georgia Lindsey     | 6334692771758164 | Kizegut   |  397613 | (307) 649-2053
 Georgie Taylor      | 6334924170741966 | Tarahajo  |  178443 | (562) 687-9489
 Georgia Saunders    | 201430881680504  | Cujfafrus | -424988 | (912) 632-9785
 George White        | 6231318669325833 | Wozlulut  |  -20159 | (256) 964-8193
 Georgia Gonzales    | 6372189271756916 | Cattiin   |    -393 | (869) 716-4059
 Georgia Moss        | 5610549565503916 | Neectej   |  204989 | (762) 394-2720
 George Webster      | 3528991861814959 | Noceco    |  -47920 | (557) 980-8201
 George Morris       | 4026124664614989 | Lelahrow  |  540654 | (852) 373-4546
 George Allen        | 6376586209616284 | Iletaklu  |  607496 | (373) 823-5822
 George Gibbs        | 5018244268232066 | Ifagapuv  | -862407 | (955) 888-4207
 Georgia Frank       | 6334102744906155 | Rewisi    |  445047 | (260) 793-9193
 Georgia Mathis      | 201465669803878  | Fogwazo   |  173467 | (752) 276-4206
 George Gutierrez    | 5189364429736103 | Ziptawor  | -416564 | (688) 548-9136
 George Cummings     | 6011727680662790 | Cizpihla  |  611712 | (785) 891-4317
 George Vargas       | 4026159363492204 | Pejfipaf  | -893108 | (704) 903-2784
 Georgie Hamilton    | 6334698131286846 | Mesvolzop | -708455 | (536) 263-3834
 Georgie Henry       | 6205395552277489 | Vauvan    | -480097 | (603) 497-5862
 Georgie Gutierrez   | 6237143065698284 | Jaosiaj   | -395449 | (238) 619-5756
 Georgie Evans       | 6334537821273849 | Weffejaso |  -31801 | (566) 902-7541
 Georgie Obrien      | 5610836714601984 | Ulewive   | -203659 | (518) 739-8516
 Georgie Ellis       | 6334499327578603 | Ozidesej  | -371503 | (278) 951-7734
 Georgie Mathis      | 30019154982049   | Hoporamub | -932735 | (821) 569-7470
 George Harper       | 3528946011198976 | Kulgigco  | -221385 | (506) 324-8277
 Georgia McDaniel    | 30083673567376   | Kepejaor  | -112513 | (513) 572-6358
 Georgia Harris      | 5425174612469923 | Nekazli   |  641223 | (227) 864-6692
 George Matthews     | 6334384570534331 | Faheje    | -661011 | (576) 366-1182
 George Bass         | 4026966724499219 | Pijitfe   |  308041 | (873) 518-9381
 George Horton       | 4026327735349010 | Murzazen  |  790568 | (337) 236-1800
 Georgia McGee       | 4665187964242674 | Takkeke   | -592864 | (703) 812-8933
 Georgia Bradley     | 36588557576099   | Javconvub |  699638 | (447) 715-2904
 George Leonard      | 6373651115775161 | Bogidcor  | -211932 | (282) 275-9881
 Georgie Barker      | 4026354193069187 | Elbiwwo   | -331181 | (832) 203-6473
 Georgie Colon       | 6378011722670914 | Legwabre  | -319410 | (657) 403-3201
 Georgie Wells       | 6304286975366803 | Sacgeflu  |  542664 | (380) 619-6749
 Georgie Lynch       | 5168550565169142 | Sadsoupe  |   78094 | (261) 848-4603
 Georgie Becker      | 36477163481524   | Zeceuke   |  841071 | (704) 235-7382
 Georgie Jenkins     | 5198650417526004 | Elveloja  |  412841 | (455) 913-1590
 Georgie Freeman     | 5018079444197472 | Owakakce  |   21600 | (259) 676-1497
 George Paul         | 4095979783849253 | Hasbissac |  860471 | (202) 860-7628
 Georgia McDonald    | 4662352161779885 | Aforucpe  | -913761 | (340) 617-3902
 Georgia Harrison    | 6203920234675420 | Bekaovi   | -388751 | (284) 791-7944
 Georgie Little      | 3528936966189005 | Datzurib  |  902473 | (707) 307-5791
 Georgie Martinez    | 201481177002978  | Zihjigur  |  783810 | (966) 520-7501
 Georgia Armstrong   | 4903322794382802 | Dokteguw  | -603523 | (426) 570-5962
 Georgie Ortega      | 6280339361430853 | Tetwule   |  465748 | (857) 964-5148
 Georgia Woods       | 201431221496320  | Umegizgiv |  408779 | (631) 448-7212
 Georgia Dunn        | 4903984510188902 | Tareja    |  651197 | (905) 873-1696
 George Reyes        | 6011281639279173 | Ugaheguk  | -420287 | (442) 352-4601
 George Evans        | 4903251922039556 | Siohova   |  268005 | (369) 702-1232
 George Perez        | 6011714651070963 | Ineksa    | -937762 | (669) 984-1051
 Georgie Reese       | 5610177488079143 | Cozvevtij | -199836 | (232) 579-5138
 Georgia Blake       | 36843521286691   | Lefiovo   | -333000 | (780) 599-8990
 George Shelton      | 4903392030262613 | Sojofa    |  887915 | (506) 857-7684
 George Wheeler      | 5018048400378004 | Mupadaj   | -653232 | (827) 397-1386
 Georgie Stokes      | 6334668693810093 | Sefhoalo  |   43242 | (610) 632-7223
 George Cortez       | 201465982702922  | Ewecomani |  433656 | (574) 949-1514
 George Rogers       | 5154505060008076 | Suaboji   | -915764 | (885) 350-8638
 Georgia Osborne     | 6279204723812524 | Juuleta   |  601541 | (925) 587-9469
 George Foster       | 36094688669531   | Fakwate   |  841349 | (375) 879-6797
 Georgie Obrien      | 4763184030989892 | Wapamopo  |  661904 | (649) 851-8792
 Georgie Snyder      | 4026030883994773 | Daltiku   |  397761 | (375) 541-9070
 George Ortega       | 5142177182512057 | Ahreev    | -747375 | (605) 624-2981
 Georgia Harris      | 201420448790318  | Huraved   |  488596 | (239) 257-6980
 Georgia Byrd        | 5610228890821158 | Mobumo    |  699982 | (281) 890-7465
 George Nash         | 36608966718288   | Wibepdu   | -156572 | (451) 487-8555
 Georgia Brady       | 4903955780918848 | Razerno   | -772045 | (844) 360-6914
 Georgie Walker      | 4903915987792230 | Irogese   |  399728 | (621) 259-5471
 George Moore        | 5018959748705932 | Wosochi   | -102096 | (252) 389-9521
 George McDonald     | 6252602060482598 | Ruzuofo   | -927060 | (582) 870-6167
 George Figueroa     | 6269111465598249 | Niwzebefi |  442717 | (244) 389-8317
 Georgia Saunders    | 6334293620912977 | Ineizke   |   -5285 | (642) 640-2158
 Georgie Gray        | 36413205242392   | Agmabpit  | -170845 | (825) 584-3721
 Georgie Guzman      | 6011550775648593 | Iffaguz   | -984985 | (450) 612-2062
 George Chambers     | 3528922686116759 | Bulaoli   | -768054 | (404) 873-9762
 George Foster       | 3528939164679629 | Jevboze   | -222661 | (616) 548-5154
 George Abbott       | 5413995721931773 | Ussecvo   | -922778 | (675) 751-9981
 George Franklin     | 5610744222530853 | Sicoguja  | -273864 | (764) 320-2176
 Georgie Atkins      | 6304575731027612 | Wasomi    |  385335 | (680) 838-2845
 Georgia Hernandez   | 5426652292753137 | Nacangom  |  318591 | (507) 717-7748
 Georgie Diaz        | 5610892916535983 | Uhukegok  |  769802 | (557) 924-4631
 Georgie Scott       | 36036608214203   | Osauzonog |  112155 | (787) 966-1028
 Georgia Cunningham  | 6304659469510906 | Zijemzih  | -366712 | (571) 319-6562
 George Bradley      | 5018772887904848 | Habavwac  | -801751 | (818) 363-8077
 Georgie Jenkins     | 5451651693502208 | Pivarsuv  | -593932 | (929) 415-2736
 George Hudson       | 36495702448085   | Hovmovec  |  394648 | (860) 532-2920
 George Clayton      | 4903388665937578 | Ukaficom  |   98916 | (352) 634-9937
 Georgie Fletcher    | 5145119428451010 | Posafufu  |  525073 | (861) 994-8303
 Georgia Barker      | 6373794292504911 | Refajvub  |   62722 | (651) 293-1629
 George Williams     | 6201106086780870 | Dofecde   |  685940 | (906) 745-2473
 Georgia Hall        | 348210477508226  | Rulsosnel |  -33659 | (354) 783-6581
 Georgia Christensen | 5108352439525903 | Jafgucu   | -338496 | (816) 963-2323
 Georgia Gray        | 6011018732907551 | Keteju    |  236730 | (259) 571-1168
 Georgie Chavez      | 6011794482463306 | Hewsiuma  | -402135 | (330) 951-2573
 George Hodges       | 3528236968551025 | Suwhahjoz | -367916 | (532) 368-9887
 George Morrison     | 5610622341100073 | Umzivefo  |   41176 | (709) 507-2569
 Georgia Fox         | 5610178951158778 | Amozgo    |  749201 | (812) 444-1901
 Georgia Barton      | 5187917283301512 | Jaslodoz  |  -50985 | (385) 924-3638
 Georgie McBride     | 201423807628608  | Rehecoji  |  217640 | (674) 980-7746
 Georgia Powers      | 349829806828374  | Jujmedga  |  867970 | (201) 741-4714
 Georgie Powell      | 4903848735728349 | Kigoba    | -235908 | (733) 886-3888
 Georgie Gilbert     | 5610668736641445 | Reczufre  |  -34182 | (271) 708-3210
 Georgie Montgomery  | 30056040643799   | Wiozonin  |  570262 | (385) 606-9875
 Georgie Freeman     | 5018703996775209 | Segnaltih |   47772 | (679) 765-3519
 Georgia Copeland    | 5133765955708489 | Popikter  | -426985 | (255) 649-4304
 George Ramirez      | 5181361521879995 | Binaremod | -601255 | (709) 498-8470
 George Snyder       | 36532033526468   | Hewkocreh | -901131 | (354) 502-1970
 Georgie Banks       | 6304218278969769 | Kilwifiz  | -173359 | (611) 460-4134
 George Sharp        | 3528595910562830 | Tazmihin  | -839389 | (830) 236-4270
 Georgia Miller      | 30051495690254   | Cuihfa    |  771777 | (584) 590-1242
 Georgie Hall        | 5018198138274700 | Ruvhihvud | -403174 | (588) 497-5202
 George Cummings     | 5610628173056341 | Puwerwu   | -247498 | (551) 673-1867
 Georgie Fields      | 6304547828087346 | Jucubpof  |  233477 | (671) 831-1437
 Georgie Jones       | 6290788989763954 | Vaajopad  |  213398 | (350) 780-2267
 Georgia Richardson  | 5018474925949014 | Jepepine  | -660174 | (976) 834-1748
 George Colon        | 5449069914285609 | Mitirwan  |  498582 | (707) 578-8448
 George Greer        | 4822334908983704 | Fezugo    |  698885 | (909) 932-9510
 Georgia Baker       | 349117809671607  | Ramrazjij | -766514 | (429) 426-1542
 Georgia Torres      | 6334071915207174 | Rijonin   |  173160 | (549) 221-1947
 George King         | 4026313784710799 | Habbepi   | -402457 | (532) 284-4777
 Georgia Gill        | 6304153204079278 | Dukmevu   | -608850 | (542) 820-5597
 Georgia Walker      | 4412526303835100 | Viznape   |  244740 | (373) 873-5344
 Georgia Todd        | 6205884887497425 | Woujpa    |   15710 | (450) 406-2643
 Georgie Wells       | 36354130773624   | Cadermeg  |  -93938 | (288) 535-9331
 George Carpenter    | 5610755560645913 | Olatokir  |  405131 | (388) 621-1992
 George Delgado      | 4026247864629901 | Navupo    |  734661 | (414) 566-9269
 George Simmons      | 5141480059661218 | Pipagub   | -437477 | (548) 409-7596
 George Massey       | 5018536586066575 | Fawulbad  |  195270 | (583) 422-7223
 Georgie Williams    | 4118829422308661 | Unapuga   | -590772 | (461) 448-9485
 George Estrada      | 4903596503478189 | Bookewa   |  467703 | (560) 741-6335
 Georgia Armstrong   | 201490364868745  | Upunacnut |  -44813 | (381) 863-6941
 Georgie Swanson     | 3528188395183890 | Heckaaw   | -780082 | (314) 318-1432
 George Spencer      | 201418322631152  | Wesjabte  |  130433 | (367) 721-7655
 Georgie Parker      | 4026924448155021 | Ubabocaz  | -955460 | (847) 393-8466
 George Simmons      | 348765894716694  | Ehbedgu   | -649594 | (880) 273-9979
 Georgia Walker      | 5610934113889068 | Kumsiro   | -714750 | (883) 983-5985
 George Brooks       | 36834773219597   | Imizesfu  | -411376 | (688) 926-4569
 Georgie Ballard     | 4903571612091090 | Fowipep   | -468109 | (874) 763-6717
 Georgia Wright      | 5018987825934000 | Gudaba    |  760729 | (761) 970-9363
 Georgie Jensen      | 5018932387831418 | Heknubka  | -710102 | (911) 781-6277
 George Duncan       | 5018880287239598 | Vifribsem |  672507 | (684) 829-7827
 George Jennings     | 30035860242742   | Ruznivon  | -716966 | (506) 233-6849
 Georgia Hampton     | 201494206095608  | Doevhu    | -559547 | (412) 250-8412
 Georgie Harmon      | 6011250189153658 | Jeniow    |  704367 | (972) 457-2232
 Georgia Gonzales    | 4026572205721459 | Zejowrot  | -721725 | (378) 844-3030
 George Cook         | 6273646356516705 | Gutadkib  |  701603 | (433) 726-4463
 George Wise         | 6378475766560135 | Vuoziju   |  431031 | (710) 323-6931
 George Perez        | 6304668522930258 | Akupubmih | -869923 | (575) 200-6639
 Georgie Glover      | 5018617263433419 | Honicric  |  261811 | (947) 989-1182
 Georgie Burgess     | 340004080479117  | Cihlibmog | -241915 | (686) 667-8484
 Georgie Miles       | 36567400964249   | Omhuceg   | -719621 | (254) 393-4517
 George Curtis       | 4026100886587997 | Afucefu   | -894873 | (855) 637-1858
 Georgia Marshall    | 30025738466755   | Puogotoc  |   92273 | (672) 612-2478
 Georgie Carr        | 3528738289816110 | Nacsicpeg |  -21957 | (221) 246-2232
 Georgie Dunn        | 6334684127803653 | Hitangol  |  686750 | (927) 235-2708
 Georgia Craig       | 5107213161395629 | Civvehoh  |   53135 | (438) 631-3222
 Georgie Myers       | 6272438319625877 | Folcozuw  |   28341 | (503) 887-4334
 Georgie Christensen | 3528865957141909 | Uraludmok | -302248 | (782) 514-5094
 George Carroll      | 4903314527559509 | Keodzen   | -376982 | (466) 689-6257
 Georgia Murphy      | 4026238160644280 | Zitawozu  | -438450 | (467) 856-9145
 George Harrington   | 3528501672218280 | Sigisgov  | -696455 | (805) 355-6031
 Georgie Allison     | 3528476472862225 | Ugelehho  | -350433 | (505) 755-1899
 Georgie Sims        | 6334927811157534 | Fojimid   | -199488 | (915) 967-6121
 Georgie Fleming     | 201435632224379  | Watijud   |  447356 | (867) 661-3019
 Georgia Dunn        | 6376439540592089 | Galesrag  |  333853 | (534) 914-1016
 Georgia Williams    | 5410130886788734 | Jusnucodu |  164871 | (436) 746-5598
 Georgie Butler      | 5018283396102288 | Wofmeba   | -205168 | (614) 248-4664
 Georgie Guzman      | 345021346870223  | Acopoac   | -809765 | (789) 706-5112
 Georgia Pittman     | 4716001792877057 | Fafari    | -625400 | (657) 592-1613
 Georgia Sandoval    | 201432513144982  | Ebatefir  | -796749 | (274) 947-1655
 Georgie West        | 341656002244389  | Onguco    |  956902 | (937) 955-9699
 George Lloyd        | 6304729071163152 | Efonestow | -282735 | (446) 945-3616
 George Mack         | 3528689000127727 | Lifottef  |  169590 | (427) 563-1161
 Georgia Waters      | 349020111102198  | Sipzudhot |  869813 | (610) 543-4436
 Georgie Daniels     | 6298538546670024 | Zihagguw  | -630734 | (534) 273-5347
 George Stanley      | 6304443632961670 | Uvufimuv  |  912887 | (250) 877-9569
 Georgie Todd        | 6011630254100090 | Bikrerun  |  348750 | (969) 501-2937
 George Wagner       | 4471589178561761 | Wojehsi   | -279354 | (657) 320-4074
 Georgie Norton      | 6304203030109946 | Avotige   |   49584 | (321) 679-1739
 George Sanchez      | 6304729405230248 | Ipupeam   |  129310 | (652) 565-7785
 Georgia Ortega      | 6379393273425289 | Degzavus  |  981469 | (973) 503-3265
 Georgia Adams       | 5409744697185576 | Wiarzac   |  -60132 | (286) 540-5808
 Georgie Spencer     | 3528563529287363 | Lewbeme   |  872680 | (925) 991-6757
 Georgie Bailey      | 6011905297431474 | Ukitomef  |  829720 | (751) 432-1162
 Georgia Potter      | 6011442141111417 | Ribojuna  | -888817 | (655) 271-1628
 Georgia Burgess     | 4026252918454066 | Zibunhu   |  -65979 | (555) 866-1483
 Georgia McDonald    | 3528639773300704 | Wulucom   | -753644 | (630) 738-9933
 George Sanders      | 3528317987670424 | Hubdodpuj | -461948 | (315) 748-6003
 Georgie Little      | 5018347708371442 | Hohvaba   | -845772 | (349) 811-5086
 Georgie Boone       | 30050237197867   | Dawani    | -875526 | (657) 779-1409
 Georgia Roberson    | 3528125661152167 | Golsuke   |  367209 | (370) 638-6033
 George Carroll      | 4026158961257761 | Mawmicam  | -320665 | (250) 278-1401
 Georgie Logan       | 6371503297158884 | Uphilmo   |  529195 | (260) 507-3778
 Georgie Aguilar     | 6377868232814535 | Fuhiluj   | -690534 | (384) 207-8118
 Georgia Maldonado   | 5434794425848564 | Negoic    | -246887 | (320) 877-8242
 Georgia Huff        | 5018837853845174 | Sewtufwik | -367841 | (835) 507-3680
 Georgia Grant       | 6371200662158231 | Uwofezoj  |  -60002 | (527) 625-8762
 Georgia Larson      | 6235837856823538 | Dupuneh   | -653391 | (508) 261-8240
 Georgia Armstrong   | 348095460493720  | Jiatiik   |  220762 | (823) 470-3117
 Georgia Salazar     | 6278946476046681 | Tanlaztun | -107501 | (759) 361-5991
 George Hughes       | 5465617971179484 | Suffuwwob | -894645 | (228) 458-8555
 Georgia Shaw        | 201445785136379  | Pipucgoj  | -250162 | (752) 932-8086
 George Rose         | 4026954746949932 | Jejiuke   |  975376 | (860) 750-3565
 Georgie Parker      | 6011188722360671 | Wasbabaga |  621563 | (674) 333-1054
 Georgie Hart        | 4026999968094917 | Reminmu   |  401600 | (641) 897-2791
 Georgia Pittman     | 3528149513263196 | Cibokga   |  206273 | (435) 217-4663
 Georgie Harrington  | 5148475875463743 | Toskilis  |  412141 | (878) 461-2694
 Georgie Woods       | 4026533549919639 | Isfiaw    |  684329 | (920) 238-9041
 George Foster       | 5610022134707087 | Ganahep   |  573004 | (538) 966-7777
 George Martinez     | 5018308948882390 | Wurikpap  |  432217 | (225) 238-6853
 George Burton       | 4693524736275333 | Doclimwo  | -753559 | (971) 968-9672
 George Crawford     | 5106565454630264 | Vuvkeiho  |  660323 | (550) 868-9241
 Georgia Mullins     | 4026991315072381 | Sikogaru  |  413724 | (225) 847-2920
 Georgie Nelson      | 4903998112323303 | Kasabzo   |  963141 | (933) 960-6675
 Georgie Waters      | 342631142895480  | Bogiuse   | -236447 | (281) 898-5068
 Georgie Duncan      | 30028048062009   | Tujvecmih |    5030 | (675) 720-3723
 Georgia Jefferson   | 6334371551247272 | Bagrasaf  | -446623 | (449) 885-1670
 George Barnett      | 6334241264246194 | Ebcujod   | -347993 | (289) 841-9261
 George Jensen       | 4440693093370577 | Mozbeka   |  364415 | (908) 377-3444
 Georgie Webb        | 6304222609392436 | Wesobbub  |  603508 | (668) 202-7408
 George Garcia       | 6334681557021087 | Efkapu    |  817235 | (912) 934-4653
 George Mills        | 4026299328336789 | Futhuncit |  252061 | (571) 793-6073
 George Newman       | 5185555439795948 | Picibume  |  161902 | (817) 793-8232
 George Obrien       | 5189812325019552 | Rofwofe   | -598527 | (973) 857-1812
 George Davidson     | 341262400634683  | Iritmu    | -211157 | (324) 430-4528
 Georgie Johnston    | 4903331171162224 | Omavuwor  | -577551 | (889) 739-2663
 Georgia Strickland  | 349503086365528  | Pezopi    | -817237 | (943) 246-2774
 Georgia Miles       | 5114973659715940 | Poprijad  | -538641 | (266) 330-1844
 Georgie Nelson      | 3528409990171647 | Zuhomu    |  560752 | (414) 555-2897
 Georgie Holland     | 4026096170086532 | Kijofin   | -137778 | (454) 410-6993
 Georgie Shaw        | 3528321321268473 | Lufjosdan |  878261 | (424) 487-6452
 Georgia Moran       | 6284456639757937 | Wicpabi   |  -81507 | (720) 501-4075
 Georgia French      | 30019654491228   | Feluga    | -220059 | (481) 440-9549
 Georgie McDonald    | 5100861850829816 | Dubbubuv  |  488512 | (251) 726-9300
 Georgia Jenkins     | 5610039334042511 | Talusle   | -686930 | (366) 412-1431
 George Rivera       | 6375886104115841 | Mokisfa   |  771877 | (207) 863-7149
 George Spencer      | 5431949585186246 | Caowegar  |  512302 | (855) 739-2473
 Georgia Mendoza     | 5018807856138232 | Igaducid  | -587813 | (922) 972-3856
 Georgia Waters      | 345484302732607  | Kidsuaro  | -489688 | (753) 347-9515
 Georgia Thornton    | 6334207611082004 | Wapufas   | -629843 | (458) 986-9843
 Georgie Lane        | 6011448313967429 | Jepsafhu  |  822771 | (652) 834-5552
 George Higgins      | 6304453473755966 | Dosbiru   | -619676 | (229) 505-8777
 George Harper       | 3528261094852626 | Pelorob   | -695975 | (880) 210-2937
 Georgia Carpenter   | 4903646493851091 | Zubifevu  | -917920 | (418) 654-2528
 Georgia Rivera      | 5018097265043708 | Dakacza   |  979874 | (950) 902-1615
 Georgie Bates       | 348582861190179  | Rezezruh  |  317163 | (757) 728-6747
 Georgia McBride     | 30064340732783   | Higfejku  | -115507 | (964) 940-2709
 George Nash         | 4026047034975477 | Cemamah   |  414905 | (626) 701-8981
 Georgia Castillo    | 5189306835459978 | Ujgivri   | -730731 | (349) 473-2092
 Georgie Bryan       | 6334653821154135 | Utfutno   | -434405 | (946) 887-6046
 Georgia Ruiz        | 342255719658764  | Fosepego  | -527570 | (734) 562-3086
 Georgie Morris      | 4817481211126658 | Comletkug |  921773 | (949) 451-6107
 Georgia Foster      | 345760259569997  | Toopumag  |  510818 | (535) 873-5168
 Georgia Vasquez     | 4881787488346212 | Biufini   |  898117 | (816) 992-9418
 George Reed         | 3528894657562396 | Feoncun   | -835285 | (681) 235-1164
 Georgie Turner      | 3528874876683132 | Dewila    |  300218 | (774) 225-6178
 Georgia Wilson      | 5464089382992304 | Osgacfin  |    5589 | (319) 220-8768
 Georgie Burgess     | 6371262813116195 | Gudegfa   |  462638 | (549) 913-2826
 Georgia Powers      | 5018723049111483 | Wowwibir  | -310505 | (984) 444-2119
 Georgia Pena        | 340562373482015  | Lakethej  | -272503 | (980) 957-4977
 Georgie Lynch       | 6278313352377054 | Togesud   | -766123 | (516) 719-1706
 Georgia Holt        | 5170775780666517 | Havanor   | -126839 | (704) 991-9363
 George Ortiz        | 6334958312268314 | Wepuda    | -284670 | (239) 971-1096
 Georgie Patterson   | 340930465575337  | Senarasil | -807376 | (530) 389-6347
 Georgie Vaughn      | 201457742453789  | Zabmuto   |  217247 | (959) 393-9942
 George Walton       | 36535305020847   | Tozovwe   |  863449 | (314) 662-7937
 Georgie Olson       | 36840771003727   | Japzezen  |  456464 | (835) 360-3906
 Georgia May         | 4026497996947545 | Andicit   | -982240 | (772) 330-1107
 Georgie Wright      | 6304164046426700 | Poruuhe   |  110550 | (845) 361-9892
 Georgie Byrd        | 6379463371593344 | Vetisba   | -897680 | (349) 709-5405
 Georgie Coleman     | 5018798752258341 | Ewucaowa  |  383895 | (856) 611-6292
 Georgia McKenzie    | 30033641115204   | Somhabif  | -914963 | (438) 819-8922
 Georgia Barnett     | 30098962650337   | Jiliev    | -656875 | (763) 770-6781
 Georgia Gutierrez   | 4903363585882626 | Emulutu   | -655186 | (802) 264-8564
 Georgie Wong        | 3528820588325603 | Zasugtam  |  105407 | (417) 698-3334
 Georgie Craig       | 4903092961567218 | Vapoubu   |  928294 | (325) 392-1837
 Georgie Herrera     | 36091709796806   | Katjuwow  |  827022 | (623) 878-1998
 Georgia Pena        | 36708086073612   | Wauvvef   | -978206 | (668) 930-8643
 George Brewer       | 6011260792639431 | Ezibhef   |  107816 | (267) 713-6793
 Georgia Marsh       | 6334606851291938 | Gasrisru  | -973827 | (350) 260-8452
 Georgia Austin      | 36007837390833   | Ogawarheh |  507726 | (770) 273-9157
 Georgia Edwards     | 5182311432413953 | Fisreoza  | -659712 | (621) 465-8138
 Georgie Jordan      | 4903691675742189 | Tewwija   | -208643 | (334) 953-6278
 Georgia Ferguson    | 6229842505452059 | Nufobene  | -767284 | (312) 508-3577
 George Sutton       | 5018102647970527 | Kejege    | -267954 | (547) 977-8660
 Georgia Fox         | 4673314037458471 | Iwawida   |  979127 | (912) 609-6094
 Georgia Torres      | 6011465519901291 | Vurkizcol | -103192 | (985) 501-4329
 Georgie Singleton   | 4026811233304825 | Gisuiv    | -701324 | (825) 615-3455
 Georgie Bass        | 6299669876995662 | Kebalha   |  330062 | (640) 454-9998
 Georgie Williams    | 201489445309216  | Ruthikuko |  633992 | (966) 690-3717
 Georgie Davidson    | 5018134408777841 | Zouget    |  635577 | (625) 318-3134
 Georgia Reyes       | 4830240085999464 | Budutaje  | -378805 | (746) 875-7109
 George Valdez       | 5018777081401681 | Capfagi   | -580750 | (265) 803-7039
(568 rows)


Time: 99.718 ms
postgres=# select count(*) from large_data where name like 'Georg%';
 count
-------
   568
(1 row)


Time: 20.332 ms
postgres=# select count(*) from large_data where ccnumber > 400;
ERROR:  operator does not exist: character varying > integer
LINE 1: select count(*) from large_data where ccnumber > 400;
                                                       ^
HINT:  No operator matches the given name and argument types. You might need to add explicit type casts.
Time: 56.952 ms
postgres=# select count(*) from large_data where ccnumber > '400';
 count
-------
 70530
(1 row)


Time: 63.269 ms
postgres=# select distinct city from large_data;
   city
-----------
 Dafbale
 Nidfoed
 Tezikcez
 Latciwjo
 Niviwa
 Gakunoc
 Tamuvit
 Sapapdu
 Rincelo
 Uvoratceg
 Ruwivgug
 Zagawoju
 Cemireh
 Lopfogtog
 Hebiwor
 Vajesuw
 Nehunja
 Pofejuv
 Ejinozoho
 Dafuma
 Nasdear
 Milota
 Ifibajo
 Atujewa
 Iwezusvah
 Awikouwo
 Jiejuet
 Hesmeaje
 Awkufir
 Vavafej
 Watidin
 Ipofoki
 Ucinoge
 Dovosbud
 Buzhekzuj
 Focebo
 Sovebfa
 Fusofno
 Mieraga
 Vewewbi
 Mehvogeve
 Menbajbo
 Hahefhaz
 Tinepah
 Ipehonko
 Vednazbe
 Inasecud
 Vevihma
 Zimingu
 Awiuwik
 Jirwagoz
 Ujhavi
 Huijhum
 Wopacdah
 Nupaop
 Ufufadsa
 Gizcewad
 Jalocu
 Ovsuku
 Isiwemuf
 Fowgazmu
 Tozartar
 Ovilerruw
 Josagda
 Ajaehofo
 Anakevi
 Cuccabil
 Emorukbaf
 Dewilij
 Najihit
 Egukeono
 Guwekoz
 Jakiwaat
 Jajowuof
 Epuvujmi
 Mapawbu
 Ziadses
 Subuga
 Tuwtibma
 Komcagji
 Mozhiheg
 Wulaotu
 Kunuoro
 Edimafin
 Supewpu
 Okjudum
 Roisbad
 Isnavvo
 Banzunas
 Getvepoh
 Afonehmo
 Wokecuk
 Guzugi
 Emienfi
 Ubowebfet
 Uzafalrem
 Ucamawe
 Laridele
 Jitcakgel
 Fuknuzko
 Denbuhzo
 Kemico
 Vamhepe
 Caznizka
 Zerujauk
 Butpoir
 Runpiegi
 Vodahge
 Lujovmu
 Itjacul
 Iteughi
 Lumimjep
 Porluvju
 Jepumu
 Orgadka
 Gedvegoco
 Ikcottil
 Muejove
 Harneju
 Puesiluj
 Wanoili
 Nijrodnu
 Vaimes
 Hutatud
 Megzarra
 Zapefeba
 Jafmatat
 Popnutbav
 Epovaze
 Zumvesa
 Teucilu
 Jigidoun
 Vimedi
 Cilijre
 Mifuhit
 Vewvusef
 Izasiano
 Voferi
 Wibefe
 Omemembu
 Puheisi
 Kapuwhen
 Zoujihah
 Mefwuli
 Lelkoha
 Pahabef
 Nubublij
 Uhmevut
 Nevatga
 Wepfarub
 Agiredpi
 Javiomu
 Jedholis
 Fupagew
 Simrohfiv
 Gojzigiv
 Pakwekcum
 Rezojih
 Dacnera
 Enizicu
 Ipegra
 Pagaeja
 Doekeko
 Adaluco
 Damlefe
 Gebafap
 Ufpojku
 Cerzumbo
 Duliid
 Vitawi
 Meawipu
 Mudkifo
 Baehlom
 Fodupe
 Apelajes
 Zehkeftiw
 Honpalnov
 Amsele
 Saczafef
 Icubaivo
 Akbunci
 Jippehiz
 Zerespo
 Bijavaw
 Imhajmus
 Nedpikti
 Kuzogfa
 Vomijdaf
 Istomi
 Pebmarti
 Uznebna
 Hotlewjeg
 Pocjalwa
 Pifewmon
 Zavniman
 Pekguiza
 Tahlarni
 Agununul
 Obzaizi
 Bawibpo
 Fuwozi
 Cibultug
 Ibebujbe
 Mukawhu
 Sitatew
 Dewiceri
 Nefatutu
 Lenuzoc
 Goclipe
 Muefeta
 Jisarmu
 Hekkowape
 Kutgiwhus
 Ciknugzek
 Nenebup
 Pepcapuzu
 Beamub
 Vuceslid
 Rezgehes
 Vuwepoz
 Malgulig
 Rapleze
 Ugtitbi
 Wawcekom
 Bigejogo
 Bedadoroz
 Wavhuwo
 Mebbewbi
 Cucmasup
 Tivwusbuz
 Zuskaces
 Awrewen
 Wefatcaz
 Piluzo
 Kelrozet
 Varuvcuh
 Cuhmova
 Fefifeuwu
 Buteshi
 Uwciwwo
 Woigaob
 Luwnuah
 Hasvizdo
 Cuefho
 Kadajha
 Wifwihor
 Juzudo
 Vupkutvuf
 Begalu
 Lutawi
 Arlooz
 Vewceiki
 Padsarime
 Huwiflid
 Zuteago
 Olaotonid
 Delanbi
 Dotenzaj
 Gihuze
 Vidkuti
 Sifdudjod
 Mizkate
 Tirpalu
 Jeepte
 Vowodo
 Ozeluata
 Piodki
 Roftazfa
 Biduhzu
 Kulibes
 Igateaf
 Uzfirbu
 Surbobje
 Juirpo
 Awjiuru
 Jobsudro
 Ebsecev
 Faabibih
 Zouzimi
 Fotemfu
 Kitrambil
 Odiuhsun
 Bucdidbig
 Jagujik
 Uboomka
 Nodones
 Ebhefitu
 Gopolha
 Werodes
 Ernomive
 Gedazzi
 Opfoive
 Jincafva
 Lazecota
 Moficit
 Ahubodrat
 Ucodibez
 Kavain
 Cavnedhi
 Ezairpop
 Geariciv
 Netileri
 Mocnekhi
 Owhopip
 Faikuba
 Vujozfor
 Bomuhgan
 Pobodne
 Udguvev
 Ifjive
 Cabpevraf
 Ciahuimi
 Cezazhe
 Cawwosdub
 Selodiju
 Tevapjep
 Weczahil
 Paozuv
 Jubdiruc
 Legnepi
 Momopok
 Zonzolod
 Abbano
 Ruvezvac
 Hagbate
 Catjupdej
 Tugupion
 Tepzuwfi
 Corsipca
 Luguhuisu
 Avhite
 Umuhifih
 Teezawu
 Devdiwpi
 Benabba
 Daomuloc
 Ivetomne
 Garruna
 Gitbeijo
 Isegitawi
 Misifip
 Ihajuiv
 Fesdepbuv
 Noshakefe
 Itpegnut
 Haglezpil
 Buttewwu
 Ubruer
 Huatper
 Osovcop
 Zeccomja
 Moreten
 Dibuskaz
 Lidginav
 Uhiwunceb
 Valhuzre
 Juvizaf
 Najofkam
 Bepahapuk
 Cavliset
 Mecwovga
 Icdibafo
 Uwudoma
 Voemait
 Mitlebiv
 Wezebzuv
 Rozimce
 Hacnecog
 Ginupwo
 Fajhuwnus
 Nomiko
 Cavashof
 Dekgupeba
 Fitwosi
 Cuguhtaz
 Ehvurcal
 Wibege
 Muwgeofi
 Ekojojler
 Cuvivu
 Cipecen
 Sisefpun
 Gozjoncuv
 Jojpoag
 Cucutara
 Kozaav
 Bubekci
 Winmivze
 Nimhoicu
 Jolmowe
 Izafogiko
 Vevicbaz
 Gacgunit
 Idaakwa
 Eboepor
 Recsuegu
 Ticoico
 Linuneaho
 Hisune
 Istosbal
 Ujgeoju
 Vuidin
 Wivzimu
 Ogaiwhis
 Vimozel
 Janasje
 Nufvifol
 Ogaheub
 Seipcit
 Ottibib
 Nofudon
 Wejniker
 Enegape
 Cencoli
 Muzkures
 Wobkuun
 Somweak
 Savaaki
 Japubel
 Oneveoru
 Viwacow
 Pedacoomi
 Pebopov
 Tavvibo
 Tusrozgut
 Didkewhis
 Gatalto
 Zikrama
 Viwottuf
 Udoewzum
 Kobdajam
 Jazcusa
 Jekujud
 Atoakeman
 Nuowpup
 Hidovoze
 Gaatiar
 Inujejov
 Gefojzid
 Nidsiis
 Sezterbek
 Vufobni
 Fatgije
 Waiwoki
 Mekufoh
 Goffifo
 Kikahi
 Baeharej
 Zurazi
 Cetasolew
 Tojbeur
 Vawkaof
 Gizsejjon
 Likehiicu
 Katecdol
 Ciwvieli
 Mogmafet
 Luburwug
 Jerehme
 Itafab
 Lijfosin
 Ehfivkak
 Wujsioh
 Okimitev
 Ipwava
 Kizmevuf
 Aludamu
 Rejholbu
 Uvuzejnor
 Rilessup
 Gavfece
 Oruuracef
 Urobukvuw
 Roducfe
 Taasuwof
 Rigivofe
 Lajucme
 Nucjarfuz
 Jifinij
 Ezipobhun
 Fuhjetge
 Poftergiv
 Safjatpo
 Sishifmo
 Zedetev
 Wopberow
 Wuemkak
 Doiblel
 Zewirabis
 Wifliusu
 Karmogoh
 Wipoci
 Icefadino
 Nakugfo
 Batfuiv
 Ledenco
 Wimbadek
 Rufroju
 Vaicodu
 Wubetamaf
 Agdutot
 Izwutihe
 Wejnebwom
 Lolrozwuj
 Vukobwon
 Wetettif
 Dovilca
 Amaikce
 Esowapusi
 Finewica
 Rejsaaka
 Impofci
 Miwuftuz
 Riporje
 Vuuvzu
 Aloalata
 Bonnefu
 Dumider
 Uwahuoc
 Kaguhew
 Orotudbor
 Uraabatek
 Wacjarne
 Ajazuhjat
 Kocafwus
 Lekvukzil
 Jabgune
 Guppepe
 Tijpetep
 Guvtian
 Daagahun
 Pomujfe
 Wusubilu
 Lukozoec
 Domawze
 Nefolowe
 Pipujkev
 Uvjelfaf
 Marjegvih
 Mosusol
 Cemrighin
 Igigikla
 Bunuzjas
 Ilumowek
 Adijajmet
 Vidtufma
 Puwdoor
 Ekeugga
 Cunihta
 Cudsegag
 Buocah
 Litutaf
 Roitapa
 Niucic
 Kompafe
 Huwusewo
 Ronavep
 Bimuwbac
 Wuwjojev
 Ikarujvo
 Efiwidcog
 Befnubudu
 Ravahot
 Wutanni
 Oweepori
 Sauhsot
 Punuzvu
 Okiheep
 Femala
 Vegosja
 Jicvavo
 Jiwkakoz
 Himiha
 Olsuboc
 Jubsohir
 Honehiw
 Lolopjij
 Emocupev
 Jufidoko
 Kicvapat
 Gojborra
 Hebubmih
 Vodlurav
 Kepdewtu
 Bemalfet
 Pomehero
 Recawuk
 Imabuzipe
 Socfikisu
 Bokowti
 Begcuuj
 Elicihok
 Zegzujes
 Ignanor
 Fafaczuk
 Bagekup
 Zuusoju
 Dufarke
 Webedop
 Samzonci
 Ejovecu
 Lahogel
 Vogmihge
 Wabcasfo
 Dicaep
 Anecajot
 Maaftuc
 Ohicuva
 Salowza
 Ihugifa
 Faniige
 Ofubuni
 Tahakiuf
 Boisuoj
 Lucomiv
 Iribugil
 Divpeeme
 Ajjoun
 Fizobke
 Pitbesad
 Ikizuslib
 Lijepmuz
 Egisuuda
 Tevcitil
 Lufisfa
 Unmojna
 Rafhotmal
 Hewisa
 Fadbufcim
 Neciref
 Nohvisco
 Nivgafuf
 Tafpupi
 Lawaffo
 Esizesez
 Itibufe
 Fejirid
 Julotek
 Demdukog
 Japbekzoh
 Dijusiv
 Tulijul
 Obiifiul
 Delmizu
 Davsizub
 Zidpeolo
 Ziifajo
 Hizfaksep
 Bopcima
 Hewezuko
 Tielowe
 Sijgelog
 Sispuef
 Nocketel
 Mosizte
 Varale
 Idiwijag
 Peuceleh
 Anibaze
 Hedihhiz
 Lutoug
 Atjacte
 Urdonap
 Depoiki
 Cilucrof
 Hungewa
 Bisobu
 Tuwluvni
 Waudecom
 Hawfipwav
 Ehrewon
 Osutugul
 Nocduuse
 Imseluk
 Nupvadjig
 Evrarzil
 Cekaime
 Togohah
 Wugeja
 Docsapbu
 Tesuseh
 Arecaoki
 Zanzampa
 Rizgabu
 Ugjuso
 Vikisan
 Gahweziw
 Fadokez
 Avoovder
 Jothigen
 Ciazica
 Huzonhag
 Iweolci
 Wesoov
 Hawcoawi
 Wenliki
 Bekahso
 Hentanino
 Irziwfu
 Mijlohif
 Pugezpeg
 Ahluhfi
 Mavpukji
 Rogovofup
 Hetujtu
 Sibwonvag
 Puspaco
 Waofne
 Ugvaco
 Mirulhuc
 Ehutojec
 Reikwo
 Volodej
 Lupovico
 Ozivewi
 Pachino
 Gonloop
 Pucasivu
 Ridwevcag
 Wavvamwe
 Tuscevu
 Zagovtob
 Edocibi
 Gelsewoma
 Fuwacahe
 Husgenka
 Fasorej
 Japata
 Fedcifed
 Ucousebiz
 Sagrisun
 Afaobipo
 Mecumwuk
 Pebavor
 Rabosah
 Duifewa
 Waelado
 Tuzkijnuh
 Vatigok
 Boefihoz
 Gifpusod
 Cunoli
 Nuikasum
 Noasafew
 Noivtah
 Sakezuv
 Sekuzaw
 Datiriz
 Mosazre
 Hedewi
 Kibzalin
 Jatigved
 Halatig
 Rikcapke
 Kiuhti
 Fovkacwok
 Ulcohis
 Lesizta
 Notrojjuf
 Ipjifzub
 Rapupej
 Bufojsis
 Nuteruma
 Jogari
 Umteko
 Kermotoz
 Patodije
 Neleoz
 Votepsa
 Vihofzod
 Nejoczed
 Wamibata
 Tusatava
 Modnezsa
 Futtepof
 Ralivrot
 Ruploncer
 Norhuolu
 Ohijusro
 Ejadegav
 Jenubuw
 Licjavjet
 Coipho
 Kewvuwom
 Elesosra
 Togsodo
 Findibu
 Huwikujo
 Honumpu
 Guedap
 Legalvu
 Hilipeze
 Dimmimfuw
 Lepfauj
 Bobmukfa
 Sufgutjow
 Tosacac
 Zapevce
 Vezdihu
 Uhzili
 Asuuvhuw
 Hunpupup
 Ragepo
 Navvuika
 Tufpiema
 Fehwavag
 Foreav
 Jutrogu
 Mulahoc
 Nibijcug
 Jedzevez
 Fadlebed
 Ranebka
 Buigni
 Nikuede
 Fukheod
 Zugwiiri
 Imoofuop
 Piddojun
 Etiikujes
 Lewfeoji
 Ejikageg
 Etfopnu
 Upugoveb
 Gohwuwa
 Janive
 Wagahos
 Luilna
 Togezkad
 Zurefota
 Lupaper
 Ijfoji
 Icbupfo
 Cigkomreg
 Vilicig
 Poronge
 Tomemu
 Zatedpo
 Fucofva
 Sucnemuv
 Newlacak
 Tigihoti
 Izmasaz
 Micvuip
 Hahhucsiz
 Awvufi
 Remalfud
 Gosruuho
 Jukjepmec
 Canoraw
 Zuwsinpug
 Pinfohdu
 Hatituiba
 Ocidefce
 Nudtiaze
 Arfove
 Kuvratacu
 Najiez
 Ovezocud
 Difpeltor
 Bijduded
 Ledgawki
 Sicefgi
 Hazihu
 Abogalan
 Makehu
 Avaojda
 Bojalju
 Rintodoc
 Avikifca
 Dakacaj
 Giwmugoh
 Uvzirwin
 Juezapiv
 Kobazeze
 Majpaveg
 Zeklifmel
 Tujaffu
 Rodofna
 Vecocata
 Ragwisla
 Tasuvur
 Opebuuw
 Gesuebu
 Nokesik
 Kemavouwa
 Zozcuomi
 Hijuzka
 Encaij
 Pulujowe
 Nedsipom
 Nezafat
 Odowewsif
 Zozwawevi
 Tamcuvuv
 Usilukar
 Feresiw
 Zuegipil
 Gavutfo
 Lamekluc
 Tumelme
 Rapowjut
 Paebni
 Vecromutu
 Zeharuv
 Vaduptot
 Ihokumo
 Wuvruvis
 Wombidfe
 Divnizloz
 Narepot
 Henlupmor
 Jugcanal
 Mibsapce
 Gosifata
 Fezkodjo
 Pupsemoj
 Gotaccu
 Nicbecata
 Muboheb
 Debvoalo
 Akluwok
 Fomudfoz
 Vupsilad
 Boktoti
 Baffolu
 Hivitne
 Cawmuga
 Ceragaw
 Peboniw
 Lukdusika
 Kodderu
 Epabazkot
 Lucugru
 Josamot
 Dewmasam
 Johpupu
 Lahowuf
 Seasrat
 Gucefje
 Puluswel
 Diotaam
 Naduktus
 Lezcufek
 Bovustow
 Loltego
 Kunlabo
 Refbukhug
 Ugfoza
 Arbenam
 Lejivzek
 Kutoeli
 Evorotu
 Nujrimgo
 Avizolzuz
 Hozruzu
 Koefpa
 Ohjega
 Lucgotof
 Cesaad
 Umuzoidu
 Vudokad
 Zertekcam
 Nahumfe
 Lowrofsih
 Zizusoruf
 Pofifguc
 Zokapacul
 Irsubsu
 Modwatwe
 Catteruw
 Deedtis
 Nahucgov
 Olacowunu
 Hizeti
 Lozcale
 Kuzpamofi
 Pionwo
 Kagevfir
 Rafotpo
 Ugewze
 Holwevwen
 Hitewu
 Saodop
 Itkudca
 Safuifi
 Cizeplo
 Regtausu
 Sutishi
 Loopgam
 Buwdeksa
 Seernep
 Fealva
 Opuwepig
 Nacilji
 Eriwibbo
 Otifodlo
 Zootoevu
 Omijemefa
 Mihecpi
 Nemuvus
 Ihamida
 Iptufhap
 Kirasesa
 Ivuretbe
 Imuulal
 Retedco
 Mermoco
 Omletzer
 Insefar
 Pudasule
 Ihisilzu
 Deiffi
 Erjevha
 Ujuvuzum
 Asvoze
 Kuhenov
 Keridem
 Norivjib
 Hubujap
 Poozelu
 Bubarmo
 Mikgorulu
 Veidlep
 Ajihobgi
 Luporha
 Cajfobon
 Tevoow
 Tohour
 Faecso
 Igiokgi
 Zoljusba
 Somdidnoz
 Evesipa
 Bewiati
 Cadogeava
 Zaifarot
 Hahagu
 Rudzakzu
 Vupoctu
 Omuvoril
 Fahusu
 Pavolu
 Horidbeb
 Gubterla
 Epmeziz
 Dozpetu
 Lowado
 Tekejir
 Mirezadom
 Ebutusu
 Cumewuf
 Safensi
 Kawsesus
 Kedenvib
 Gecpevi
 Zakvolir
 Ibhizaz
 Luvatic
 Udcosu
 Joluwje
 Puopole
 Usliwe
 Etijikmas
 Iratosu
 Meepeomu
 Tuvlurca
 Wedusija
 Jistinug
 Pajecu
 Nahgeula
 Pogihel
 Wehulsaf
 Bufgules
 Sotokid
 Ubujahuz
 Gunfivpo
 Kabuwe
 Igaohose
 Limsepu
 Ciilju
 Cuoniol
 Deewepiv
 Afederi
 Gufcuiro
 Kedatlu
 Owopohte
 Ujgomu
 Amgoet
 Puwkevov
 Nakuwtu
 Sajruul
 Lonijru
 Runferhi
 Eropafed
 Jefgowebi
 Uwupindej
 Ochodod
 Kunfuru
 Rawjijo
 Pimajhi
 Ceknimno
 Nefemak
 Gafjobwit
 Niwuvzi
 Puhsuaca
 Boecnoh
 Muvagan
 Acilaof
 Ikudoibe
 Oslelwah
 Redpesoj
 Cokpiuna
 Bocihje
 Iweamulov
 Reusazu
 Dojnafpo
 Digawci
 Vatlivi
 Korutem
 Ihiferun
 Wuheku
 Pawidur
 Zugjisel
 Tostimjaj
 Gigokvi
 Sohowjiv
 Oruejmop
 Kaldekot
 Wecuhpa
 Ivuvomhu
 Mivacer
 Kowgekves
 Arbuim
 Redihme
 Bopogcuw
 Letifol
 Deopuke
 Pascauz
 Gucehpa
 Titbinlac
 Dehogvik
 Ketahak
 Tabodla
 Ewelmu
 Tovubef
 Samobe
 Hibbasuz
 Fokkemen
 Hucepwe
 Micnuson
 Hosurja
 Bafvenis
 Vubocfag
 Fovluvin
 Vavanas
 Wuhgeugo
 Hocadve
 Geibici
 Dolumeh
 Juniswip
 Veitzir
 Lapizkuv
 Hehbofiv
 Fuhuma
 Enzouki
 Patuvhi
 Pacinjuf
 Ezodibil
 Nenguova
 Ewegaabo
 Garvajet
 Ruhuhes
 Sowkicebi
 Oftogpe
 Supbopo
 Zavehrit
 Vatuhem
 Ferpijpob
 Ejehuwmo
 Lerotale
 Jufaufu
 Jipulep
 Fodube
 Gotukmam
 Vugcara
 Utofuva
 Jiativi
 Dingose
 Sosorobic
 Famozcab
 Tuehuli
 Hukjisfu
 Savahpi
 Uzdumir
 Awodoju
 Jolgabif
 Runifore
 Gedriugu
 Newucop
 Wufsufeh
 Sejajehak
 Uhzamdu
 Kamehdiv
 Tefikuvaj
 Satzeda
 Tuwowa
 Tibkisu
 Abwoufi
 Basuzme
 Potanwog
 Lazrewhi
 Debporub
 Dunerbu
 Ozpiwiw
 Lanibasu
 Sogponsa
 Zepideh
 Vepzazu
 Unfeal
 Mifige
 Utazemah
 Kevhofec
 Teonajo
 Zupuvvij
 Iwlocoba
 Cutwilu
 Kutunu
 Akjinow
 Eromanovo
 Fughode
 Bolute
 Hiekhiw
 Gubipli
 Galletpo
 Vacaic
 Tuokima
 Ujfuvte
 Hobkelis
 Nonracvi
 Miduzuf
 Gezorjov
 Vapimu
 Ciczekip
 Vumegfop
 Ezbudoc
 Nesdijir
 Rupuwpof
 Bakhawce
 Kevuzuw
 Heogehu
 Ninafbe
 Mugoig
 Tedimwu
 Datulab
 Mozponbe
 Wehceuwi
 Zigorzu
 Sucubiw
 Otevevzih
 Hedruez
 Gutmutba
 Zuzupmi
 Mennuwim
 Todnedeb
 Kozbebil
 Iguvacbud
 Vihjizwus
 Acbuspu
 Verpikes
 Ocouzzo
 Fipisbe
 Lohobur
 Ridaora
 Bonpadmu
 Vezpupek
 Ceubob
 Azhatwel
 Suufevag
 Hitijeeli
 Nupovo
 Nujeehu
 Varocisi
 Wifoztol
 Tokilo
 Wozedif
 Kukawihe
 Hosufvuz
 Dodezul
 Durizboc
 Tavovce
 Jelhofdo
 Wozira
 Cazopdi
 Sehsomo
 Editivora
 Judpameta
 Mafjusuc
 Wajmuksu
 Fezihetil
 Foomiru
 Lehnahad
 Nejuve
 Sernefpu
 Futimlin
 Vutejur
 Ivukuse
 Sibamo
 Ulerijat
 Balcigbe
 Buazivuv
 Suodew
 Biceplo
 Soekubo
 Ipabapav
 Gaijbif
 Ziwethi
 Okouhfo
 Orurote
 Ikgiraw
 Tofsuaj
 Averazobi
 Vomarome
 Rauhjo
 Binuzca
 Teuwiof
 Gewtilwir
 Hedaogi
 Memvoefu
 Akomepjef
 Sekheeza
 Zegihuwe
 Oczanes
 Kuwjimo
 Suutas
 Kusovmo
 Edaaptef
 Pebukmej
 Tapmawih
 Dirnisi
 Dirwoba
 Wiefraz
 Lebluje
 Radlegfen
 Tifatovol
 Kegcufep
 Cusurkol
 Miswupib
 Niprajol
 Tebobaso
 Lilnumuh
 Vihacacuw
 Opevukafa
 Esufubud
 Pinedi
 Ehucukwe
 Ipodase
 Mifjarafo
 Orjivad
 Uhubijher
 Ohecmu
 Falcebi
 Zebdabi
 Morcufub
 Zuhogi
 Pidsumza
 Futoshes
 Uzinuuhu
 Bimapcuv
 Aniroho
 Ordoleg
 Bemwelpal
 Coputeb
 Ahbicdis
 Jesnarav
 Ojuholop
 Ilulugu
 Ovzuceb
 Votvipzod
 Silisow
 Pemipteh
 Rekospa
 Jigiwhe
 Obehadi
 Huhtozat
 Mikaaw
 Lepfufe
 Loehika
 Lafefhe
 Kiepfo
 Fumruafe
 Sasgahu
 Juvlownen
 Owakeati
 Utohakit
 Redekveb
 Nenugnuj
 Siuvijew
 Canube
 Fucites
 Jipefgoj
 Ohuehoham
 Tubmafra
 Wavawes
 Udoatolu
 Suhamoiga
 Picloze
 Pesuzodu
 Ejootej
 Hafjoed
 Gijatu
 Okzupac
 Ircarap
 Pomumwon
 Fokilig
 Ilukaih
 Jemijmif
 Wumcuza
 Hukjeuca
 Udrowgun
 Fitazog
 Vumnujur
 Nugheil
 Arezebuj
 Cipofaz
 Himocnu
 Roihvec
 Utroler
 Secmotjug
 Vizohanu
 Biobeuci
 Inuremeg
 Cemtive
 Herruwin
 Wibzogad
 Eluhitiji
 Fegubu
 Cafizse
 Hoadati
 Levibup
 Jukgovul
 Oghugo
 Gakkelep
 Uvipeka
 Fukutede
 Evvina
 Tivakrel
 Ikrode
 Pargasi
 Cetuweb
 Hepolu
 Nizenfeg
 Miztokaf
 Ugerumga
 Ojowepez
 Nejipuw
 Akuanide
 Gamjahol
 Dadlaoj
 Bazosul
 Wazobadeh
 Gimhuguj
 Nobsesfuk
 Ezruvow
 Eralupol
 Zuzager
 Hokepip
 Viocauhu
 Afacisuh
 Pomelec
 Upijoes
 Delvuzze
 Uzuzfa
 Sajuptod
 Mulaaz
 Dufivov
 Macmehfe
 Vozsivsev
 Duigucem
 Javahna
 Monaji
 Kizdecu
 Wefaip
 Okamutu
 Jeduve
 Ajoofohej
 Bemizi
 Cadokeato
 Eradiba
 Wicawfus
 Wiikzu
 Dihusgow
 Ihumigeh
 Micnegop
 Nopeotu
 Pijviji
 Jagusvow
 Demniti
 Kakuvaim
 Cokenati
 Kisehugi
 Mibuvji
 Rocasur
 Edatohaw
 Vovecud
 Rujfiho
 Hiwmaami
 Enapuzo
 Ivukimro
 Sedcuvuh
 Fuatwos
 Binomjeh
 Katohor
 Cinbicdu
 Falcosrit
 Hidvojhic
 Caagidiz
 Neorini
 Zigocli
 Eloujub
 Dabcosi
 Kadapu
 Iliwuop
 Oguticda
 Duzuhgak
 Ewofooc
 Natigcu
 Gocnaplob
 Sihopu
 Zicafi
 Ebeofku
 Suavte
 Cuibil
 Voroda
 Zirokbo
 Pokgamir
 Tacbecamu
 Pazteni
 Ledjerci
 Biartik
 Zokhuvda
 Nuswocbar
 Nowotmus
 Tambejge
 Owiugpap
 Ufuvipul
 Rurarur
 Huhacnav
 Kepozire
 Jipinehab
 Juspetud
 Karutzub
 Labpimwih
 Fithowdak
 Kohkicovu
 Isonebam
 Meknocazo
 Pibmoluru
 Hobiguota
 Ufgeldu
 Femaogu
 Nisogul
 Nesbibkig
 Sipohu
 Imdugcop
 Dotzikva
 Reapgud
 Vabiho
 Vigejas
 Timapre
 Kotwatet
 Ovmasgoj
 Ciafdi
 Lookba
 Rucmobik
 Rijurga
 Kewihih
 Luhudbu
 Sadulpe
 Dekkoha
 Kukafdu
 Losfeir
 Ofedupij
 Ronsorfim
 Ropulzo
 Wibvatbu
 Nacagwa
 Afkibdu
 Irmocud
 Dugesro
 Wicmasma
 Eskowliv
 Jodpele
 Redifer
 Cejotfur
 Ujasnoj
 Heffide
 Ujajitme
 Sejeane
 Ikfepco
 Caupbeb
 Jadewkar
 Bamezvo
 Womotwe
 Tuodeera
 Rewhagit
 Bepcegako
 Gatzilog
 Lozezgon
 Pujhoban
 Femovlo
 Fijgabes
 Nurfibaf
 Vilmeeve
 Javedbe
 Hovzadba
 Oniruan
 Hoagegi
 Mihacak
 Vuzgibdum
 Wobokvu
 Atsovnik
 Wekkumo
 Hugruet
 Sefiavi
 Lurroob
 Uvvuar
 Biksowvo
 Kunurfus
 Zaesezuc
 Ceawan
 Irijazma
 Etzubez
 Pehassud
 Fuccibu
 Pemuha
 Mipcape
 Giojasa
 Cilerzi
 Guhariw
 Hambalu
 Decakese
 Lievwuz
 Decewiwi
 Voksolar
 Wigzosu
 Webigu
 Ojocilkah
 Soklurju
 Ahuludab
 Esokaved
 Jikreeh
 Ledofa
 Obidaiv
 Rumziav
 Ciglipos
 Wifowu
 Voecuha
 Dusutez
 Ivuopukal
 Tukusapi
 Difmibug
 Nekhelac
 Hohetoj
 Likjima
 Gadesgot
 Idetesez
 Loswinsuh
 Datwapav
 Gugusowa
 Eruzotuz
 Gojjukda
 Lukfacel
 Ivcanev
 Badogi
 Ruociweh
 Votosu
 Jutewhag
 Onisojo
 Kelicop
 Zevwupohu
 Memmubala
 Murbemos
 Ugneda
 Hecitu
 Zipepuih
 Risabaaho
 Itajuku
 Ukuwuhlic
 Banikke
 Lucnugejo
 Wihubnaj
 Begtopof
 Tugigah
 Vaszenaw
 Egkuja
 Nafowam
 Bidrukinu
 Liadesi
 Viihde
 Jazzalo
 Fuahana
 Kudkazeh
 Ulokukco
 Cuhcalwo
 Hophugwo
 Uricufsi
 Fewibev
 Izadoda
 Hemotcez
 Hopwijtu
 Hossosco
 Mikunuf
 Cevimga
 Virudda
 Ohepekjan
 Laviszu
 Tosoogi
 Abobeac
 Mozmortal
 Sicawem
 Favofni
 Ofuweju
 Gideresu
 Jaragwil
 Owuulzo
 Bibasupo
 Galegep
 Tojeuw
 Wewzuosu
 Pegikdeb
 Ijesujec
 Duwubusur
 Acalizuf
 Seguab
 Juhobanul
 Luharju
 Minzukif
 Soddalut
 Gujaew
 Mumises
 Rialkip
 Vamgopbi
 Izeiwlul
 Secawavi
 Zivsizi
 Jerihood
 Sejaseb
 Risebas
 Pabogour
 Refoti
 Wogdohoz
 Ibzobku
 Ziugfon
 Doceot
 Hacuhug
 Uchigi
 Wolawzu
 Durpoja
 Adarujab
 Amogonemu
 Enejapin
 Buehros
 Tasuvsa
 Nimudib
 Mohedut
 Adsuzvad
 Rusjejhaz
 Mizaveh
 Rumikeb
 Laemooc
 Rupibobe
 Rabfasba
 Zoubhiz
 Tomwawcud
 Utujehu
 Vakankin
 Feftedzi
 Dovorfa
 Dansiig
 Wibefu
 Wipogbe
 Eseheedi
 Cezewjup
 Disfaulu
 Mukvuzim
 Ideniheh
 Zulgodki
 Jippekda
 Vuzuoz
 Popkuwu
 Wubevniz
 Avhovwu
 Sokguvhe
 Idfonco
 Zufurime
 Vidvitje
 Fowvutis
 Riegrob
 Hendeghom
 Opumewna
 Jehupot
 Latjahga
 Idnajte
 Ruagkin
 Liteka
 Dojihuw
 Muceuf
 Wonhuvid
 Aktuisa
 Olenifkob
 Amogge
 Hawuknod
 Buasufo
 Uwitabkin
 Ulburuki
 Avoivgas
 Dofgecos
 Miksatu
 Ugozonup
 Vuenza
 Maflizco
 Nimpumfas
 Zokejseb
 Ebnotbov
 Rofako
 Nolika
 Asvacif
 Osmibor
 Damtiolo
 Laazerah
 Zigiir
 Dambukod
 Sejzino
 Ziawiro
 Uvajavif
 Vuhoweri
 Izaguodo
 Tigitip
 Wealso
 Futadak
 Jonpapunu
 Redwuzcis
 Avusemu
 Kukukbe
 Currevcu
 Uragephul
 Ijadacu
 Wovihuj
 Pampogfov
 Bujorpiv
 Lijenuub
 Umadansev
 Duppuri
 Dezzipoha
 Atbivnu
 Fatomep
 Rekicug
 Hisguwziz
 Tifgigat
 Faotewu
 Beokoso
 Favasow
 Ebkeaz
 Cujahkuc
 Lehakcow
 Gagalpol
 Zepdufo
 Tumsugas
 Dojozce
 Wilhazcuc
 Mannotal
 Udacazega
 Bafmiset
 Nohhaete
 Wavpicloc
 Pomjivava
 Zimdecze
 Tiazuob
 Faadiseb
 Kehvutiw
 Anijutok
 Retnibi
 Egohikzog
 Cuhugfut
 Ipfale
 Fogduha
 Miafjod
 Kanazmi
 Uzpepwil
 Oflugewi
 Gudeej
 Enruije
 Coghulmip
 Amulonib
 Afpiuze
 Fiwomno
 Voepas
 Novazoh
 Satizol
 Ebmohlu
 Piraglo
 Tecocac
 Zuthintug
 Teojira
 Kadima
 Narganmaf
 Hobkibdi
 Gezzedu
 Inotca
 Ivegazvac
 Vozawhok
 Emazecna
 Ecatte
 Jihzorog
 Vabgujuko
 Hihasojok
 Ohkaipi
 Tagitut
 Vichahsan
 Gegeadi
 Kuwvokri
 Ponaewu
 Rurrukij
 Nenrunu
 Dainiri
 Hogcualu
 Junzoce
 Jumboza
 Wamefu
 Zilodo
 Etesogas
 Naclila
 Upfafke
 Wafureniw
 Acwatjef
 Ujojlu
 Wijulouzi
 Wemdisle
 Afgopuj
 Levhalep
 Poracjog
 Fiukvo
 Upuozma
 Malifape
 Wirvecam
 Covpuub
 Vigafad
 Lebosat
 Cuvibow
 Wibnokop
 Teifrat
 Zicieri
 Kitbahe
 Vavevro
 Jofsihe
 Hufure
 Kalbowufe
 Ditabad
 Sodjolit
 Cunpersis
 Zucebenev
 Cecceccah
 Unizanso
 Fuswazudo
 Cotcoho
 Vektugit
 Fadgubil
 Awbazci
 Ebuviad
 Soggimja
 Lomusti
 Jofzacun
 Hubmuri
 Turfutul
 Rebdupcan
 Luwekani
 Juunrew
 Ibfaeti
 Sowsuguw
 Ovuuhma
 Bemoga
 Wanmozpa
 Zopwedo
 Sukruwme
 Geglujkeb
 Vajijna
 Fovoseke
 Fodpilsew
 Deidojec
 Zafugu
 Gimpubdi
 Doekrap
 Hibozaut
 Biaknoj
 Kaetho
 Juvobniv
 Rihizoj
 Ewirco
 Ligota
 Bozweleb
 Laklupli
 Nahgada
 Sencihto
 Igamowos
 Belvuti
 Basjigne
 Wefovni
 Vurara
 Wukopicu
 Marjejot
 Kafuope
 Sahcejod
 Ekgukvu
 Hohuzucu
 Cimvepho
 Wosareb
 Ogoiffo
 Bepirari
 Uniifovi
 Vuzivu
 Puitato
 Derihmu
 Uwubfof
 Huwdavur
 Ikosmu
 Jasimpeg
 Sasekdu
 Turejisu
 Cecira
 Zijujice
 Zoisehi
 Dugime
 Apegimwo
 Apdonhos
 Miviwob
 Azjagok
 Rumhibin
 Ejowuali
 Pavkegu
 Gohrerbav
 Ifahufaf
 Zizzecjes
 Oweengo
 Jahgasih
 Teriwam
 Hinuzehu
 Magidef
 Ukjipov
 Gureeko
 Itvetaj
 Uchihtu
 Zefodire
 Ezuumka
 Vunkawhak
 Zucmidu
 Odofenon
 Pibseca
 Adeiroen
 Fizecod
 Ihgiwo
 Buafoku
 Etbehin
 Ocujuba
 Vezrizpa
 Ponrejna
 Apnurdul
 Kofofkuj
 Cizesve
 Lagnado
 Gobtufece
 Zuharfo
 Hivcerpab
 Kasuaz
 Ecocapaw
 Kuwahoj
 Dukojjut
 Icofina
 Fehwuvu
 Guskabed
 Kuluek
 Norhemo
 Cinakwa
 Topjeeru
 Wupvufva
 Dotulfem
 Gicdufur
 Tizuefe
 Nuwsemla
 Kofdinob
 Beromnug
 Fezarow
 Segehamaz
 Sohfiad
 Utusofi
 Efacduh
 Ircinhol
 Haunami
 Joluki
 Dosajmo
 Sotirjum
 Taegilu
 Bugugov
 Gedoze
 Dintetwin
 Wapbonvew
 Igouluaka
 Jidpimamo
 Bucnirke
 Memefki
 Guvacwe
 Metido
 Fiseami
 Kuvfedduc
 Secobul
 Hajiut
 Zaagsa
 Laweho
 Roizbe
 Fasuholon
 Wenokuk
 Repafe
 Talirap
 Geghozel
 Lifgitne
 Afzaude
 Sadahi
 Ifvueve
 Dilzage
 Irwecit
 Niwbedeha
 Uhsivji
 Ibipeko
 Ilebiloza
 Muuragat
 Wofignif
 Rigehos
 Decebpe
 Owiwala
 Potuwij
 Imzopwa
 Essegno
 Eroujodej
 Opanpob
 Taalaed
 Luhabi
 Fiucedor
 Ekgokir
 Lovpitu
 Amokzas
 Heivuun
 Novuswa
 Donfonod
 Etokoval
 Dihozok
 Tiwsambet
 Utebedzi
 Juckeeno
 Fuafgeb
 Nugdifguj
 Kobubo
 Lukomnu
 Hupuem
 Vivuesi
 Culmicuh
 Kujajjo
 Ifagurizi
 Kalurpur
 Sienoke
 Tavdisuko
 Atozoez
 Wahpahoj
 Wanhethiv
 Mozaozi
 Nipmafvet
 Duehbe
 Lemremopi
 Zisajup
 Noppidono
 Ehtongog
 Becnephe
 Tipisuk
 Fuamrit
 Gedivhu
 Opizzag
 Dewnejaz
 Mawreka
 Cicigzur
 Jeduzne
 Zacatifug
 Difueb
 Nabvebif
 Uzapupra
 Vugizwi
 Wakewef
 Utakudwe
 Pijumupu
 Astiwu
 Wudcujre
 Laprihzir
 Mudzeule
 Finrivra
 Ferupko
 Kigvivo
 Eboange
 Idcigu
 Vezimvaf
 Leceluke
 Dorzoupe
 Dactamjo
 Himisub
 Emeatood
 Peklojo
 Jathewsow
 Wefvafo
 Bakuzij
 Fipicle
 Nelesi
 Kasiili
 Dockejme
 Kewezar
 Heconib
 Utuvulu
 Febihvin
 Raopabuj
 Lagrenak
 Pupekum
 Rusejro
 Hiaptep
 Toejlur
 Ulwidu
 Wuzcephu
 Ehisoke
 Hehesum
 Hetafu
 Nelevfun
 Venzaces
 Ugutafuz
 Icosehek
 Gamevgi
 Ruklosbi
 Wudowbo
 Maamvi
 Isomafzes
 Olutilwu
 Dudeski
 Cirapu
 Kinluubo
 Edejuri
 Vidmanu
 Feluvit
 Wituscut
 Alovosu
 Taupzes
 Melofheb
 Jurohilu
 Diijbez
 Biiwutec
 Sitkeac
 Colriucu
 Giawcuk
 Ijpiwo
 Ticamew
 Gupiop
 Luetumus
 Kodegovi
 Himuvfu
 Fimfuvri
 Idicenol
 Avugihot
 Valsudid
 Ozevezu
 Oficigid
 Kodomle
 Vefkinog
 Tallavah
 Anefela
 Akehuipo
 Zupdagpaf
 Ogikofe
 Zuhwona
 Asfoluk
 Kidpopodo
 Kibkeegi
 Misuvaz
 Beppedzo
 Lacecpab
 Bupmucac
 Hamockas
 Olulopem
 Nutbuskad
 Zejopoc
 Daugwo
 Rizidi
 Macalu
 Magevtu
 Veicvo
 Zujmiati
 Losjewti
 Ridgiwew
 Ketosbo
 Zisokwaf
 Wicubo
 Wargeun
 Mizuki
 Ragnuhwu
 Zalosun
 Futloiri
 Iwesogi
 Darpifjat
 Pusekulu
 Ludzezsu
 Tofgezro
 Filuwe
 Wasarefuh
 Lelnocuf
 Noizsa
 Lizjiggu
 Secefo
 Vapoema
 Siplisme
 Gowmulru
 Cesecje
 Feshifefi
 Tozpibdaz
 Dafkuba
 Lakicdoz
 Okuwasne
 Viesomi
 Zelivgar
 Bogijci
 Sitpedga
 Cubkocew
 Pedowude
 Pocnifno
 Zetmebika
 Wegsehe
 Efucwe
 Cistobfe
 Nufepi
 Jozfakom
 Fepfifco
 Nevseneg
 Tubmaod
 Nunuput
 Jesjaze
 Rieniku
 Ijabozsa
 Sihjisdor
 Efenepsan
 Fiwigruk
 Depkerpac
 Ojiemure
 Agehipjo
 Sahiga
 Giwparje
 Gogiccif
 Avocevge
 Laktereg
 Uzwunnid
 Roggueb
 Utumotaz
 Zipogij
 Hehubeg
 Cafnejma
 Zikukepu
 Fecfupi
 Gicnuza
 Kajiwduw
 Ihejavba
 Norbesduz
 Rehmuuwa
 Fugnosbec
 Woszapa
 Wegaek
 Abepuhjoj
 Jiposoun
 Dehtehveg
 Polepder
 Ariduzzot
 Gepjigup
 Ninvudpa
 Epimojhon
 Ajibahruk
 Pazikus
 Edumizog
 Tecehu
 Utjihdum
 Ewconip
 Wihejsij
 Wuhuaz
 Sezidacab
 Ajegevi
 Jepwana
 Vabgiis
 Siizuniz
 Cujenwem
 Wiezauto
 Pulnevi
 Hopnembi
 Odozuberu
 Kezific
 Lumucca
 Hugoweni
 Teluco
 Pusossiv
 Tunuhrac
 Tudojge
 Kaghacte
 Musamo
 Rubgacov
 Ojpefoca
 Golubfu
 Wavfurwom
 Tagaak
 Bocnozjuz
 Juzojpi
 Peboifa
 Jufuope
 Otikpe
 Bipesem
 Kolescep
 Dohivud
 Nuurpag
 Dawokujo
 Owwaku
 Juehedol
 Soremkut
 Ohujonil
 Igcajmuv
 Civmiuv
 Bometa
 Kekokwo
 Upadevena
 Batguer
 Rejilfaw
 Aznenu
 Detpawe
 Fimtahu
 Navfohu
 Sibase
 Rerusroz
 Afukahac
 Rotedvaw
 Vawgebron
 Lavcuono
 Nejupweh
 Cuwbake
 Mehtupol
 Tonhoznem
 Lutdoflit
 Icejepa
 Dugohemif
 Imogocoji
 Bidzimoz
 Ihauhuvu
 Regigeba
 Awadawi
 Difkopa
 Paarve
 Lulewdo
 Tukgoom
 Nipkuzhuh
 Sugehanoc
 Cerivkec
 Foldenum
 Goncose
 Dokoto
 Gabcued
 Vieftiv
 Volewjeh
 Vikuszuh
 Wulkiwwiv
 Ibiujoiv
 Huzafje
 Utivpab
 Jorolom
 Iriunafi
 Bamgufet
 Rojozfab
 Ijavoti
 Cercerer
 Minwuzguk
 Ovikcul
 Erowude
 Soljedbi
 Lagmisfu
 Gurepuigo
 Roszohi
 Dalalho
 Udiluruh
 Pocodiz
 Wanalco
 Gozeto
 Wuwnipop
 Otuzulkak
 Cafafi
 Potigcag
 Igkiica
 Ebwifsas
 Kogfinjid
 Luzajge
 Neucker
 Bojisje
 Teuboac
 Jubogcad
 Cikezihu
 Bitohse
 Topbevzu
 Mupzopom
 Fojiso
 Gaznego
 Kangidhiz
 Seabaah
 Lifvimzug
 Rodfuliso
 Tejabfok
 Fuowemom
 Gizowam
 Coefuok
 Petunowif
 Jikuzjo
 Vavmoce
 Eguwejjog
 Inonedid
 Roohkah
 Ukiozon
 Fojcafca
 Dopuler
 Ujusavbo
 Fejcedik
 Gislutven
 Lonibil
 Kadodsoh
 Mutwirat
 Kibpulhi
 Tijuviv
 Woiburew
 Nenohzih
 Winhiohe
 Joicamip
 Gisbambub
 Veomiul
 Ucufobris
 Cejadiron
 Usfolje
 Luwibuj
 Betuoj
 Luhmaki
 Jeffarov
 Ucenuir
 Edrobic
 Fajadtah
 Lebisueti
 Limuzowuh
 Dijowze
 Bulegbu
 Ucinudil
 Ulfulga
 Selulvu
 Felhezuf
 Subeic
 Ajawohron
 Zattikmo
 Kobabfi
 Kegatow
 Hikrucir
 Fagsemlo
 Tufwito
 Wohuhen
 Puzgemro
 Ucotiwvic
 Godakaz
 Raoviop
 Ajehiwar
 Fijgavlo
 Isasagi
 Feijefe
 Oldusfod
 Rarvojel
 Bihojem
 Tuamowov
 Osohegar
 Vefici
 Wiebni
 Emacabo
 Jewuca
 Hemtesmoz
 Revibpih
 Ditiir
 Niwombe
 Ronvehpu
 Pulkuhwam
 Mufpucok
 Sivomu
 Actobzil
 Ragjuzgik
 Lepito
 Acwivnim
 Wefudve
 Ranvuku
 Irolejopu
 Gojuzol
 Sarfupop
 Godfidi
 Favava
 Domjinguc
 Ikuboguv
 Sornatmop
 Lenano
 Nelabuj
 Cezweasi
 Unegodmo
 Afcotig
 Vepizfub
 Puduzzi
 Sapgawad
 Vubhiav
 Amlepne
 Vesolab
 Gamuzma
 Hobgerep
 Sijbewu
 Vapadko
 Harapi
 Umanoik
 Fawhaah
 Agpoblon
 Dezegfu
 Ruragife
 Siforbot
 Mihutepit
 Najsodfu
 Buduhu
 Amjiziv
 Belivic
 Wovuuki
 Kucori
 Cogajgim
 Boukta
 Kudnosu
 Zucepah
 Ocebeemi
 Kalabibo
 Davkevo
 Wubavun
 Zirpahe
 Olzizofa
 Tugwogeb
 Vowdezso
 Sokiwu
 Muvaji
 Vunlerok
 Tuhpuhti
 Zarzipi
 Piwatiwi
 Ziculon
 Lajodaelo
 Worogew
 Buvivi
 Unpuicu
 Fitupif
 Ganonko
 Ultuze
 Pakpamzo
 Kamlakof
 Vejifij
 Totowube
 Otucesof
 Iminulefe
 Ofubegzo
 Mormumige
 Tuhmugop
 Obbijmid
 Pobkupi
 Adsorigi
 Bagcodbum
 Kozulog
 Cotruktuv
 Biebekis
 Wadlouc
 Lokafe
 Wugokkuc
 Apmoer
 Duetagad
 Gutjala
 Sohakme
 Bukeksi
 Ruparje
 Bomgaci
 Duwebowum
 Monvewasa
 Datehuw
 Jinkisra
 Toihico
 Pegulfit
 Hipebud
 Neweuzi
 Fofeto
 Molinzo
 Taismed
 Nehojit
 Isidusuce
 Gafosro
 Jebotamo
 Abgikcu
 Optajam
 Oljileg
 Verjetval
 Zepvudor
 Enozofilo
 Zotegued
 Rigsuvgi
 Bisbeze
 Paodut
 Wazlifu
 Zazubanic
 Zulveseko
 Vijuni
 Uwgoddi
 Jijgoteb
 Ubuvazve
 Jugduke
 Monkutam
 Nerofid
 Gowkudkat
 Lisujaw
 Ruprubwo
 Ohhijtug
 Eguuvino
 Bupcowpoc
 Jetkanop
 Kacale
 Fadrevafe
 Sotenal
 Mewwawor
 Agveim
 Bajareg
 Vulehpaj
 Soegjav
 Ravwisal
 Fimufru
 Hujito
 Leceteg
 Urmighe
 Umuoclo
 Wanfoez
 Zezzunbov
 Keuhta
 Kumhadepe
 Deoweja
 Avaguga
 Rozezej
 Pivuwo
 Viwavbal
 Poatuliw
 Galawjor
 Lecotu
 Alteeve
 Sijuhpul
 Dozfuwbe
 Ibvares
 Leehdo
 Gichifuf
 Azimrum
 Faovefi
 Itnupvi
 Dausawa
 Ufpobno
 Siolhi
 Umvutfoz
 Bololri
 Pijenu
 Sampefod
 Becavava
 Mohecam
 Oghivnu
^CTime: 338.396 ms
postgres=# \d large_data;
                     Table "public.large_data"
  Column  |          Type          | Collation | Nullable | Default
----------+------------------------+-----------+----------+---------
 name     | character varying(100) |           |          |
 ccnumber | character varying(30)  |           |          |
 city     | character varying(30)  |           |          |
 age      | integer                |           |          |
 phone    | character varying(20)  |           |          |


postgres=# select count(*) from large_data where age between 10 and 100;
 count
-------
     6
(1 row)


Time: 142.379 ms
postgres=# copy large_data from 'd:\\convertcsv.csv' delimiter ',' csv header;
COPY 100000
Time: 493.571 ms
postgres=# select count(*) from large_data;
 count
--------
 200000
(1 row)


Time: 40.554 ms
postgres=# select count(age) from large_data where age between 10 and 100;
 count
-------
    12
(1 row)


Time: 434.507 ms
postgres=# select count(name) from large_data where name like 'Dan%';
 count
-------
   760
(1 row)


Time: 41.585 ms
postgres=# select count(name) from large_data where name like 'arp%';
 count
-------
     0
(1 row)


Time: 41.024 ms
postgres=# select count(name) from large_data where name like '%arp';
 count
-------
   436
(1 row)


Time: 55.636 ms
postgres=# select count(name) from large_data where name like '%ders%';
 count
-------
  1594
(1 row)


Time: 50.512 ms
postgres=# create index i_age on large_data(age);
CREATE INDEX
Time: 886.277 ms
postgres=# select count(age) from large_data where age between 10 and 100;
 count
-------
    12
(1 row)


Time: 8.835 ms
postgres=# drop index i_age;
DROP INDEX
Time: 200.107 ms
postgres=# select count(age) from large_data where age between 10 and 100;
 count
-------
    12
(1 row)


Time: 217.277 ms
postgres=# create index i_age on large_data(age);
CREATE INDEX
Time: 761.128 ms
postgres=# select count(age) from large_data where age between 10 and 100;
 count
-------
    12
(1 row)


Time: 8.248 ms
postgres=# select count(city) from large_data where city like 'Casilga%';
 count
-------
     0
(1 row)


Time: 45.612 ms
postgres=# select count(city) from large_data where city like 'Ca%';
 count
-------
  1768
(1 row)


Time: 42.861 ms
postgres=# create index i_city on large_data(city);
CREATE INDEX
Time: 2386.007 ms (00:02.386)
postgres=# select count(city) from large_data where city like 'Ca%';
 count
-------
  1768
(1 row)


Time: 48.502 ms
postgres=# select count(city) from large_data where city ='Acjahi';
 count
-------
     2
(1 row)


Time: 4.028 ms
postgres=# explain analyze select count(city) from large_data where city ='Acjahi';
                                                          QUERY PLAN
------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=4.46..4.47 rows=1 width=8) (actual time=0.087..0.088 rows=1 loops=1)
   ->  Index Only Scan using i_city on large_data  (cost=0.42..4.45 rows=2 width=8) (actual time=0.070..0.073 rows=2 loops=1)
         Index Cond: (city = 'Acjahi'::text)
         Heap Fetches: 0
 Planning Time: 0.312 ms
 Execution Time: 0.168 ms
(6 rows)


Time: 160.815 ms
postgres=# create table t1 (name varchar(10), age integer);
CREATE TABLE
Time: 59.978 ms
postgres=# insert into t1 values('Karthik', 22);
INSERT 0 1
Time: 4.385 ms
postgres=# insert into t1 values('Karthik', 23);
INSERT 0 1
Time: 2.843 ms
postgres=# select * from t1;
  name   | age
---------+-----
 Karthik |  22
 Karthik |  23
(2 rows)


Time: 2.007 ms
postgres=# delete from t1;
DELETE 2
Time: 69.734 ms
postgres=# create unique index on t1(name);
CREATE INDEX
Time: 50.929 ms
postgres=# insert into t1 values('Karthik', 23);
INSERT 0 1
Time: 77.281 ms
postgres=# insert into t1 values('Karthik', 25);
ERROR:  duplicate key value violates unique constraint "t1_name_idx"
DETAIL:  Key (name)=(Karthik) already exists.
Time: 51.867 ms
postgres=#