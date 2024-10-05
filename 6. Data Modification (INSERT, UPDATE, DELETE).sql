select * from orders;


UPDATE orders
SET order_estimated_delivery_date = DATE(order_estimated_delivery_date);
