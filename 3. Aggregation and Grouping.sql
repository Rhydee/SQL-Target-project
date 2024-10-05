use target;
--- Business Problem 1: Revenue by Seller Location (Average Product Weight by Category in escening order of average weight)

SELECT product_category_name , AVG(product_weight_g) AS average_weight
FROM products
GROUP BY product_category_name
ORDER BY average_weight desc;


--- Business Problem 2: Count of Customers by State ( Determine the number of customers located in each state)
SELECT customer_state, count(customer_unique_id)
FROM customers
Group by customer_state;

--- Business Problem 3: Monthly Order Counts (Calculate the number of orders placed each month.)
SELECT date_format( order_purchase_timestamp, '%Y-%M' ) as order_month, count(Order_ID)
FROM orders
Group by date_format (order_purchase_timestamp, '%Y-%M')
order by count(Order_ID) desc;

---  Business problem 4. calculate the total revenue made from all payments in the business.
SELECT SUM(payment_value) AS total_revenue FROM payments;