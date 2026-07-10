
-- GROUP BY
-- Expression #4 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'mysql_sample.b.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
--

SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
LEFT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- https://dev.mysql.com/doc/refman/8.0/ja/group-by-handling.html
--
-- GROUP BY でまとめたいんだけど、
-- どのレコードを選択するべきか判断できない場合エラーになる。
--
-- b_table (id, a_table_id, name) の
-- (1, 3, 'three'),(3, 3, 'three 2') のどちらを結果として出力すればいいか、
-- 明確に示されていない。
--
-- 対応として、
-- SELECT からその原因（'mysql_sample.b.name'）を取り除くか、
-- MAX() や MIN()、 SUM() などで明確にする。
--


-- 'mysql_sample.b.name' を SELECT から除く
SELECT a.*, b.a_table_id FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- 'mysql_sample.b.name' を MAX() や MIN() で指定
SELECT a.*, b.a_table_id, MAX(b.name) as b_name FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- SELECT に存在していないカラムを指定できる
SELECT a.name, b.a_table_id, MAX(b.name) as b_name FROM a_table as a
LEFT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- 取得したレコードの値がバラバラになっている箇所がある
--
-- MIN() と MAX() を併用したため。
-- ある意味正しい結果が取得できている。
--
SELECT a.*, MIN(b.id), b.a_table_id, MAX(b.name) FROM a_table as a
LEFT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


