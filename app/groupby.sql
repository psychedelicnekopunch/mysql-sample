
-- GROUP BY
-- Expression #4 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'mysql_sample.b.name' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
--
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- https://dev.mysql.com/doc/refman/8.0/ja/group-by-handling.html
-- 多分、どのレコードを選択するべきか判断できない場合エラーになる。
--
-- 上記のエラーは、
-- GROUP BY a.id したいんだけど、
-- 'mysql_sample.b.name' がその状態になっていたため起きたエラー。
--
-- SELECT からその原因（'mysql_sample.b.name'）を取り除くか MAX() や MIN()、 SUM() などで対応する。
--


-- 'mysql_sample.b.name' を SELECT から除く
SELECT a.*, b.a_table_id FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;


-- 'mysql_sample.b.name' を MAX() や MIN() で指定
SELECT a.*, b.a_table_id, MAX(b.name) as b_name FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1 GROUP BY a.id;

