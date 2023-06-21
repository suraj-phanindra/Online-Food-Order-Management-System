create database food_delivery_system;
use food_delivery_system;


#1 creating the "users" table for the user authentication and password reset component
CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL ,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

#2 for Customer profile management, we care using following schema:
CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
name VARCHAR(50) NOT NULL,
address VARCHAR(100) NOT NULL,
payment_method VARCHAR(50) NOT NULL,
FOREIGN KEY (user_id) REFERENCES users(user_id) on delete cascade
);

#3 for the restaurant search and browsing component:
CREATE TABLE restaurants (
    restaurant_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    rating FLOAT NOT NULL,
    PRIMARY KEY (restaurant_id)
);

#4 for Restaurant management, we are using following schema:
CREATE TABLE restaurant_owner (
  owner_id  INT not null AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  restaurant_id INT NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) on delete cascade
);


#5 for the Menu browsing: 
CREATE TABLE menu_items (
  item_id INT NOT NULL AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  price DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (item_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id) on delete cascade
);


#6 for the Ordering component:
CREATE TABLE orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_time varchar(255) not null,
  order_status VARCHAR(255) NOT NULL,
  total_price double not null,
  menu_item_id INT NOT NULL,
  quantity INT NOT NULL,
  restaurant_id int not null,
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id) on delete cascade  ,

FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) on delete cascade  ,
 FOREIGN KEY (menu_item_id) REFERENCES menu_items (item_id) on delete cascade 
);

#7 for the Delivery personnel component:
CREATE TABLE delivery_personnel (
  delivery_personnel_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  phone_number VARCHAR(15) NOT NULL,
  status ENUM('available', 'unavailable') NOT NULL default 'available',
  restaurant_id INT NOT NULL,
  order_id int default null,
  PRIMARY KEY (delivery_personnel_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) on delete cascade
  -- foreign key(order_id) references restaurant_orders(order_id) on delete cascade
);



#8 for the Restaurants to manage orders:
CREATE TABLE restaurant_orders (
  order_id INT NOT NULL AUTO_INCREMENT,
  restaurant_id INT NOT NULL,
  delivery_address VARCHAR(255) NOT NULL,
  delivery_personnel_id INT,
  order_status ENUM('New', 'Preparing', 'Ready', 'On the way', 'Delivered') NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) on delete cascade,
  FOREIGN KEY (delivery_personnel_id) REFERENCES delivery_personnel(delivery_personnel_id) on delete cascade,
  foreign key (order_id) references orders(order_id) on delete cascade
);

ALTER TABLE delivery_personnel
ADD CONSTRAINT fk_delivery_personnel_order
  FOREIGN KEY (order_id)
  REFERENCES restaurant_orders(order_id)
  ON DELETE CASCADE;

#9 for the table "restaurant_analytics" for Analytics and reports for restaurants component:
CREATE TABLE restaurant_analytics (
    analytics_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    order_count INT NOT NULL,
    revenue Double NOT NULL,
    average_order_price double not null,
    CONSTRAINT fk_analytics_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id) ON DELETE CASCADE
);

#10 for the table "order_analytics" for Analytics and reports for order component:
CREATE TABLE order_analytics (
    analytics_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    date varchar(255) not null,
	customer_name varchar(255) not null,
    items varchar(255) not null,
    quantity INT NOT NULL,
    total_revenue Double NOT NULL,
    foreign key(order_id) references orders(order_id) on delete cascade
);



#11 for the table "menu_analytics" for Analytics and reports for Menu component:
CREATE TABLE menu_analytics (
    analytics_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT NOT NULL,
	item_name varchar(255) not null,
    item_price double not null,
    total_orders INT NOT NULL,
    total_revenue Double NOT NULL,
    foreign key(item_id) references menu_items(item_id) on delete cascade
);
