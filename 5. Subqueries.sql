SELECT
    product_id,
    total_sales, order_item_id
FROM (
    SELECT
        products.product_id,order_item_id,
        SUM(order_items.price * order_items.order_item_id) AS total_sales
    FROM
        order_items
    JOIN
        products ON order_items.product_id = products.product_id
    GROUP BY
        products.product_id, order_item_id
) AS sales_summary
WHERE
    total_sales > 10000;