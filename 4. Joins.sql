use target;

--- Business Problem 1: Delivery Performance and Order Volume by Product Category pattern.(What is the average delivery time and the total number of unique orders for each product category)

SELECT product_category_name, COUNT(DISTINCT orders.order_id) AS total_orders, 
		AVG( DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) AS avg_delivery_days
FROM orders
	JOIN order_items ON orders.order_id = order_items.order_id
	JOIN products ON products.product_id = order_items.product_id
WHERE
    order_delivered_customer_date IS NOT NULL
GROUP BY 
    product_category_name
ORDER BY 
    avg_delivery_days DESC;


--- Business Problem 3: Customer and Seller Geographical Analysis (Analyze sales distribution geographically by matching customers with sellers in the same state)

SELECT DISTINCT
    seller_state,
    seller_city,
    COUNT(DISTINCT sellers.seller_id) AS Number_of_Seller,
    COUNT(DISTINCT product_id) AS Number_of_products,
    COUNT(DISTINCT customers.customer_id) AS Number_of_customers,
    COUNT(DISTINCT orders.Order_ID) AS Purchased_orders
FROM
    customers
        JOIN
    orders ON orders.customer_id = customers.customer_id
        INNER JOIN
    order_items ON order_items.order_id = orders.order_id
        INNER JOIN
    sellers ON sellers.seller_id = order_items.seller_id
GROUP BY seller_state , seller_city
ORDER BY number_of_seller DESC;
