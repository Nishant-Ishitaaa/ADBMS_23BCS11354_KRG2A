-- Ques1

-- 1. Create the table
CREATE TABLE transaction_data (
    id INT,
    value NUMERIC
);

-- 2. Insert 1 million records for id = 1
INSERT INTO transaction_data (id, value)
SELECT 1, (random() * 100)::NUMERIC
FROM generate_series(1, 1000000);

-- 3. Insert 1 million records for id = 2
INSERT INTO transaction_data (id, value)
SELECT 2, (random() * 100)::NUMERIC
FROM generate_series(1, 1000000);

-- 4. Create a normal view
CREATE OR REPLACE VIEW sales_summary_view AS
SELECT
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    AVG(value) AS avg_transaction
FROM transaction_data
GROUP BY id;

-- 5. Analyze execution and performance
EXPLAIN ANALYZE
SELECT * FROM sales_summary_view;


-- Ques2


CREATE VIEW vW_ORDER_SUMMARY AS 
SELECT  
    O.order_id, 
    O.order_date, 
    P.product_name, 
    C.full_name, 
    (P.unit_price * O.quantity) - ((P.unit_price * O.quantity) * O.discount_percent / 100) AS final_cost 
FROM customer_master AS C 
JOIN sales_orders AS O  
    ON O.customer_id = C.customer_id 
JOIN product_catalog AS P 
    ON P.product_id = O.product_id; 
 
SELECT * FROM vW_ORDER_SUMMARY; 
 
 
 
CREATE ROLE CLIENT_USER 
LOGIN 
PASSWORD 'client_password'; 
 
GRANT SELECT ON vW_ORDER_SUMMARY TO CLIENT_USER; 
 
REVOKE SELECT ON vW_ORDER_SUMMARY FROM CLIENT_USER; 