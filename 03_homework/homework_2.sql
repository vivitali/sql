-- # SELECT
-- 1. Write a query that returns everything in the customer table.

SELECT * FROM customer

-- 2. Write a query that displays all of the columns and 10 rows from the customer table, sorted by customer*last_name, then customer_first* name.

SELECT  * FROM customer
ORDER BY  customer_last_name, customer_first_name
LIMIT 10

-- # WHERE
-- 1. Write a query that returns all customer purchases of product IDs 4 and 9.
SELECT * FROM customer_purchases
WHERE product_id = 4 OR product_id = 9


-- 2. Write a query that returns all customer purchases and a new calculated column 'price' (quantity \* cost_to_customer_per_qty), filtered by vendor IDs between 8 and 10 (inclusive) using either:
--    1. two conditions using AND
SELECT *,  (cost_to_customer_per_qty * quantity) AS price
FROM customer_purchases
WHERE  vendor_id >= 8 AND vendor_id <= 10
   
--     2. one condition using BETWEEN
SELECT *,  (cost_to_customer_per_qty * quantity) AS price
FROM customer_purchases
WHERE  vendor_id  BETWEEN 8 and 10


-- # CASE
--     1.

SELECT  product_id,  product_name ,
CASE
        WHEN product_qty_type = 'unit' THEN 'unit'
        ELSE 'bulk'
END AS prod_qty_type_condensed
FROM product

--     2.
SELECT 
    product_id, 
    product_name, 
    CASE 
        WHEN product_qty_type = 'unit' THEN 'unit' 
        ELSE 'bulk' 
    END AS prod_qty_type_condensed,
    CASE 
        WHEN LOWER(product_name) LIKE '%pepper%' THEN 1 
        ELSE 0 
    END AS pepper_flag
FROM 
    product;

	
-- # JOIN
SELECT 
    vendor.*, 
    vendor_booth_assignments.* 
FROM 
    vendor
INNER JOIN 
    vendor_booth_assignments 
ON 
    vendor.vendor_id = vendor_booth_assignments.vendor_id 
ORDER BY 
    vendor.vendor_name, 
    vendor_booth_assignments.market_date;
