#NOTE: These sql queries are executed in application using java database connector so avoid using them as it is.
#if you want to test these in workbench you have to give give some values in place of ?, so take care of this.

#1 in CutomerRepository.java
SELECT * FROM customers WHERE customer_id = ?;
-- Above query is used to get Customer through customer_id

#2 in CutomerRepository.java
SELECT * FROM customers WHERE user_id = ?;
-- Above query is used to get Customer through user_id

#3 in CutomerRepository.java
INSERT INTO customers (name, address, payment_method) VALUES (?, ?, ?);
-- Above query is used to insert row/tuple in customers table i.e used to create new Customer.

#4 in CutomerRepository.java
UPDATE customers SET name = ?, address = ?, payment_method = ? WHERE customer_id = ?;
-- Above query is used to update details of existing customer

#5 in MenuItemRepository.java
SELECT * FROM menu_items WHERE restaurant_id = ?;
-- Above query is used to get MenuItems through RestaurantId

#6 in MenuItemRepository.java
SELECT * FROM menu_items WHERE item_id = ?;
-- Above query is used to get MenuItems through MenuItemId

#7 in MenuItemRepository.java
INSERT INTO menu_items (restaurant_id, name, description, price) VALUES (?, ?, ?, ?);
-- Above query is used to create Menu Item

#8 in MenuItemRepository.java
UPDATE menu_items SET restaurant_id = ?, name = ?, description = ?, price = ? WHERE item_id = ?;
-- Above query is used to update details of existing Menu Item

#9 in MenuItemRepository.java
DELETE FROM menu_items WHERE item_id = ?;
-- Above query is used to delete existing Menu Item

#10 in OrderRepository.java
SELECT * FROM orders WHERE customer_id = ?;
-- Above query is used to get orders through customerID

#11 in OrderRepository.java
SELECT * FROM orders WHERE order_id = ?;
-- Above query is used to get orders through userID

#12 in OrderRepository.java
INSERT INTO orders (customer_id,order_time,order_status,restaurant_id,menu_item_id,quantity,total_price)  VALUES (?, ?, ?, ?, ?, ?, ?);
-- Above query is used to create new order

#13 in OrderRepository.java
SELECT * FROM orders WHERE restaurant_id = ?;
-- Above query is used to get orders through restaurantID

#14 in RestaurantRepository.java
SELECT * FROM restaurants WHERE address LIKE ?;
-- Above query is used to search restaurants using location as filter

#14 in RestaurantRepository.java
SELECT * FROM restaurants WHERE restaurant_id = ?;
-- Above query is used to get Restaurant through restaurantID

#15 in RestaurantRepository.java
SELECT * FROM menu_items WHERE restaurant_id = ?;
-- Above query is used to fetch menu_items for particular restaurant

#16 in UserRepository.java
SELECT * FROM users WHERE username = ? AND password = ?;
-- Above query is used to authenticate user given a username and password

#17 in UserRepository.java
UPDATE users SET password = ? WHERE email = ?;
-- Above query is to reset a user's password given their email and new password

#18 in UserRepository.java
SELECT * FROM users WHERE user_id = ?;
-- Above query is used to fetch details about users using userId

#19 in UserRepository.java
UPDATE users SET  email = ?,phone_number=? WHERE username= ?;
-- Above query is used to update details of existing user

#20 in addMenuItem.jsp
INSERT INTO menu_items (restaurant_id, name, description, price) VALUES (?, ?, ?, ?)
-- Above query is used to insert into menu item

#21 in analytics.jsp
Select sum(quantity) as total_quantity, sum(total_price) as total_sum from orders where restaurant_id=?
-- Above query is used to rename things

#22 in analytics.jsp
Select count(*) as count from restaurant_analytics where restaurant_id=?
-- Above query is used to count the number of entries in the "restaurant_analytics" table for a given restaurant ID.

#23 in analytics.jsp
INSERT INTO restaurant_analytics (restaurant_id, order_count, revenue, average_order_price) VALUES (?, ?, ?, ?)
-- Above query is used to insert a new row into the "restaurant_analytics" table with the specified values for the given columns: restaurant_id, order_count, revenue, and average_order_price.

#24 in analytics.jsp
Select sum(quantity) as total_quantity ,sum(total_price) as total_revenue from orders join menu_items on orders.menu_item_id=menu_items.item_id where menu_items.item_id= ? group by menu_item_id
-- Above query is used to calculate the total quantity and total revenue of a specific menu item, identified by the "item_id" parameter. It does this by joining the "orders" and "menu_items" tables, grouping the results by "menu_item_id", and summing the "quantity" and "total_price" columns.

#25 in analytics.jsp
Select count(*) as count from menu_analytics where item_id=?
-- Above query is used to count the number of entries in the "menu_analytics" table for a given menu item ID.

#26 in analytics.jsp
INSERT INTO menu_analytics (item_id, item_name,item_price,total_orders,total_revenue) VALUES (?, ?, ?, ?,?)
-- Above query is used to insert a new row into the "menu_analytics" table with the specified values for the given columns: item_id, item_name, item_price, total_orders, and total_revenue.

#27 in analytics.jsp
Update menu_analytics set item_name=?,item_price=?,total_orders=?,total_revenue=? where item_id=?
-- Above query is used to update an existing row in the "menu_analytics" table with the specified values for the given columns: item_name, item_price, total_orders, and total_revenue, for a specific menu item identified by the "item_id" parameter.

#28 in analytics.jsp
Select * from orders join menu_items on orders.menu_item_id=menu_items.item_id join customers on orders.customer_id=customers.customer_id where orders.order_id=?
-- Above query is used to fetch the details of a specific order, identified by the "order_id" parameter, along with the menu item and customer details associated with it.

#29 in assign_delivery_personnel.jsp
SELECT * FROM delivery_personnel WHERE restaurant_id = ? AND status = 'available'
-- Above query is used to fetch the details of all available delivery personnel for a given restaurant, identified by the "restaurant_id" parameter.

#30 in deleteMenuItem.jsp
DELETE FROM menu_items WHERE item_id = ?
-- Above query is used to delete a specific menu item from the "menu_items" table, identified by the "item_id" parameter.

#31 in deliver_personnel_management.jsp
SELECT * FROM restaurants...
-- The query is incomplete and the purpose is unclear. Please provide more information to clarify the purpose of the query.
#32 in login.jsp
SELECT user_id FROM users WHERE username = ?
-- Above query is used to retrieve the user_id of a user with a given username, which can be used for authentication or other purposes in the application. The "?" is a placeholder for the actual value of the username, which will be provided by the application code.

#33 in place_order.jsp
Insert into restaurant_orders(order_id,restaurant_id,delivery_address,order_status) values(?,?,?,?)
-- Above query is used to insert a new row into the restaurant_orders table with the specified values for order_id, restaurant_id, delivery_address, and order_status. The "?" placeholders will be replaced with the actual values by the application code.

#34 in place_order.jsp
Select * from orders order by order_time desc limit 1
-- Above query is used to retrieve the most recent order from the orders table, ordered by order_time in descending order. The "limit 1" clause ensures that only the most recent order is returned.

#35 in place_order.jsp
SELECT * FROM orders JOIN customers ON orders.customer_id = customers.customer_id WHERE orders.order_id = ?
-- Above query is used to retrieve the order details and customer information for a given order_id. The join with the customers table allows additional customer information to be retrieved along with the order information. The "?" is a placeholder for the actual value of the order_id, which will be provided by the application code.

#36 in place_orderrr.jsp
SELECT price FROM menu_items WHERE item_id = ?
-- Above query is used to retrieve the price of a menu item with a given item_id. The "?" is a placeholder for the actual value of the item_id, which will be provided by the application code.

#37 in place_orderrr.jsp
INSERT INTO orders (customer_id, restaurant_id, menu_item_id, quantity, total_price, order_status, order_time) VALUES (?, ?, ?, ?, ?, ?, NOW())
-- Above query is used to insert a new order into the orders table with the specified values for customer_id, restaurant_id, menu_item_id, quantity, total_price, order_status, and order_time. The "?" placeholders will be replaced with the actual values by the application code. The NOW() function is used to automatically insert the current timestamp as the value for order_time.

#38 in process_update_delivery_personnel.jsp
UPDATE restaurant_orders SET delivery_personnel_id = ? , order_status= 'On the way' WHERE order_id = ?
-- Above query is used to update the delivery_personnel_id and order_status for a given order_id in the restaurant_orders table. The "?" placeholders will be replaced with the actual values by the application code.

#39 in process_update_delivery_personnel.jsp
Update orders set order_status='On the way' where order_id=?
-- Above query is used to update the order_status for a given order_id in the orders table. The "?" placeholder will be replaced with the actual value by the application code.

#40 in process_update_delivery_personnel.jsp
UPDATE restaurant_orders set delivery_personnel_id=? where order_id=?
-- Above query is used to update the delivery_personnel_id for a given order_id in the restaurant_orders table. The "?" placeholders will be replaced with the actual values by the application code.

#41 in process_update_delivery_personnel.jsp
SELECT order_id FROM restaurant_orders WHERE delivery_personnel_id = ?
-- Above query is used to retrieve the order_id(s) for a given delivery_personnel_id from the restaurant_orders table. This can be used to display the list of orders assigned to a particular delivery person. The "?" is a placeholder for the actual value of the delivery_personnel_id, which will be provided by the application code.

#42 in process_update_delivery_personnel.jsp
Update delivery_personnel set order_id=? where delivery_personnel_id=?
-- Above query is used to update the order_id of a delivery personnel.

#43 in process_update_delivery_personnel.jsp
UPDATE delivery_personnel SET status = 'unavailable' WHERE order_id = ?
-- Above query is used to update the status of a delivery personnel to "unavailable" for a specific order.

#44 in profile.jsp
Update users set phone_number=?,email=? where user_id=?
-- Above query is used to update the phone number and email address of a user.

#45 in register.jsp
SELECT * FROM restaurant_owner WHERE username=?
-- Above query is used to retrieve information about a restaurant owner based on their username.

#46 in register.jsp
UPDATE restaurant_orders set delivery_personnel_id=? where order_id=?
-- Above query is used to update the delivery personnel assigned to a specific order.

#47 in register.jsp
INSERT INTO restaurants (restaurant_id, name, address, phone_number, rating) VALUES (?, ?, ?, ?, ?)
-- Above query is used to insert information about a new restaurant into the database.

#48 in register.jsp
INSERT INTO restaurant_owners (restaurant_id) VALUES (?)
-- Above query is used to insert information about a new restaurant owner into the database.

#49 in resetAction.jsp
UPDATE users SET password = ? WHERE email = ?
-- Above query is used to update the password of a user based on their email address.

#50 in restaurant_owner_authenticate.jsp
SELECT * FROM restaurant_owner WHERE username=? AND password=?
-- Above query is used to authenticate a restaurant owner based on their username and password.

#51 in restaurant_owner_dashboard.jsp
SELECT * FROM restaurant_owner Join restaurants ON restaurant_owner.restaurant_id=restaurants.restaurant_id WHERE owner_id=?
-- Above query is used to retrieve information about a restaurant and its owner based on the owner's ID.

#52 in signup_process.jsp
INSERT INTO users (username, password, email, phone_number) VALUES (?, ?, ?, ?)
-- Above query is used to insert information about a new user into the database during the signup process.

#53 in signup.jsp
INSERT INTO users (username, password, email, phone_number) VALUES (?, ?, ?, ?)
-- Above query is used to insert information about a new user into the database during the signup process.

#54 in signup.jsp
Select * from users where username=?
-- Above query is used to retrieve information about a user based on their username.

#55 in signup.jsp
Insert into customers(name,address,payment_method,user_id)values(?,?,?,?)
-- Above query is used to to insert cutomers details.

#56 in updatee_delivery_person.jsp
SELECT * FROM delivery_personnel WHERE status = 'available'
-- Above query is used to select delivery persons who are available for delivery.

#57 in updatee_order_status.jsp
UPDATE restaurant_orders SET order_status = ? WHERE order_id = ?
-- Above query is used to  update order_status of restaurant_order.

#58 in updatee_order_status.jsp
Update delivery_personnel set status='available',order_id=null where order_id=?
UPDATE orders SET order_status = ? WHERE order_id = ?
-- Above query is used to update delivery_personnel

#59 in updatee_order_status.jsp
UPDATE orders SET order_status = ? WHERE order_id = ?
-- Above query is used to update status of order

#60 in view_orders.jsp
SELECT * FROM orders o JOIN customers c ON o.customer_id = c.customer_id JOIN restaurants r ON o.restaurant_id = r.restaurant_id JOIN menu_items m ON o.menu_item_id = m.item_id where c.customer_id=?
-- Above query is used to to view orders from user interface
