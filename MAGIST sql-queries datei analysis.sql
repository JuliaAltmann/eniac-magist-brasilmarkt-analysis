USE magist;

-- 1 How many orders are there in the dataset?
SELECT COUNT(*)
FROM orders;

-- 2 Are orders actually delivered?
SELECT DISTINCT order_status,
				COUNT(*) -- COUNT(order_status)
FROM orders
GROUP BY order_status;

-- 3 Is Magist having user growth? 
SELECT YEAR(order_purchase_timestamp) AS Year, 
		COUNT(*)
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY Year;

SELECT YEAR(order_purchase_timestamp) AS Year, 
		MONTH(order_purchase_timestamp) AS Month,
        COUNT(customer_id) -- COUNT(*)
FROM orders
GROUP BY YEAR(order_purchase_timestamp),
		MONTH(order_purchase_timestamp)
ORDER BY Year,
		Month;
        
        -- für passende Kategorie
SELECT YEAR(o.order_purchase_timestamp) AS Year, 
		MONTH(o.order_purchase_timestamp) AS Month,
        COUNT(o.order_id) AS Alle_Kategorie_Bestellungen,
        ROUND(COUNT(o.order_id) / (SELECT COUNT(*) FROM orders) * 100, 2) AS Prozent_von_alle,
        COUNT(DISTINCT CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN o.order_id
            END) AS passende_Kategorie_Bestellungen,
		ROUND(COUNT(DISTINCT CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN o.order_id
            END) / COUNT(o.order_id) * 100, 2) AS Prozent_von_passende
FROM orders AS o
LEFT JOIN order_items AS oi
		ON o.order_id = oi.order_id
LEFT JOIN products AS p
		ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pn
		ON p.product_category_name = pn.product_category_name
GROUP BY YEAR(order_purchase_timestamp),
		MONTH(order_purchase_timestamp)
ORDER BY Year,
		Month;

-- 4 How many products are there on the products table?
SELECT COUNT(DISTINCT product_id) AS product_count,
		COUNT(DISTINCT product_category_name) AS category_count
FROM products;

-- 5 Which are the categories with the most products?
SELECT DISTINCT product_category_name,
		COUNT(DISTINCT product_id) AS product_count
FROM products
GROUP BY product_category_name
ORDER BY product_count DESC;

-- Ergebnise von Tim

SELECT
    p.product_category_name AS kategorie_portugiesisch,
    t.product_category_name_english AS kategorie_englisch,
    COUNT(DISTINCT p.product_id) AS anzahl_produkte
FROM magist.products AS p
LEFT JOIN magist.product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
GROUP BY
    p.product_category_name,
    t.product_category_name_english
ORDER BY
    anzahl_produkte DESC;


-- 6 How many of those products were present in actual transactions? ALL
SELECT COUNT(DISTINCT product_id)
FROM order_items;


-- 7 What’s the price for the most expensive and cheapest products? 
SELECT MAX(price), MIN(price)
FROM order_items;

-- 8 What are the highest and lowest payment values? 
SELECT MAX(payment_value), MIN(payment_value)
FROM order_payments;

-- What categories of tech products does Magist have?
SELECT
    p.product_category_name AS kategorie_portugiesisch,
    t.product_category_name_english AS kategorie_englisch,
    COUNT(DISTINCT p.product_id) AS anzahl_produkte
FROM magist.products AS p
LEFT JOIN magist.product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
GROUP BY
    p.product_category_name,
    t.product_category_name_english
ORDER BY
    anzahl_produkte DESC;
    
    
-- 2.1 PRODUCT
-- How many products of these tech categories have been sold (within the time window of the database snapshot)? 
-- What percentage does that represent from the overall number of products sold?
-- What’s the average price of the products being sold?
-- Are expensive tech products popular? *
-- TIP: Look at the function CASE WHEN to accomplish this task.
SELECT
    p.product_category_name AS kategorie_portugiesisch,
    t.product_category_name_english AS kategorie_englisch,
    COUNT(DISTINCT p.product_id) AS anzahl_produkte,
    COUNT(oi.product_id) AS verkauft_produkte,
    ROUND(COUNT(oi.product_id) / (SELECT COUNT(product_id) FROM order_items) * 100, 2) AS prozent_von_verkauf,
    ROUND(SUM(oi.price), 2) AS sum_verkauf,
    ROUND(SUM(oi.price) / (SELECT SUM(price) FROM order_items) * 100, 2) AS prozent_sum_verkauf,
    ROUND(AVG(oi.price), 2) AS avg_price,
    (SELECT ROUND(AVG(price), 2) FROM order_items) AS AVG
FROM magist.products AS p
LEFT JOIN magist.product_category_name_translation AS t
    ON p.product_category_name = t.product_category_name
lEFT JOIN order_items AS OI
	ON p.product_id = oi.product_id
WHERE t.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
GROUP BY
    p.product_category_name,
    t.product_category_name_english
ORDER BY
    anzahl_produkte DESC;


-- 2.2. In relation to the sellers:
-- How many months of data are included in the magist database?
SELECT MIN(order_purchase_timestamp) AS min_date,
		MAX(order_purchase_timestamp) AS max_date,
        TIMESTAMPDIFF (MONTH, MIN(order_purchase_timestamp), MAX(order_purchase_timestamp)) AS datebase_in_month
FROM orders;

-- How many sellers are there? How many Tech sellers are there? What percentage of overall sellers are Tech sellers?
SELECT COUNT(DISTINCT(oi.seller_id)) AS anzahl_verkäufer,
		COUNT(DISTINCT CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.seller_id
            END) AS anzahl_tech_verkäufer,
            ROUND(COUNT(DISTINCT CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.seller_id
            END) / COUNT(DISTINCT(oi.seller_id)) * 100, 2) AS prozent_tech_verkäufer
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pn ON pn.product_category_name = p.product_category_name
;

-- What is the total amount earned by all sellers? What is the total amount earned by all Tech sellers?
SELECT ROUND(SUM(oi.price), 2) AS verdienstsumme,
		ROUND(SUM(CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.price
            END), 2) AS tech_verdienstsumme,
            ROUND(SUM(CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.price
            END) / SUM(oi.price) * 100, 2) AS prozent_tech_verdienstsumme,
            ROUND(AVG(oi.price), 2) AS AVG_verdint,
            ROUND(AVG(CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.price
            END), 2) AS AVG_tech_verdient
FROM order_items AS oi
LEFT JOIN products AS p ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pn ON pn.product_category_name = p.product_category_name
;

-- Can you work out the average monthly income of all sellers? Can you work out the average monthly income of Tech sellers?
SELECT CASE
			WHEN 1>0 THEN YEAR(o.order_purchase_timestamp)
            END AS year_extract,
		CASE
            WHEN 1>0 THEN MONTH(o.order_purchase_timestamp)
            END AS moth_extract,
            oi.order_id,
            ROUND(oi.price, 2) AS price
	FROM orders AS o
    RIGHT JOIN order_items AS oi ON o.order_id = oi.order_id
    ORDER BY year_extract,moth_extract;

SELECT YEAR(o.order_purchase_timestamp) AS Year, 
		MONTH(o.order_purchase_timestamp) AS Month,
        ROUND(AVG(oi.price), 2) AS AVG_verdint,
        ROUND(AVG(CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN oi.price
            END), 2) AS AVG_tech_verdienstsumme
FROM orders AS o
LEFT JOIN order_items AS oi
		ON o.order_id = oi.order_id
LEFT JOIN products AS p
		ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pn
		ON p.product_category_name = pn.product_category_name
GROUP BY YEAR(order_purchase_timestamp),
		MONTH(order_purchase_timestamp)
ORDER BY Year,
		Month;
        
        
-- 2.3. In relation to the delivery time:
-- What’s the average time between the order being placed and the product being delivered?
SELECT ROUND(AVG(DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)), 0) AS AVG_zeit_lieferung,
		ROUND(AVG(
        CASE
			WHEN pn.product_category_name_english IN ('Computers_accessories', 
													'telephony', 
                                                    'electronics', 
                                                    'audio', 
                                                    'computers', 
                                                    'tablets_printing_image')
			THEN DATEDIFF(o.order_delivered_customer_date, o.order_purchase_timestamp)
            END), 0) AS AVG_tech_zeit_liefer
FROM orders AS o
LEFT JOIN order_items AS oi
		ON o.order_id = oi.order_id
LEFT JOIN products AS p
		ON oi.product_id = p.product_id
LEFT JOIN product_category_name_translation AS pn
		ON p.product_category_name = pn.product_category_name;

