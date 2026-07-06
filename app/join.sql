
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- データベース: `mysql_sample`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `a_table`
--

CREATE TABLE `a_table` (
  `id` int UNSIGNED NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `a_table`
--

INSERT INTO `a_table` (`id`, `name`) VALUES
(1, 'あ'),
(2, 'い'),
(3, 'う'),
(4, 'え'),
(5, 'お');

ALTER TABLE `a_table`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `a_table`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;



-- --------------------------------------------------------

--
-- テーブルの構造 `b_table`
--

CREATE TABLE `b_table` (
  `id` int UNSIGNED NOT NULL,
  `a_table_id` int UNSIGNED NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- テーブルのデータのダンプ `b_table`
--

INSERT INTO `b_table` (`id`, `a_table_id`, `name`) VALUES
(1, 3, 'three'),
(2, 5, 'five'),
(3, 3, 'three 2'),
(4, 100, 'one hundred');

ALTER TABLE `b_table`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `b_table`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;



-- --------------------------------------------------------


-- INNER JOIN
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
INNER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;


-- LEFT OUTER JOIN (LEFT JOIN)
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
LEFT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;


-- RIGHT OUTER JOIN (RIGHT JOIN)
SELECT a.*, b.a_table_id, b.name as b_name FROM a_table as a
RIGHT OUTER JOIN b_table as b ON a.id = b.a_table_id WHERE 1;
