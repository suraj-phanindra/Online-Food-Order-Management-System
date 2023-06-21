use food_delivery_system;
delete from users;
delete from customers;
delete from restaurants;
delete from restaurant_owner;
delete from menu_items;
delete from orders;
delete from delivery_personnel;
delete from restaurant_orders;
delete from restaurant_analytics;
delete from menu_analytics;
delete from order_analytics;
#1 Inserting 10 entities into the "users" table:
INSERT INTO users (user_id,username, password, email, phone_number)
VALUES
(1,'user1', 'password1', 'user1@example.com', '123-456-7890'),
(2,'user2', 'password2', 'user2@example.com', '234-567-8901'),
(3,'user3', 'password3', 'user3@example.com', '345-678-9012'),
(4,'user4', 'password4', 'user4@example.com', '456-789-0123'),
(5,'user5', 'password5', 'user5@example.com', '567-890-1234'),
(6,'user6', 'password6', 'user6@example.com', '678-901-2345'),
(7,'user7', 'password7', 'user7@example.com', '789-012-3456'),
(8,'user8', 'password8', 'user8@example.com', '890-123-4567'),
(9,'user9', 'password9', 'user9@example.com', '901-234-5678'),
(10,'user10', 'password10', 'user10@example.com', '012-345-6789');

#2 Inserting 10 entities into the "customers" table:
INSERT INTO customers (customer_id,user_id, name, address, payment_method)
VALUES
(1,1, 'John Smith', '123 Main St, Anytown USA', 'credit card'),
(2,2, 'Jane Doe', '456 Elm St, Othertown USA', 'debit card'),
(3,3, 'Bob Johnson', '789 Oak St, Anycity USA', 'paypal'),
(4,4, 'Sue Davis', '321 Maple St, Othercity USA', 'cash'),
(5,5, 'Mike Brown', '654 Pine St, Anyvillage USA', 'check'),
(6,6, 'Sarah Wilson', '987 Cedar St, Othercountry USA', 'bitcoin'),
(7,7, 'Tom Thompson', '246 Birch St, Anystate USA', 'apple pay'),
(8,8, 'Lisa Lee', '135 Spruce St, Otherstate USA', 'google pay'),
(9,9, 'Peter Parker', '864 Cherry St, Anyprovince USA', 'venmo'),
(10,10, 'Mary Jones', '975 Walnut St, Otherprovince USA', 'zelle');

#3 Inserting 10 entities into the "restaurants" table:

INSERT INTO restaurants (restaurant_id,name, address, phone_number, rating)
VALUES
(1,'Restaurant A', '123 Main St, Anytown USA', '123-456-7890', 4.5),
(2,'Restaurant B', '456 Elm St, Othertown USA', '234-567-8901', 3.9),
(3,'Restaurant C', '789 Oak St, Anycity USA', '345-678-9012', 4.2),
(4,'Restaurant D', '321 Maple St, Othercity USA', '456-789-0123', 4.1),
(5,'Restaurant E', '654 Pine St, Anyvillage USA', '567-890-1234', 3.8),
(6,'Restaurant F', '987 Cedar St, Othercountry USA', '678-901-2345', 4.3),
(7,'Restaurant G', '246 Birch St, Anystate USA', '789-012-3456', 4.0),
(8,'Restaurant H', '135 Spruce St, Otherstate USA', '890-123-4567', 4.4),
(9,'Restaurant I', '864 Cherry St, Anyprovince USA', '901-234-5678', 4.6),
(10,'Restaurant J', '975 Walnut St, Otherprovince USA', '012-345-6789', 4.7);

#4 Inserting 10 entities into the "restaurant_owner" table:

INSERT INTO restaurant_owner (username, password, email, phone_number, restaurant_id)
VALUES
('owner1', 'password1', 'owner1@example.com', '123-456-7890', 1),
('owner2', 'password2', 'owner2@example.com', '234-567-8901', 2),
('owner3', 'password3', 'owner3@example.com', '345-678-9012', 3),
('owner4', 'password4', 'owner4@example.com', '456-789-0123', 4),
('owner5', 'password5', 'owner5@example.com', '567-890-1234', 5),
('owner6', 'password6', 'owner6@example.com', '678-901-2345', 6),
('owner7', 'password7', 'owner7@example.com', '789-012-3456', 7),
('owner8', 'password8', 'owner8@example.com', '890-123-4567', 8),
('owner9', 'password9', 'owner9@example.com', '901-234-5678', 9),
('owner10', 'password10', 'owner10@example.com', '012-345-6789', 10);



#5 Inserting 10 entities into the "menu_items" table:
INSERT INTO menu_items (item_id,restaurant_id, name, description, price)
VALUES
(1,1, 'Menu Item A1', 'Description of Menu Item A1', 1),
(2,2, 'Menu Item A2', 'Description of Menu Item A2', 2),
(3,3, 'Menu Item A3', 'Description of Menu Item A3', 3),
(4,4, 'Menu Item A4', 'Description of Menu Item A4', 4),
(5,5, 'Menu Item A5', 'Description of Menu Item A5', 5),
(6,6, 'Menu Item A6', 'Description of Menu Item A6', 6),
(7,7, 'Menu Item A7', 'Description of Menu Item A7', 7),
(8,8, 'Menu Item A8', 'Description of Menu Item A8', 8),
(9,9, 'Menu Item A9', 'Description of Menu Item A9', 9),
(10,10, 'Menu Item A10', 'Description of Menu Item A10', 10);



#6 Inserting 10 entities into the "orders" table:
INSERT INTO orders (order_id,customer_id, order_time, order_status, total_price, quantity, menu_item_id, restaurant_id)
VALUES
(1,1, '2023-04-09 12:30:00', 'new', 1, 1, 1, 1),
(2,2, '2023-04-08 18:00:00', 'new', 2, 1, 2, 2),
(3,3, '2023-04-07 16:45:00', 'new', 3, 1, 3, 3),
(4,4, '2023-04-06 11:15:00', 'new', 4, 1, 4, 4),
(5,5, '2023-04-05 19:30:00', 'new', 5, 1, 5, 5),
(6,6, '2023-04-04 20:45:00', 'new', 6, 1, 6, 6),
(7,7, '2023-04-03 14:00:00', 'new', 7, 1, 7, 7),
(8,8, '2023-04-02 13:30:00', 'new', 8, 1, 8, 8),
(9,9, '2023-04-01 17:45:00', 'new', 9, 1, 9, 9),
(10,10, '2023-03-31 12:00:00', 'new', 10, 1, 10, 10);


#7 Inserting 10 entities into the "delivery_personnel" table:
insert into delivery_personnel(delivery_personnel_id,restaurant_id,order_id,name,phone_number,status)
values
(1,1,null,'d_name1','456-789-0123','available'),
(2,1,null,'d_name2','123-789-0123','available'),
(3,1,null,'d_name3','193-789-0123','available'),
(4,2,null,'d_name4','996-789-0123','available'),
(5,2,null,'d_name5','878-789-0123','available'),
(6,3,null,'d_name6','194-789-0123','available'),
(7,4,null,'d_name7','193-112-0123','available'),
(8,5,null,'d_name8','222-789-0123','available'),
(9,6,null,'d_name9','193-789-0223','available'),
(10,7,null,'d_name10','193-789-0333','available'),
(11,8,null,'d_name11','125-789-0123','available'),
(12,9,null,'d_name12','193-229-0123','available'),
(13,10,null,'d_name13','222-789-0123','available');

#8 Inserting 10 entities into the "restaurant_orders" table:
insert into restaurant_orders(order_id,restaurant_id,delivery_address,delivery_personnel_id,order_status)
values
(1,1,'123 Main St, Anytown USA',null,'new'),
(2,2,'456 Elm St, Othertown USA',null,'new'),
(3,3,'789 Oak St, Anycity USA',null,'new'),
(4,4,'321 Maple St, Othercity USA',null,'new'),
(5,5,'654 Pine St, Anyvillage USA',null,'new'),
(6,6,'987 Cedar St, Othercountry USA',null,'new'),
(7,7,'246 Birch St, Anystate USA',null,'new'),
(8,8,'135 Spruce St, Otherstate USA',null,'new'),
(9,9,'864 Cherry St, Anyprovince USA',null,'new'),
(10,10,'975 Walnut St, Otherprovince USA',null,'new');

#9 Inserting 10 entities into the "restaurant_analytics" table:
insert into restaurant_analytics(analytics_id,restaurant_id,order_count,revenue,average_order_price)
values
(1,1,1,1,1),
(2,2,1,2,2),
(3,3,1,3,3),
(4,4,1,4,4),
(5,5,1,5,5),
(6,6,1,6,6),
(7,7,1,7,7),
(8,8,1,8,8),
(9,9,1,9,9),
(10,10,1,10,10);

#10 Inserting 10 entities into the "order_anlytics" table:
insert into order_analytics(analytics_id, order_id,date ,customer_name,items, quantity, total_revenue)
values
(1,1,'2023-04-09 12:30:00','John Smith','Menu Item A1',1,1),
(2,2,'2023-04-08 18:00:00','Jane Doe','Menu Item A2',1,2),
(3,3,'2023-04-07 16:45:00','Bob Johnson','Menu Item A3',1,3),
(4,4,'2023-04-06 11:15:00','Sue Davis','Menu Item A4',1,4),
(5,5,'2023-04-05 19:30:00','Mike Brown','Menu Item A5',1,5),
(6,6,'2023-04-04 20:45:00','Sarah Wilson','Menu Item A6',1,6),
(7,7,'2023-04-03 14:00:00','Tom Thompson','Menu Item A7',1,7),
(8,8,'2023-04-02 13:30:00','Lisa Lee','Menu Item A8',1,8),
(9,9,'2023-04-01 17:45:00','Peter Parker','Menu Item A9',1,9),
(10,10,'2023-03-31 12:00:00','Mary Jones','Menu Item A10',1,10);


#11 Inserting 10 entities into the "menu_anlytics" table:

insert into menu_analytics(analytics_id,item_id,item_price,item_name,total_orders,total_revenue)
value
(1,1,1,'Menu Item A1',1,1),
(2,2,2,'Menu Item A2',1,2),
(3,3,3,'Menu Item A3',1,3),
(4,4,4,'Menu Item A4',1,4),
(5,5,5,'Menu Item A5',1,5),
(6,6,6,'Menu Item A6',1,6),
(7,7,7,'Menu Item A7',1,7),
(8,8,8,'Menu Item A8',1,8),
(9,9,9,'Menu Item A9',1,9),
(10,10,10,'Menu Item A10',1,10);

