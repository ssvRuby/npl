create table sergey_sirosh.visitors (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
create table sergey_sirosh.lab (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

create table sergey_sirosh.all_usr (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
create table sergey_sirosh.lab33 (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'LINES TERMINATED BY '\n';



load data inpath '/user/sergey.sirosh/lab03/part-00000' into table all_usr;
load data inpath '/user/sergey.sirosh/lab03/part-00000' into table lab3;

create table sergey_sirosh.categories (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
load data inpath '/user/sergey.sirosh/lab03/part-00000' into table categories;


http://cluster.newprolab.com:8080/#/main/view/HIVE/auto_hive20_instance


INSERT INTO TABLE lab SELECT uid, url from visitors where uid != '';

select uid, count(url) from lab where (url = 'cars.ru' or  url = 'avto-russia.ru' or  url = 'bmwclub.ru') group by uid having count(url) >= 10;

categories = ['cars.ru', 'avto-russia.ru', 'bmwclub.ru',
'zakon.kz', 'egov.kz', 'makler.md',
'russianfood.com', 'psychologies.ru', 'gotovim.ru',
'books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru']

select uid, url from lab where (url = 'cars.ru' or  url = 'avto-russia.ru' or  url = 'bmwclub.ru');
select uid, url from lab where (url = 'zakon.kz' or  url = 'egov.kz' or  url = 'makler.md');

hive (sergey_sirosh)> load data inpath '/user/sergey.sirosh/lab03/part-00000' into table lab3;
Loading data to table sergey_sirosh.lab3
Failed with exception org.apache.hadoop.security.AccessControlException: User does not belong to hdfs

select url, uid, count(uid) from lab33 group by url, uid;
select url, uid, count(uid) from lab33 group by url, uid having count(uid) >= 10;
select t.url, t.uid, count(t.uid) from lab33 t  group by t.url, t.uid having count(t.uid) >= 10;

#====================================================================================
select t.url, t.uid, count(t.uid), 1 from lab33 t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10;
select t.url, t.uid, count(t.uid), 2 from lab33 t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10;
select t.url, t.uid, count(t.uid), 3 from lab33 t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10;
select t.url, t.uid, count(t.uid), 4 from lab33 t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10;
#====================================================================================


select t.url, t.uid, count(t.uid), 1 from lab33 t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 2 from lab33 t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 3 from lab33 t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 4 from lab33 t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10;


select t.url, t.uid, count(t.uid), 1 c1, 0 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 0 c1, 1 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 0 c1, 0 c2, 1 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
UNION ALL
select t.url, t.uid, count(t.uid), 0 c1, 0 c2, 0 c3, 1 c4 from lab33 t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10;

#=================================================================================================================================
FROM (
    select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
    UNION ALL
    select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
    UNION ALL
    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from categories t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
    UNION ALL
    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from categories t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
     ) e
     SELECT  e.uid, sum(e.c1), sum(e.c2), sum(e.c3), sum(e.c4) group by e.uid order by e.uid;
#=================================================================================================================================

SELECT DISTINCT a.uid, IF(isnull(c.c1), 0, c.c1), IF(isnull(c.c2), 0, c.c2), IF(isnull(c.c3), 0, c.c3), IF(isnull(c.c4), 0, c.c4) FROM all_usr a
       LEFT OUTER JOIN
       (FROM (
            select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
            UNION ALL
            select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
            UNION ALL
            select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
            UNION ALL
            select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from lab33 t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
             ) e
             SELECT  e.uid, IF(sum(e.c1) > 1, 1, sum(e.c1))  c1, IF(sum(e.c2) > 1, 1, sum(e.c2)) c2, IF(sum(e.c3) > 1, 1, sum(e.c3)) c3, IF(sum(e.c4) > 1, 1, sum(e.c4)) c4 group by e.uid order by e.uid) c
             ON a.uid = c.uid
             ORDER BY int(trim(a.uid)) ASC;

CREATE TABLE result AS
        SELECT DISTINCT a.uid, IF(isnull(c.c1), 0, c.c1) c1, IF(isnull(c.c2), 0, c.c2) c2, IF(isnull(c.c3), 0, c.c3) c3, IF(isnull(c.c4), 0, c.c4) c4 FROM all_usr a
               LEFT OUTER JOIN
               (FROM (
                    select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from lab33 t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from lab33 t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
                     ) e
                     SELECT  e.uid, IF(sum(e.c1) > 1, 1, sum(e.c1))  c1, IF(sum(e.c2) > 1, 1, sum(e.c2)) c2, IF(sum(e.c3) > 1, 1, sum(e.c3)) c3, IF(sum(e.c4) > 1, 1, sum(e.c4)) c4 group by e.uid order by e.uid) c
                     ON a.uid = c.uid;



select * from result order by cast(trim(uid) as BIGINT) asc;

INSERT OVERWRITE LOCAL DIRECTORY '/data/home/sergey.sirosh/lab03_users'
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY '\t'
       SELECT * FROM result ORDER BY  cast(trim(uid) as BIGINT) asc;




create table sergey_sirosh.all_usr2 (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
load data inpath '/user/sergey.sirosh/lab03/part-00000' into table all_usr2

CREATE TABLE result AS
        SELECT DISTINCT a.uid, IF(isnull(c.c1), 0, c.c1) c1, IF(isnull(c.c2), 0, c.c2) c2, IF(isnull(c.c3), 0, c.c3) c3, IF(isnull(c.c4), 0, c.c4) c4 FROM all_usr a
               LEFT OUTER JOIN
               (FROM (
                    select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from categories t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from categories t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
                     ) e
                     SELECT  e.uid, IF(sum(e.c1) > 1, 1, sum(e.c1))  c1, IF(sum(e.c2) > 1, 1, sum(e.c2)) c2, IF(sum(e.c3) > 1, 1, sum(e.c3)) c3, IF(sum(e.c4) > 1, 1, sum(e.c4)) c4 group by e.uid order by e.uid) c
                     ON a.uid = c.uid
                     ORDER BY int(trim(a.uid)) ASC;

INSERT OVERWRITE LOCAL DIRECTORY '/data/home/sergey.sirosh/lab03_users'
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY '\t'
       SELECT * FROM result ORDER BY  cast(trim(uid) as BIGINT) asc;

CREATE TABLE result2 AS
        SELECT   a.uid uid, IF(isnull(c.c1), 0, c.c1) c1, IF(isnull(c.c2), 0, c.c2) c2, IF(isnull(c.c3), 0, c.c3) c3, IF(isnull(c.c4), 0, c.c4) c4 FROM all_usr2 a
               LEFT OUTER JOIN
               (FROM (
                    select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from categories t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from categories t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
                     ) e
                     SELECT  e.uid, IF(sum(e.c1) > 1, 1, sum(e.c1))  c1, IF(sum(e.c2) >= 1, 1, 0) c2, IF(sum(e.c3) >= 1, 1, 0) c3, IF(sum(e.c4) >= 1, 1, 0) c4 group by e.uid order by e.uid) c
                     ON a.uid = c.uid;


create table sergey_sirosh.all_usr3 (uid string, url string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
load data inpath '/user/sergey.sirosh/lab03/part-00000' into table all_usr3

CREATE TABLE result2 AS
        SELECT  DISTINCT a.uid, IF(isnull(c.c1), 0, c.c1) c1, IF(isnull(c.c2), 0, c.c2) c2, IF(isnull(c.c3), 0, c.c3) c3, IF(isnull(c.c4), 0, c.c4) c4 FROM all_usr a
               LEFT OUTER JOIN
               (FROM (
                    select t.url, t.uid, count(t.uid) cnt, 1 c1, 0 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('cars.ru', 'avto-russia.ru', 'bmwclub.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 1 c2, 0 c3, 0 c4 from categories t WHERE trim(t.url) IN ('zakon.kz', 'egov.kz', 'makler.md') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 1 c3, 0 c4 from categories t WHERE trim(t.url) IN ('russianfood.com', 'psychologies.ru', 'gotovim.ru') group by t.url, t.uid having count(t.uid) >= 10
                    UNION ALL
                    select t.url, t.uid, count(t.uid) cnt, 0 c1, 0 c2, 0 c3, 1 c4 from categories t WHERE trim(t.url) IN ('books.imhonet.ru', 'zhurnaly.biz', 'zvukobook.ru') group by t.url, t.uid having count(t.uid) >= 10
                     ) e
                     SELECT  e.uid, IF(sum(e.c1) > 1, 1, sum(e.c1))  c1, IF(sum(e.c2) >= 1, 1, 0) c2, IF(sum(e.c3) >= 1, 1, 0) c3, IF(sum(e.c4) >= 1, 1, 0) c4 group by e.uid order by e.uid) c
                     ON a.uid = c.uid;


INSERT OVERWRITE LOCAL DIRECTORY '/data/home/sergey.sirosh/lab03_users'
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY '\t'
       LINES TERMINATED BY '\n'
       SELECT trim(uid) uid, cast(c1 as STRING),
                         cast(c2 as string),
                         cast(c3 as string),
                         cast(c4 as string)
       FROM result2 ORDER BY  cast(trim(uid) as BIGINT) asc;

CREATE TABLE all_u AS
        SELECT DISTINCT uid from all_usr;

SELECT count(distinct(uid)) FROM result;
SELECT count(distinct(uid)) FROM all_u;


CREATE TABLE result2 AS
        SELECT  DISTINCT a.uid, IF(isnull(c.c1), 0, c.c1) c1,
                                IF(isnull(c.c2), 0, c.c2) c2,
                                IF(isnull(c.c3), 0, c.c3) c3,
                                IF(isnull(c.c4), 0, c.c4) c4 FROM all_usr a
               LEFT OUTER JOIN
  (FROM
    (
    FROM
      (
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'avto-russia.ru'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'cars.ru'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'bmwclub.ru'
             group by t.uid having count(t.uid) >= 10
      ) s
    SELECT  s.uid, 1 c1, 0 c2, 0 c3, 0 c4
    UNION ALL
    FROM
      (
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'zakon.kz'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'egov.kz'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'makler.md'
             group by t.uid having count(t.uid) >= 10
      ) s
    SELECT  s.uid, 0 c1, 1 c2, 0 c3, 0 c4
    UNION ALL
    FROM
      (
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'russianfood.com'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'psychologies.ru'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'gotovim.ru'
             group by t.uid having count(t.uid) >= 10
      ) s
    SELECT  s.uid, 0 c1, 0 c2, 1 c3, 0 c4
    UNION ALL
    FROM
      (
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'books.imhonet.ru'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid) from categories t
             WHERE trim(t.url) = 'zhurnaly.biz'
             group by t.uid having count(t.uid) >= 10
      UNION ALL
      select t.uid, count(t.uid)  from categories t
             WHERE trim(t.url) = 'zvukobook.ru'
             group by t.uid having count(t.uid) >= 10
      ) s
    SELECT  s.uid, 0 c1, 0 c2, 0 c3, 1 c4
      ) e
  SELECT  e.uid, IF(sum(e.c1) >= 1, 1, 0) c1,
                 IF(sum(e.c2) >= 1, 1, 0) c2,
                 IF(sum(e.c3) >= 1, 1, 0) c3,
                 IF(sum(e.c4) >= 1, 1, 0) c4
      group by e.uid) c
  ON a.uid = c.uid
  ORDER BY  cast(trim(a.uid) as BIGINT) asc;;


CREATE TABLE all_usr2 AS SELECT DISTINCT uid FROM all_usr;


========================================================================================================================
# Users Auto table - auto_users
# All users table  - all_usr
# All users med categories table  - result2
========================================================================================================================
CREATE TABLE auto_users AS
       SELECT trim(uid) uid, cast(c1 as BIGINT) c1
       FROM result2
       WHERE c1 = cast (1 as BIGINT)
       ORDER BY  cast(trim(uid) as BIGINT) asc;

CREATE TABLE clear_user AS
      SELECT url, uid from all_usr
      GROUP BY url, uid;



CREATE TABLE domains AS
      SELECT d.url, d.uid, IF(isnull(a.c1), 0, a.c1) c1 from all_usr d
      LEFT OUTER JOIN
      auto_users a
      ON trim(d.uid) = trim(a.uid);


# Sa - summ auto
CREATE TABLE sorted_domains AS
  SELECT url, uid, sum(c1) c1 from domains
      GROUP BY url, uid;

lab03s_domains.txt
========================================================================================================================
INSERT OVERWRITE LOCAL DIRECTORY '/data/home/sergey.sirosh/lab03_users'
       ROW FORMAT DELIMITED
       FIELDS TERMINATED BY '\t'
       LINES TERMINATED BY '\n'
SELECT trim(url) domain, cast (cast (c1 / 6571038  as decimal (21, 20)) /
                               cast (313527 / 6571038 as decimal (21, 20))
                         as decimal (21, 20)) relevance
FROM domains
ORDER BY relevance DESC
LIMIT 200;

CREATE TABLE count_domains AS
select url, count (url) cd from domains group by url;

CREATE TABLE rel_domains AS
SELECT d.url, d.c1, a.cd cd from domains d
      LEFT OUTER JOIN
      count_domains a
      ON trim(d.url) = trim(a.url);

CREATE TABLE rel_auto_domains AS
SELECT url, sum (c1) sc from rel_domains group by url;

CREATE TABLE relev AS
  SELECT d.url, d.c1, d.cd cd, a.sc sc from rel_domains d
  LEFT OUTER JOIN
  rel_auto_domains a
  ON trim(d.url) = trim(a.url);



SELECT trim(url) domain, cast (cast (sc / 6571038  as decimal (21, 20)) /
                              (cast (cd / 6571038 as decimal (21, 20)) * cast (313527 / 6571038 as decimal (21, 20)))
                         as decimal (21, 20)) relevance
        FROM relev
        ORDER BY relevance DESC
        LIMIT 200;
========================================================================================================================

select sum(c1) from result2;
select count(url) from domains;

select * from sorted_domains where trim(url) = 'xn--80aakahknigpedfdm6u.xn--p1ai';  # 110

========================================================================================================================
SELECT cast ( cast (110 / 6571038  as decimal (21, 20)) /
              cast (5209 / 6571038 as decimal (21, 20))
       as decimal (21, 20));
==========================

SELECT d.url, d.uid, IF(isnull(a.c1), 0, a.c1) c1, c.domain_count domain_count, p.upd upd from all_usr d
      LEFT OUTER JOIN
      auto_users a
      ON trim(d.uid) = trim(a.uid)
      LEFT OUTER JOIN
      (SELECT url, count(url) domain_count FROM all_usr GROUP BY url) c
      ON trim(d.url) = trim(c.url)
      LEFT OUTER JOIN
      (SELECT url, uid, sum(c1) upd from all_usr GROUP BY p.url, p.uid) p
      ON trim(d.uid) = trim(p.uid)
limit 2000;