--- Business Problem 1: Promotional Discounts(Apply a 9% discount to all products in a specific category (e.g., "electronics").)

update order_items
join products 
on products.product_id = order_items.product_id
join payments
on payments.order_id = order_items.order_id
SET order_items.price = order_items.price * 0.09
WHERE products.product_category_name = 'electronics';

--- Business Problem 2: Remove low weight products(Remove products with weight gram less than 5gram)

DELETE FROM products
WHERE product_weight_g <5

