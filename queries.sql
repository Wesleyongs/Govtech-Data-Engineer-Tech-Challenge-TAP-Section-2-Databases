-- I want to know the list of our customers and their spending.
WITH customer_spending
     AS (SELECT customer_name,
                price
         FROM   car c
                INNER JOIN TRANSACTION t
                        ON c.serial_number = t.serial_number)
SELECT customer_name,
       Sum(price) AS total_spending
FROM   customer_spending
GROUP  BY customer_name 

-- I want to find out the top 3 car manufacturers that customers bought by sales (quantity) 
-- and the sales number for it in the current month.
WITH manafacturer_sales
     AS (SELECT manafacturer,
                price,
                ts
         FROM   car c
                inner join TRANSACTION t
                        ON c.serial_number = t.serial_number
         WHERE  To_char(Now() :: DATE, 'Month') = To_char(ts :: DATE, 'Month'))
SELECT manafacturer,
       Count(manafacturer) AS total_transactions
FROM   manafacturer_sales
GROUP  BY manafacturer 

