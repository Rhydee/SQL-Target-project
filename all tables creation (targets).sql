use target;

-- Table Customers
  
  CREATE TABLE IF NOT EXISTS Customers (
  customer_id VARCHAR(45) NOT NULL,
  customer_unique_id VARCHAR(45) NOT NULL,
  customer_zip_code_prefix INT NOT NULL,
  customer_city VARCHAR(45) NOT NULL,
  customer_state VARCHAR(45) NOT NULL,
  PRIMARY KEY (customer_id),
  INDEX idx_customer_zip_code_prefix (customer_zip_code_prefix)
  );

-- Table geolocation

CREATE TABLE IF NOT EXISTS geolocation (
	geolocation_zip_code_prefix INT NOT NULL,
	geolocation_lat VARCHAR(45) NOT NULL,
	geolocation_lng VARCHAR(45) NOT NULL,
	geolocation_city VARCHAR(45) NOT NULL,
	geolocation_state VARCHAR(45) NOT NULL,
	PRIMARY KEY (geolocation_zip_code_prefix),
	FOREIGN KEY(geolocation_zip_code_prefix) REFERENCES Customers (customer_zip_code_prefix));


-- Table products
CREATE TABLE IF NOT EXISTS products (
  product_id VARCHAR(45) NOT NULL,
  product_category VARCHAR(45),
  product_name_lenght VARCHAR(45),
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm BINARY(2) ,
  product_height_cm BINARY(2) ,
  product_width_cm BINARY(2) ,
  PRIMARY KEY (product_id)
);


-- Table sellers
CREATE TABLE IF NOT EXISTS sellers (
  seller_id VARCHAR(45) NOT NULL,
  seller_zip_code_prefix INT NOT NULL,
  seller_city VARCHAR(45) NOT NULL,
  seller_state VARCHAR(45) NOT NULL,
  PRIMARY KEY (seller_id)
  );


-- Table orders
CREATE TABLE IF NOT EXISTS orders (
  order_id VARCHAR(45) NOT NULL,
  customer_id VARCHAR(45) NOT NULL,
  order_status VARCHAR(45) NOT NULL,
  order_purchase_timestamp DATETIME NOT NULL,
  order_approved_at DATETIME,
  order_delivered_carrier_date DATETIME,
  order_delivered_customer_date DATETIME,
  order_estimated_delivery_date DATETIME NOT NULL,
  PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) REFERENCES Customers (customer_id) ON DELETE cascade
);


-- Table order_items
CREATE TABLE IF NOT EXISTS order_items (
  order_id VARCHAR(45) NOT NULL,
  order_item_id VARCHAR(45) NOT NULL,
  product_id VARCHAR(45),
  seller_id VARCHAR(45) NOT NULL,
  shipping_limit_date DATE NOT NULL,
  price DECIMAL(2) NOT NULL,
  freight_value VARCHAR(45) NOT NULL,
  PRIMARY KEY (order_item_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id) ON DELETE cascade,
    FOREIGN KEY (seller_id) REFERENCES sellers (seller_id) ON DELETE cascade,
    FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE cascade
);

-- Table payments

CREATE TABLE IF NOT EXISTS payments (
  order_id VARCHAR(45) NOT NULL,
  payment_sequential INT UNSIGNED NOT NULL,
  payment_type VARCHAR(45) NOT NULL,
  payment_installments INT NOT NULL,
  payment_value DECIMAL(2) NOT NULL,
  PRIMARY KEY (order_id),
 FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE cascade
    );