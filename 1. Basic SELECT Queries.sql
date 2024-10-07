--- Business Problem 1: Retrieving Customer Information (Extract essential customer details to understand the geographic distribution of your customer base)

SELECT 
    customer_id, 
    customer_city, 
    customer_state 
FROM 
    Customers;
    
--- Business Problem 2: Fetching Product Categories(Identify the different categories of products listed in the inventory.)
SELECT 
    DISTINCT product_category_name 
FROM 
    products;
    
--- Product Weight Analysis (Fetch product weights to analyze logistics requirements for product shipping.)
SELECT 
    product_id, 
    product_weight_g 
FROM 
    products
order by  product_weight_g desc;