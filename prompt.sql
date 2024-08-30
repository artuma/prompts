-- подсказки, заметки использования sql
/*
SELECT -- перечисление полей результирующей таблицы
FROM -- указание источника данных
WHERE -- фильтрация данных
GROUP BY -- группировка данных
HAVING -- фильтрация данных после группировки
ORDER BY -- сортировка результирующей таблицы
LIMIT -- ограничение количества выводимых записей
*/
SELECT column_1, column_2
FROM table
ORDER BY column_1 DESC, column_2 -- ASC по умолчанию
LIMIT 100
--
SELECT LENGTH(column) AS column_length
FROM table
-- LENGTH ф-я одсчитывает количество символов в поданном ей на вход значении текстового типа
SELECT function_one(function_two(a, b), c)
-- Функция SPLIT_PART разбивает поданную ей на вход строку на несколько частей в соответствии с указанным разделителем и возвращает одну из частей.
SELECT SPLIT_PART('one.two', '.', 2)
Результат:
two

SELECT CAST(column AS VARCHAR)
FROM table

SELECT column::VARCHAR
FROM table

SELECT CAST('100' AS INTEGER)
Результат:
100

SELECT '2022-12-31'::DATE
Результат:
31/12/22

SELECT DATE(time)
SELECT CAST(time AS DATE)
SELECT time::DATE

SELECT CONCAT('SQL', ' ', 'Simulator ', 2022)
Результат:
SQL Simulator 2022

SELECT DATE_PART(part, column)
/* На месте part необходимо в кавычках указать ту часть, которую нужно извлечь: 'year', 'month', 'day', 'hour' и т.д. На месте column следует указать нужную колонку либо конкретную дату или время. */
SELECT DATE_PART('year', DATE '2022-01-12')
Результат:
2022.00

SELECT DATE_PART('day', dates)

SELECT COALESCE(NULL, 25, 100, 150)
Результат:
25

SELECT courier_id,
       coalesce(date_part('year', birth_date)::varchar, 'unknown') as birth_year
FROM   couriers
ORDER BY birth_year desc, courier_id

select product_id, name, price as old_price, price + (price/100*5) as new_price
from products
order by new_price desc,product_id asc
/* цену повысить на 5 % */

SELECT ROUND(100.5454, 2)
Результат:
100.55

SELECT ROUND(100.551, 1)
Результат:
100.6

SELECT ROUND(100.5511)
Результат:
101.0

SELECT product_id,
       name,
       price as old_price,
       round(price*1.05, 1) as new_price
FROM   products
ORDER BY new_price desc, product_id
-- с функцией round

SELECT name,
       CASE 
       WHEN name='телятина' OR name='баранина' OR name='курица' THEN 'мясо'
       WHEN name='треска' OR name='форель' OR name='окунь' THEN 'рыба'
       ELSE 'другое'
       END AS сategory
FROM table
/*
Задание:
Повысьте цену на 5% только на те товары, цена которых превышает 100 рублей. Цену остальных товаров оставьте без изменений. Также не повышайте цену на икру, которая и так стоит 800 рублей. Выведите id и наименования всех товаров, их старую и новую цену. Цену округлять не нужно.
Результат отсортируйте сначала по убыванию новой цены, затем по возрастанию id товара.
Поля в результирующей таблице: product_id, name, old_price, new_price
SELECT*/
SELECT product_id,
       name,
       price as old_price,
       case when price <= 100 or
                 name = 'икра' then price
            when price > 100 then price*1.05
            else 0 end new_price
FROM   products
ORDER BY new_price desc, product_id
/*Назначьте скидку 20% на все товары из таблицы products и отберите те, цена на которые с учётом скидки превышает 100 рублей. Выведите id товаров, их наименования, прежнюю цену и новую цену с учётом скидки. */
SELECT
  product_id,
  name,
  price as old_price,
  price - price * 20 / 100 as new_price
FROM products
where (price - price * 20 / 100) > 100
-- или ... price*0.8 as new_price