DROP DATABASE IF EXISTS `g_ecommerce_db`;
CREATE DATABASE `g_ecommerce_db`;
USE g_ecommerce_db;

CREATE TABLE `users` (
  `user_id` INT, 
  `user_email` VARCHAR(100), 
  `user_password` VARCHAR(100), 
  `user_first_name` VARCHAR(50), 
  `user_last_name` VARCHAR(50), 
  `user_city` VARCHAR(50), 
  `user_state` VARCHAR(20), 
  `user_zip` VARCHAR(12), 
  `user_email_verified` TINYINT, 
  `user_verification_code` VARCHAR(20), 
  `user_ip` VARCHAR(50), 
  `user_phone` VARCHAR(20), 
  `user_fax` VARCHAR(20), 
  `user_country` VARCHAR(20), 
  `user_address` VARCHAR(1000), 
  `user_address_2` VARCHAR(250), 
  PRIMARY KEY (user_id)
);
  

CREATE TABLE `orders` (
  `order_id` INT, 
  `order_user_id` INT, 
  `order_amount` FLOAT, 
  `order_ship_name` VARCHAR(100), 
  `order_ship_address` VARCHAR(100), 
  `order_city` VARCHAR(50), 
  `order_state` VARCHAR(50), 
  `order_zip` VARCHAR(20), 
  `order_country` VARCHAR(50), 
  `order_phone` VARCHAR(20), 
  `order_fax` VARCHAR(20), 
  `order_shipping` FLOAT, 
  `order_tax` FLOAT, 
  `order_email` VARCHAR(100), 
  `order_shipped` TINYINT, 
  `order_trading_number` VARCHAR(100), 
  PRIMARY KEY (order_id), 
  FOREIGN KEY (order_user_id) REFERENCES users (user_id) 
);
  

CREATE TABLE `option_group` (
  `option_group_id` INT, 
  `option_group_name` VARCHAR(50), 
  PRIMARY KEY(option_group_name) 
);


CREATE TABLE `product_categories` (
  `category_id` INT, 
  `category_name` VARCHAR(50), 
  PRIMARY KEY(category_id) 
);


CREATE TABLE `products`(
  `product_id` INT AUTO_INCREMENT, 
  `product_sku` VARCHAR(50), 
  `product_price` FLOAT, 
  `product_weight` FLOAT, 
  `product_cart_desc` VARCHAR(250), 
  `product_short_desc` VARCHAR(250), 
  `product_long_desc` TEXT, 
  `product_thumb` VARCHAR (100), 
  `productImage` VARCHAR (250), 
  `product_category_id` INT, 
  `product_update_date` TIMESTAMP, 
  `product_stock` FLOAT, 
  `product_live` TINYINT, 
  `product_location` VARCHAR(250), 
  PRIMARY KEY (product_id), 
  FOREIGN KEY (product_category_id) REFERENCES product_categories (category_id) 
);


CREATE TABLE `order details` (
  `detail_id` INT, 
  `detail_order_id` INT, 
  `detail_product_id` INT, 
  `detail_name` VARCHAR(250), 
  `detail_price` FLOAT, 
  `detail_sku` VARCHAR(250), 
  `detail_quantity` INT, 
  FOREIGN KEY(detail_order_id) REFERENCES orders(order_id), 
  FOREIGN KEY(detail_product_id) REFERENCES products(product_id) 
);


CREATE TABLE `options` (
  `option_id` INT, 
  `option_name` VARCHAR(50), 
  PRIMARY KEY(option_id), 
  FOREIGN KEY(option_name) REFERENCES option_group(option_group_name) 
);


CREATE TABLE `product_options` (
  `product_option_id` INT, 
  `option_id` INT, `product_id` INT, 
  `option_group_id` INT, 
  `option_price_increment` DOUBLE, 
  FOREIGN KEY(option_id) REFERENCES options(option_id), 
  FOREIGN KEY(product_id) REFERENCES products(product_id) 
);





