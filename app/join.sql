
-- INNER JOIN
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;


-- LEFT OUTER JOIN (LEFT JOIN)
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
LEFT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;


-- RIGHT OUTER JOIN (RIGHT JOIN)
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
RIGHT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;
