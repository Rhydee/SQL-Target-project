--- Business Problem 1: High-Value Transactions (Find all transactions where the payment value exceeds a certain threshold)
SELECT order_id, payment_value
FROM payments
having payment_value > 2500
order by payment_value desc;

--- Business Problem 2: Specific Product Category (Retrieve products belonging to a specific category, such as "electronics.")
SELECT *
FROM products
WHERE product_category_name = "electronics" and product_photos_qty>=5
order by product_weight_g desc;

--- Business Problem 3: Customer Activity ( Identify customers who have made purchases in the last month of the year. )

SELECT customer_id, order_id, order_purchase_timestamp, MONTH(order_purchase_timestamp) as Month, year(order_purchase_timestamp) as year
FROM orders
WHERE MONTH(order_purchase_timestamp) = 12 and order_status = 'delivered'
ORDER BY order_purchase_timestamp DESC;