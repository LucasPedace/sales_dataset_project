SELECT order_id, product, quantity_ordered, price_each, CONVERT(date, order_date) AS order_date1, CONVERT(time, order_time) AS order_time1, purchase_address
FROM super_market_project..Sales_October_2019

-- List of cities
-- Dallas, Los Angeles, New York, San Francisco, Boston, Portland, Atlanta, Austin, Seattle


--	TASKS: Find out the
--Total amount of sales
--Day with the most sales
--City with the most sales
--Time with the most sales
--Products commonly sold together



--Month's total sales
SELECT SUM(TRY_CAST(price_each AS NUMERIC(18, 2))) AS total_sales_daily
FROM super_market_project..Sales_October_2019


-- Daily total sales / Day with the most sales
SELECT CONVERT(date, order_date) AS order_date1, SUM(TRY_CAST(price_each AS NUMERIC(18, 2))) AS total_sales_daily
FROM super_market_project..Sales_October_2019
GROUP BY order_date
ORDER BY total_sales_daily DESC

-- Cities with the most sales
SELECT SUM(TRY_CAST(price_each AS NUMERIC(18, 2))) AS total_sales_per_city
FROM super_market_project..Sales_October_2019
WHERE Purchase_Address LIKE '%Dallas%'
--WHERE Purchase_Address LIKE '%Los Angeles%'
--WHERE Purchase_Address LIKE '%New York%'
--WHERE Purchase_Address LIKE '%San Francisco%'
--WHERE Purchase_Address LIKE '%Boston%'
--WHERE Purchase_Address LIKE '%Portland%'
--WHERE Purchase_Address LIKE '%Atlanta%'
--WHERE Purchase_Address LIKE '%Austin%'
--WHERE Purchase_Address LIKE '%Seattle%'


-- Products commonly sold together
SELECT Order_ID, product, quantity_ordered
FROM super_market_project..Sales_October_2019
WHERE Quantity_Ordered > 1
ORDER BY  Quantity_Ordered DESC