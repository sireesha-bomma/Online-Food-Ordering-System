---Drop queries---

drop table Message cascade constraints; 
drop table Payment cascade constraints;
drop table Dish_order cascade constraints;
drop table Order_t cascade constraints; 
drop table Dish_cart cascade constraints; 
drop table Cart cascade constraints; 
drop table Review cascade constraints; 
drop table Dish cascade constraints; 
drop table Restaurant_category cascade constraints;
drop table Restaurant cascade constraints;
drop table Category cascade constraints; 
drop table Customer_discount cascade constraints;
drop table Sales_tax cascade constraints; 
drop table Discount cascade constraints; 
drop table Customer cascade constraints; 
drop sequence Order_ID;
drop sequence Payment_ID;
drop sequence Message_ID;
drop sequence Cart_ID;
drop sequence Review_ID;
drop sequence Customer_ID;

--- Create queries---

create table Customer(
Customer_ID int NOT NULL,
Customer_name varchar(50),
Address varchar(50),
Zip_code char(10),
State char(10),
Email varchar(50),
credit number,
primary key(Customer_ID));

CREATE SEQUENCE Customer_ID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;

create table Discount(
Discount_ID int,
Description varchar(100),
Type number,
Amount number,
isPercentage char,
isAmount char,
primary key(Discount_ID));

create table Sales_tax(
Sales_tax_ID int,
State char(10),
Tax number(10),
primary key(Sales_tax_ID));

create table Customer_discount(
Customers_discounts_ID int,
Customer_ID int,
Discount_ID int,
Start_date date,
End_date date,
primary key(Customers_discounts_ID),
foreign key(Customer_ID) references Customer,
foreign key(Discount_ID) references Discount);

create table Category(
Category_ID int,
Category_name varchar(50),
primary key(Category_ID));

create table Restaurant(
Restaurant_ID int,
Restaurant_name varchar(50),
Address varchar(50),
Nume NUMBER(10),
Status varchar(50),
Zip_code char(10),
State char(10),
Wait_time char(15),
Review_score number,
primary key(Restaurant_ID));

create table Restaurant_category(
Restaurant_ID int,
Category_ID int,
foreign key(Restaurant_ID) references Restaurant,
foreign key(Category_ID) references Category);

create table Dish(
Dish_ID int,
Restaurant_ID int,
Dish_name varchar(50),
Price number,
Currency char(2),
primary key(Dish_ID),
foreign key(Restaurant_ID) references Restaurant);

create table Review(
Review_ID int,
Customer_ID,
Restaurant_ID,
Review_date date,
Review_score number,
Comments varchar(400),
primary key(Review_ID),
foreign key(Customer_ID) references Customer,
foreign key(Restaurant_ID) references Restaurant);

CREATE SEQUENCE Review_ID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;

create table cart(
cart_ID int,
Customer_ID,
Restaurant_ID,
primary key(cart_ID),
foreign key(Customer_ID) references Customer,
foreign key(Restaurant_ID) references Restaurant);

CREATE SEQUENCE Cart_ID
MINVALUE 60
START WITH 60
INCREMENT BY 1
CACHE 20;

create table Dish_cart(
Dish_ID int,
Cart_ID int,
Quantity varchar(50),
foreign key(Dish_ID) references Dish,
foreign key(Cart_ID) references Cart);

create table Order_t(
order_Id INT,
Flag INT,
Customer_ID,
Restaurant_ID,
Order_time timestamp,
Delivery_time timestamp,
Estimated_time timestamp,
Status varchar(50),
Payment_status varchar(50),
Total_cost number,
primary key(order_ID),
foreign key(Customer_ID) references Customer,
foreign key(Restaurant_ID) references Restaurant);

CREATE SEQUENCE Order_ID
MINVALUE 1
START WITH 70
INCREMENT BY 1
CACHE 20;

create table Dish_order(
Order_ID int,
Dish_ID int,
foreign key(Order_ID) references Order_t,
foreign key(Dish_ID) references Dish);

create table Payment(
Payment_ID int,
Customer_ID int,
Order_ID int,
Payment_time timestamp,
Payment_amount varchar(50),
Payment_method varchar(50), 
primary key(Payment_ID),
foreign key(Customer_ID) references Customer,
foreign key(Order_ID) references Order_t);

CREATE SEQUENCE Payment_ID
MINVALUE 1
START WITH 11
INCREMENT BY 1
CACHE 20;

create table Message(
Message_ID int,
Customer_ID int,
Message_time timestamp,
Message_body varchar(500),
primary key(Message_ID),
foreign key(Customer_ID) references Customer);

CREATE SEQUENCE Message_ID
MINVALUE 1
START WITH 90
INCREMENT BY 1
CACHE 20;

---Insert Queries---

Insert into Customer values (Customer_ID.nextval, 'Tony', 'Phoenix', 85041, 'AZ', 'str@gmail.com', 55); 
Insert into Customer values (Customer_ID.nextval, 'Thor', 'Albuquerque', 87104, 'NM', 'thun@gmail.com', 44); 
Insert into Customer values (Customer_ID.nextval, 'Natalia', 'Las Vegas', 89101, 'NV', 'nat@gmail.com', 33); 
Insert into Customer values (Customer_ID.nextval, 'Steve', 'Salt Lake City', 84150, 'UT' , 'ste@gmail.com', 22); 
Insert into Customer values (Customer_ID.nextval, 'Bruce', 'Denver', 80203, 'CO', 'Bhm@gmail.com', 11);

Insert into Discount values (1, 'Free Delivery', 1, null, 'N', 'Y');
Insert into Discount values (2, '10% off on order amount', 2, 0.1, 'Y', 'N' );
Insert into Discount values (3, '20$ off on order', 3, 20, 'N', 'Y');

Insert into Sales_tax values (45, 'AZ', 5); 
Insert into Sales_tax values (46, 'NM', 4.5); 
Insert into Sales_tax values (47, 'NV', 4.1); 
Insert into Sales_tax values (48, 'UT', 3.1); 
Insert into Sales_tax values (49, 'CO', 5);

Insert into Customer_discount values (90, 1, 2, date'2022-08-1', date'2023-09-30');
Insert into Customer_discount values (91, 1, 2, date'2022-09-1', date'2023-10-30');
Insert into Customer_discount values (92, 2, 3, date'2022-10-1', date'2023-11-30');
Insert into Customer_discount values (93, 3, 1, date'2022-11-2', date'2023-12-31');
Insert into Customer_discount values (94, 4, 2, date'2022-12-3', date'2023-01-2');

Insert into Category values (80, 'Indian'); 
Insert into Category values (81, 'Chinese'); 
Insert into Category values (82, 'Italian');
Insert into Category values (83, 'Seafood'); 
Insert into Category values (84, 'Mexican');

Insert into Restaurant values (40, 'Burritos Julie`s', '300 Granite', 5052614668, 'open', 87102, 'NM', '45 mins', 4.9); 
Insert into Restaurant values (41, 'Tavernetta', '1889 16th st mall', 7206051889, 'close', 80202, 'CO', '30 mins', 4.7); 
Insert into Restaurant values (42, 'Marigold Maison', 'cactus Rd Ste D118', 6026540689, 'open', 85032, 'AZ', '35 mins', 4.3); 
Insert into Restaurant values (43, 'Red Dragon', 'Jordan Pkwy', 8013029988, 'open', 84095, 'UT', '40 mins', 4.4); 
Insert into Restaurant values (44, 'Fish cage', 'N M.L.K. Blvd', 7025861400, 'open', 89032, 'NV', '30 mins', 4.3);

Insert into Restaurant_category values(40, 80);
Insert into Restaurant_category values(41, 81);
Insert into Restaurant_category values(42, 82);
Insert into Restaurant_category values(43, 83);
Insert into Restaurant_category values(44, 84);

Insert into Dish values(50, 40, 'Burritos', 9.99, '$');
Insert into Dish values(51, 41, 'Branzino', 12, '$');
Insert into Dish values(52, 42, 'Paneer Tikka', 25, '$'); 
Insert into Dish values(53, 43, 'Kung pao chicken', 20, '$'); 
Insert into Dish values(54, 44, 'fried Shrimp', 22.75, '$');
Insert into Dish values(55, 42, 'Gulab Jamun', 8, '$');

Insert into Review values(Review_ID.nextval, 2, 40, date '2022-11-11', 4.2, 'Appetising');
Insert into Review values (Review_ID.nextval, 1, 41, date '2022-10-10', 4.3, 'Delightful');
Insert into Review values (Review_ID.nextval, 3, 42, date '2022-09-09', 3.4, 'Delicious');
Insert into Review values (Review_ID.nextval, 4, 43, date '2021-08-08', 4.5, 'Flavoursome');
Insert into Review values (Review_ID.nextval, 5, 44, date '2020-07-07', 4.6, 'Delicioso');

Insert into Cart values (Cart_ID.nextval, 3, 40); 
Insert into Cart values (Cart_ID.nextval, 2, 41); 
Insert into Cart values (Cart_ID.nextval, 1, 42); 
Insert into Cart values (Cart_ID.nextval, 5, 43); 
Insert into Cart values (Cart_ID.nextval, 4, 44);

Insert into Dish_cart values(50, 60, 1); 
Insert into Dish_cart values(51, 61, 2); 
Insert into Dish_cart values(52, 62, 2); 
Insert into Dish_cart values(53, 63, 3); 
Insert into Dish_cart values(54, 64, 4);
Insert into Dish_cart values(53, 64, 1);
Insert into Dish_cart values(52, 64, 1);

Insert into order_t values (Order_ID.nextval, 1, 2, 40, timestamp '2022-01-01 09:00:00.00', timestamp '2022-01-01 10:00:00.00', timestamp '2022-10-11 21:30:00.00', 'delivered', 'paid', 60.9); 
Insert into order_t values (Order_ID.nextval, 2, 5, 43, timestamp '2022-08-08 08:30:00.00', null, timestamp '2022-08-08 09:00:00.00', 'cancelled', 'not paid', 40.9); 
Insert into order_t values (Order_ID.nextval, 1, 4, 42, timestamp '2022-09-09 07:00:00.00', timestamp '2022-09-09 07:35:00.00', timestamp '2022-10-11 19:30:00.00', 'delivered', 'paid', 80.0); 
Insert into order_t values (Order_ID.nextval, 2, 5, 40, timestamp '2022-07-07 06:00:00.00', null, timestamp '2022-07-07 06:20:00.00', 'in progress', 'paid', 60.9); 
Insert into order_t values (Order_ID.nextval, 1, 1, 44, timestamp '2022-11-11 06:00:00.00', null, timestamp '2022-11-11 06:30:00.00', 'delivered', 'not paid', 100); 

Insert into Dish_order values(70, 51); 
Insert into Dish_order values(72, 52); 
Insert into Dish_order values(73, 53); 
Insert into Dish_order values(74, 54); 
Insert into Dish_order values(73, 55);

Insert into Payment values(Payment_ID.nextval, 2, 70, timestamp '2022-10-10 21:24:00.00', 44, 'cash');
Insert into Payment values(Payment_ID.nextval, 3, 71, timestamp '2022-10-10 20:45:00.00', 55, 'cash');
Insert into Payment values(Payment_ID.nextval, 4, 72, timestamp '2022-10-10 18:30:00.00', 66, 'card');
Insert into Payment values(Payment_ID.nextval, 5, 73, timestamp '2022-10-10 18:50:00.00', 77, 'cash');
Insert into Payment values(Payment_ID.nextval, 1, 74, timestamp '2022-10-10 20:40:00.00', 99, 'card');


Insert into Message values (Message_ID.nextval, 1, timestamp '2022-10-10 21:24:00.00', 'Cook Brown'); 
Insert into Message values (Message_ID.nextval, 2, timestamp '2022-10-10 20:45:00.00', 'Extra cheese');
Insert into Message values (Message_ID.nextval, 3, timestamp '2022-10-10 18:30:00.00', 'Extra Spicy');
Insert into Message values (Message_ID.nextval, 4, timestamp '2022-10-10 18:50:00.00', 'Need disposables'); 
Insert into Message values (Message_ID.nextval, 5, timestamp '2022-10-10 20:40:00.00', 'Don`t Knock door');


--- View all tables ---

select * from Customer;
select * from Discount;
select * from Sales_tax;
select * from Customer_discount;
select * from Category;
select * from Restaurant;
select * from Restaurant_category;
select * from Dish;
select * from Review;
select * from Cart;
select * from Dish_cart;
select * from Order_t;
select * from Dish_order;
select * from Payment;
select * from Message;



SET SERVEROUTPUT ON;


--- Feature 1 ---

CREATE OR REPLACE PROCEDURE create_new_customer(v_name varchar, v_addr varchar,  v_zip varchar, v_state varchar, v_email varchar)
IS
 CountCust number;
 new_cust_id number;
BEGIN

    select count(*) into CountCust from Customer where Email = v_email;
    if (CountCust >= 1) then
    dbms_output.put_line('The client already exists');
    update Customer set Address = v_addr, Zip_code = v_zip, state= v_state where email = v_email;
    else
    Insert into Customer values (Customer_ID.nextval, v_name, v_addr, v_zip, v_state, v_email, 0);
    select Customer_ID.currval into new_cust_id from dual;
    dbms_output.put_line('New customer added with the customer ID: ' || new_cust_id);
    
    end if;
END;
/

-- valid
    --valid customer email - update fields
        exec create_new_customer('Natalia', 'Baltimore', '21210', 'MD', 'nat@gmail.com'); 
-- invalid
    -- new email - creates a new customer
        exec create_new_customer('Ishan', 'Baltimore', '21210', 'MD', 'ishan@gmail.com');
        select * from Customer;



--- Feature 2 ---

create or replace procedure show_customer_detail (cust_email varchar)
is 
cursor c1 is select customer_ID, customer_name, address, state, zip_code, email, credit from customer where email = cust_email;
r1 c1%rowtype;
cust_count int;
total_orders int;
total_cost_temp int;

begin
 select count(*) into cust_count from customer where email = cust_email;
 if cust_count = 0 then 
   dbms_output.put_line('No such customer');
 else
 open c1;
 fetch c1 into r1;
 select count(*) temp_no_of_orders, nvl(sum(total_cost), 0) into total_orders, total_cost_temp from order_t 
 where trunc(delivery_time) < sysdate and trunc(delivery_time) > trunc(delivery_time) - interval '6' month and customer_id=r1.customer_id and status='delivered' ;
    dbms_output.put_line( 'customer profile is:' ||  chr(10) || 'customer name: ' || r1.customer_name ||  chr(10) || 'Address : ' ||  r1.address || chr(10) || 'State : ' ||  r1.state || chr(10) ||
    'Zipcode : ' ||  r1.zip_code || chr(10) || 'Email : ' ||  r1.email || chr(10) || 'Credit : ' || r1.credit || chr(10) || 'Total orders : ' || total_orders || chr(10) || 'total cost : ' || total_cost_temp  );
    close c1;
 end if;
end;
/

-- valid
    --valid customer email 
        exec show_customer_detail('nat@gmail.com'); 
-- invalid
   --invalid customer email 
        exec show_customer_detail('vaish@gmail.com');
        
        select * from order_t;
        select * from customer;



--- Feature 3 ---

CREATE OR REPLACE PROCEDURE search_restaurant_by_category(v_category varchar) 
AS 
-- explicit cursor to search restaurants based on given input category name
    cursor c1 is select Restaurant_name, Review_score, Wait_time, Zip_code
        from Restaurant  where Restaurant_ID  in (
            select Restaurant_ID from Restaurant_category rc join Category c on c.Category_ID = rc.Category_ID
					where c.Category_name like '%' || v_category || '%') and Status in ('open','Open');  -- matching  input category_name and checking if it's open or not
    i  c1%rowtype;

BEGIN
    open c1;
        loop
            fetch c1 into i;
                if c1%NOTFOUND then 
                    exit; -- exit when no match found
                else 
                    -- format output to display results on screen
                    DBMS_OUTPUT.PUT_LINE('Restaurant Name' ||chr(9)||chr(9)||chr(9)||chr(9)||chr(9)|| 'Review Score' ||chr(9)||chr(9)||chr(9)|| 'Wait Time' || chr(9)||chr(9)||chr(9)|| 'Zip Code');
                    DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------------------------------------------');
                    DBMS_OUTPUT.PUT_LINE(RPAD(i.Restaurant_name, 35,' ') || RPAD(i.Review_score, 21,' ') || RPAD(i.Wait_time, 21,' ') || i.Zip_code);  
                end if;
        end loop;
    close c1;
END ;
/

-- valid
    --valid category_name
        exec search_restaurant_by_category('Indian'); 
        exec search_restaurant_by_category('Mex'); 
-- invalid
    -- invalid category_name
        exec search_restaurant_by_category('Thai');
        
        select * from restaurant;
        select * from Restaurant_category;
        select * from category;
        
        
        
--- Feature 4 ---

create or replace procedure show_dishes_by_restaurant (v_restaurant_id int)
is 
    v_count int;
    
    cursor c1 is 
        select Dish_name, Price from Dish d, Restaurant r
            where d.Restaurant_ID = v_restaurant_id and r.Restaurant_ID = d.Restaurant_ID;
    
begin
    select count(*) into v_count from Restaurant where Restaurant_ID = v_restaurant_id;
    if v_count = 0 then 
        dbms_output.put_line('No such restaurant');
    else
      --format output column headings and then run loop on cursor to print the rows
        DBMS_OUTPUT.PUT_LINE('Dish Name' ||chr(9)||chr(9)||chr(9)|| chr(9)|| 'Price');
        DBMS_OUTPUT.PUT_LINE('-------------------------------------------------');
        for i in c1 loop 
            dbms_output.put_line(RPAD(i.Dish_name, 25, ' ') || i.Price);
        end loop; 
    end if;
end;
/

--valid
    -- valid restaurant ID
    exec show_dishes_by_restaurant (42);
    exec show_dishes_by_restaurant (41);
--invalid
    -- invalid restaurant ID
    exec show_dishes_by_restaurant (52);
    
    select * from restaurant;
    select * from dish;



--- Feature 5 ---

create or replace procedure show_dishes_in_shopping_cart(v_cart_id int)
as
 v_count int;

--explicit cursor to get dish_name, price and quantity if cart_id is valid
 cursor c1 is 
    select Dish_name, Price, Quantity, Currency from Dish_cart dc, Dish d 
    where Cart_ID = v_cart_id and dc.Dish_ID = d.Dish_ID; 

begin
    select count(*) into v_count from Dish_cart dc, Dish d 
        where dc.Cart_ID = v_cart_id and dc.Dish_ID = d.Dish_ID; 
    if v_count = 0 then --check if cart_id is valid
        dbms_output.put_line('Invalid cart ID');
    else 
        --format output column headings and then run loop on cursor to print the rows
        DBMS_OUTPUT.PUT_LINE('Dish Name' ||chr(9)||chr(9)||chr(9)||chr(9)||chr(9)||chr(9)|| 'Price' ||chr(9)||chr(9)||chr(9)||chr(9)|| 'Quantity' );
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------');
        for i in c1 loop 
              DBMS_OUTPUT.PUT_LINE( RPAD(i.Dish_name, 32,' ') || RPAD(i.Price, 25,' ') || i.Quantity );
        end loop;
    end if;
end;
/

-- valid
    exec show_dishes_in_shopping_cart(64);
-- invalid
    exec show_dishes_in_shopping_cart(65);
    
    select * from cart;
    select * from dish_cart;
    select * from dish;



--- Feature 6 ---

create or replace procedure remove_dish_from_shopping_cart(v_cart_id int, v_dish_id int)
as
 v_count int;
 v_qty int;

begin
    -- check if the cart and dish are available
    select count(*) into v_count from Dish_cart dc  
        where dc.Cart_ID = v_cart_id and dc.Dish_ID = v_dish_id; 
    if v_count = 0 then --error if cart/dish not found
        dbms_output.put_line('Invalid input');
    else  
        select quantity into v_qty from Dish_cart where Cart_ID = v_cart_id and Dish_ID = v_dish_id;
        if v_qty > 1 then -- if quantity > 1 we have to reduce count
                update Dish_cart set quantity = v_qty - 1 where Cart_ID = v_cart_id and Dish_ID = v_dish_id;
                DBMS_OUTPUT.PUT_LINE( 'quantity reduced' );
            else if v_qty = 1 then -- if quantity = 1 we need to delete the row
                delete from Dish_cart where Cart_ID = v_cart_id and Dish_ID = v_dish_id;
                 DBMS_OUTPUT.PUT_LINE( 'dish removed' );
            end if;
        end if;
    end if;
end;
/

select * from Dish_cart; -- table before delete

-- valid
    --quantity > 1
        exec remove_dish_from_shopping_cart(63,53); 
    --quantity = 1
        exec remove_dish_from_shopping_cart(64,53); 
-- ivalid
    -- dish available but not in cart
        exec remove_dish_from_shopping_cart(64,55);
     -- invalid cart ID and invalid dish ID
        exec remove_dish_from_shopping_cart(65,55);
     -- cart available but dish not in cart
        exec remove_dish_from_shopping_cart(61,54);
        
        select * from cart;
        select * from dish;
        select * from Dish_cart; -- to verify updated table



--- Feature 7 ---

CREATE OR REPLACE PROCEDURE update_status_of_order(orderid int,new_status1 int,time1 timestamp)
AS 
-- explicit cursor to validate given order id
order_id1 integer;
cursor o1 is select order_id from order_t where order_id=orderid;
i o1%rowtype;
msg varchar(255);
msg1 varchar(255);
begin

    open o1;
        loop
            fetch o1 into i;
            exit when  o1%NOTFOUND; -- when no valid order_id is given
            -- DBMS_OUTPUT.PUT_LINE(i.order_id||'Valid');
            -- DBMS_OUTPUT.PUT_LINE(new_status1);
                if new_status1 =1 then -- when input is given 1 as in-iprogress then order_t is updated
                    update order_t set status='in progress' where order_id=orderid;
                    exit;
                elsif new_status1 =2 then -- when input is given 2 order_t and message table is updated
                    update order_t set status='delivered' where order_id=orderid;
                    msg:='Your order ' ||i.order_id||' has been delivered!';
                    update message set message.message_time= time1, message.message_body=msg where customer_id in (
                    select customer_id from order_t where order_id=orderid); 
                    DBMS_OUTPUT.PUT_LINE('order_t message tables updated');
                    exit;
                elsif new_status1 =3 then -- when input is 3 order_t message and payment tables are updated
                    update order_t set status= 'cancelled' where order_id=orderid;
                    msg1:='Your order '|| i.order_id ||'has been canceled and refund issued!';
                    update message set message.message_time= time1, message.message_body= msg1 where customer_id in (
                    select customer_id from order_t where order_id=orderid);
                    update payment set payment.payment_amount= payment_amount-(select payment_amount from payment where order_id=orderid) 
                    where order_id=orderid;
                    
                    DBMS_OUTPUT.PUT_LINE('order_t message payment tables updated');
                    exit;
                end if;
        end loop;
    if o1%NOTFOUND THEN Dbms_output.put_line('invalid order id');
    end if;
    close o1;
 
end;
/

select * from message;
select * from payment;
select * from order_t;

-- invalid
exec update_status_of_order(79,2,sysdate);
--valid
exec update_status_of_order(72,3,sysdate);

-- to check if the tables are updates we are printing the 3 tables.
select * from message;
select * from payment;
select * from order_t;



--- Feature 8 ---

-- procedure to insert review into Review table
create or replace procedure enter_review(v_customer_id int, v_restaurant_id int, v_review_date date, v_review_score number, v_comment varchar)
as
 v_cust_check int;
 v_rest_check int;

begin
    -- check if the customer ID and restaurant ID are valid
    select count(*) into v_cust_check from Customer   
        where Customer_ID = v_customer_id;
    select count(*) into v_rest_check from Restaurant   
        where Restaurant_ID = v_restaurant_id;
        
    if v_cust_check = 0 then --error if customer ID not found
        dbms_output.put_line('Invalid Customer ID');
    else if v_rest_check = 0 then --error if restaurant ID not found
        dbms_output.put_line('Invalid Restaurant ID');
    else 
        -- insert the record into review table
        Insert into Review values (Review_ID.nextval,v_customer_id,v_restaurant_id, v_review_date, v_review_score, v_comment);
        dbms_output.put_line('Review added');
    end if;
    end if;
    
    -- update the average review score of the restaurant to reflect the new review.
    Update Restaurant SET Review_score = (Select ROUND(AVG(Review_score), 1) from Review where Restaurant_ID = v_restaurant_id) 
                    where Restaurant_ID = v_restaurant_id;
end;
/

select * from Review; -- table before update

-- valid
    --valid restaurant_ID and customer_ID
        exec enter_review(2, 44, date '2020-07-07', 4.4, 'tastey'); 
        exec enter_review(4, 44, date '2020-07-09', 2, 'tastey'); 
-- ivalid
    -- invalid restaurant_ID
        exec enter_review(2, 45, date '2020-07-07', 4.4, 'tastey');
    -- invalid customer_ID
        exec enter_review(6, 44, date '2020-07-07', 4.4, 'tastey');

select * from Review; -- to verify updated table
select * from Restaurant; -- verify updated average review_score



--- Feature 9 ---

create or replace procedure display_restaurant_reviews(v_restaurant_id int)
as
 v_rest_check int;
 
 --explicit cursor to get review_date, score and comment if restaurant_ID is valid
 cursor c1 is 
    select Review_date, Review_score, Comments from Review  
    where Restaurant_ID = v_restaurant_id; 

begin
    -- check if restaurant ID is valid
    select count(*) into v_rest_check from Restaurant   
        where Restaurant_ID = v_restaurant_id;
        
     if v_rest_check = 0 then --error if restaurant ID not found
        dbms_output.put_line('Invalid Restaurant ID');
    else 
        --format output column headings and then run loop on cursor to print the rows
        DBMS_OUTPUT.PUT_LINE('Review Date' ||chr(9)||chr(9)||chr(9)||chr(9)||chr(9)|| 'Review Score' ||chr(9)||chr(9)||chr(9)||chr(9)|| chr(9)|| 'Comments' );
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
        for i in c1 loop
            DBMS_OUTPUT.PUT_LINE( RPAD(i.Review_date, 32,' ') || RPAD(i.Review_score, 25,' ') || i.Comments );
        end loop;
    end if;
end;
/

-- valid
    --valid restaurant_ID 
        exec display_restaurant_reviews(44); 
        exec display_restaurant_reviews(43); 
-- invalid
    -- invalid restaurant_ID
        exec display_restaurant_reviews(54);
        
        select * from review;



--- Feature 10 ---

Create or replace PROCEDURE add_to_cart (c_id int, rest_id int, d_id int) IS
cust_count int;
rest_count int;
rest_open_count int;
dish_match_rest char;
new_cart_id int;
existing_cart int;
dish_quantity int;
newcart_id int;

    Cursor c1 is Select Dish_ID from Dish, Restaurant 
        where Dish.Restaurant_ID = Restaurant.Restaurant_ID and 
        Dish.Restaurant_ID = rest_id;
Begin
    Select count(*) into cust_count
        from Customer where Customer_ID = c_id;
    Select count(*) into rest_count
        from Restaurant where Restaurant_ID = rest_id;
    Select count(*) into rest_open_count
        from Restaurant where Restaurant_ID = rest_id and status in ('open', 'Open');
    dish_match_rest := 'f';
    For r in c1 loop
        If r.dish_ID != d_id then
            dbms_output.put_line(dish_match_rest);
        Else
            dish_match_rest := 't'; 
        End if;
    End loop; 
    
    Select count(*) into existing_cart 
        from Cart where cart.customer_ID = c_id; 
    
    If cust_count = 0 then 
        dbms_output.put_line('INVALID CUSTOMER ID');
    Elsif rest_count = 0 then
        dbms_output.put_line('INVALID RESTAURANT ID');
    Elsif rest_open_count = 0 then
        dbms_output.put_line('RESTAURANT IS CLOSED');
    Elsif dish_match_rest = 'f' then
        dbms_output.put_line('INVALID DISH ID');
    Else
        If existing_cart = 0 then
            new_cart_id := Cart_ID.nextval;
            Insert into Cart values (new_cart_id, c_id, rest_id);
            dbms_output.put_line('New ID: ' || new_cart_id);
            Insert into Dish_cart values (d_id, new_cart_id, 1);
            dbms_output.put_line('Created a new cart for this customer');
        Else
            Select cart_ID into new_cart_id from Cart where cart.Customer_ID = c_id and cart.Restaurant_ID = rest_id;
            Select quantity into dish_quantity from Dish_cart where dish_ID = d_id and cart_ID = new_cart_id;
            Update Dish_cart set quantity = dish_quantity + 1 where cart_ID = new_cart_id and dish_ID = d_id;
            dbms_output.put_line('Dish added to cart');

        End if;
    End if;
End;
/
       

--Invalid
    -- Invalid Customer ID
    exec add_to_cart(25, 41, 51);
    -- Invalid Restaurant ID
    exec add_to_cart(1, 49, 54); 
    -- Restaurant Closed
    exec add_to_cart(1, 41, 51); 
    -- Invalid Dish ID
    exec add_to_cart(1, 42, 50); 
    
    select * from restaurant;
    
--valid
    -- create a new customer without any cart
    Insert into Customer values (Customer_ID.nextval, 'Tom', 'NewJersy', 29201, 'NJ', 'tom@gmail.com', 11);
    select * from customer;
    select * from cart;
    select * from Dish_cart;
    -- New Customer does not have a cart so it creates a new cart and adds the dish in the cart
    exec add_to_cart(6, 44, 54); 
    select * from customer;
    select * from cart;
    select * from Dish_cart;
    -- customer has a cart and dish is present in the cart
    exec add_to_cart(6, 44, 54);
    select * from Dish_cart;

 

---- Feature 11 -------

create or replace procedure calculate_cart_total(cartId_i in int, checkouttime_i in timestamp, del_method_i in int, amount_o out float) as 

cursor c1 is select c.cart_id, c.customer_id, c.restaurant_id, dc.dish_id, dc.quantity, d.dish_name, d.price, r.zip_code from cart c, dish_cart dc , dish d , restaurant r 
    where c.cart_id = dc.cart_id and c.restaurant_id = r.restaurant_id and d.dish_id = dc.dish_id and c.cart_id = cartId_i;
    
discount_var float;
total_amount_var float;
Customer_id_var number;
temp_count_var number;
discount_id_var number;
zipcode_var number;
restaurant_id_var number;
total_amount_del_var number;
delivery_fee number;

begin
    total_amount_var:= 0;
    amount_o:= 0;
    
    select count(*) into temp_count_var from cart where cart_id = cartId_i;
    if temp_count_var =0 then
    dbms_output.put_line(' Invalid cart id ');
    return;
    end if ;
    
    --Total the cart
    
    for i in c1 loop
    Customer_id_var:=i.customer_id;
    zipcode_var:= i.zip_code;
    restaurant_id_var:= i.restaurant_id;
    total_amount_var:=total_amount_var+(i.price*i.quantity);
    end loop;
    dbms_output.put_line(' Total Bill amount :' || total_amount_var);
    -- step 2 : Checking if the checkout time is valid
    
    select count(*), discount_id into temp_count_var, discount_id_var from customer_discount where  start_date <= checkouttime_i and end_date >= checkouttime_i and customer_id = Customer_id_var group by discount_id; 
    if temp_count_var = 0 then
    dbms_output.put_line('No discount for the customer');
    else
    -- step 2 cntd : Applying discounts based on the customers discount id
    if discount_id_var = 1 then
    dbms_output.put_line('free delivery');
    elsif discount_id_var = 2 then
    total_amount_var:=(total_amount_var*0.9);
    dbms_output.put_line('10% discount on the total bill. Bill amount :' || total_amount_var);
    else
    total_amount_var:=(total_amount_var-20);
    dbms_output.put_line('20$ discount on the total bill. Bill amount :' || total_amount_var);
    end if;
    -- step 3 : Applying delivery discounts based on the customers discount id and delivery method
    
    if discount_id_var != 1 and del_method_i =1 then
    select count(*) into temp_count_var from customer where customer_id = Customer_id_var and zip_code = zipcode_var;
    if temp_count_var =0 then
    delivery_fee:=5;
    dbms_output.put_line('5$ delivery fee charged on the bill. Bill amount  ' );
    else
    delivery_fee:=2;
    dbms_output.put_line('2$ delivery fee charged on the bill. Bill amount ' );
    end if;
    
    else 
    delivery_fee:=0;
    dbms_output.put_line('No delivery fee charged on the bill');
    total_amount_var:=(total_amount_var);
    end if;
    -- step 3 : Applying sales tax to the bill amount before delivery fee
    
    select tax into temp_count_var from restaurant r , sales_tax s where s.state = r.state and r.restaurant_id = restaurant_id_var;
    total_amount_var:=total_amount_var+(total_amount_var*(temp_count_var/100));
    dbms_output.put_line('State tax charged is ' || temp_count_var || ' %');
    end if;
    amount_o:=total_amount_var+delivery_fee;
    dbms_output.put_line('Total amount including sales tax without delivery fee ' || amount_o);
end;
/


select * from Customer;
select * from Discount;
select * from Sales_tax;
select * from Customer_discount;

-- valid 
    --valid cart_ID
    Declare 
        amount_o float;
        Begin
        calculate_cart_total(60, '20-dec-22', 1, amount_o);
        Dbms_output.put_line('total amount: ' || amount_o);
    End;
    /
-- invalid 
    --invalid cart_ID
    Declare 
        amount_o float;
        Begin
        calculate_cart_total(92,'20-dec-22', 1, amount_o);
        Dbms_output.put_line('total amount: ' || amount_o);
    End;
    /


--- Feature 12 ---

create or replace Procedure create_order(cartid_i number, ordertime_i timestamp, deliverymethod_i number, estimatedtime_i timestamp, tip_i number, paymentmethod_i varchar)
Is
cart_count number; 
cust_id_var number;
rest_id_var number;
order_id_var number;
totalamount number;
message_body varchar(300);
rest_name_var varchar(100);
total_amount number;
tax_amount number;

Begin

order_id_var:= Order_ID.nextval; -- storing sequence of order in a variable

select count(*) into cart_count
from cart 
where cart_id = cartid_i; 

    if cart_count = 0 then 
        dbms_output.put_line('No such cart_id');
    else    
    calculate_cart_total(60, '20-dec-22', 1,tax_amount); -- caliing feature 11
    DBMS_OUTPUT.PUT_LINE('Total amount computed from feature 11 is : ' || total_amount);
    total_amount:= tax_amount + tip_i;  -- inserting tip into the total amount
    DBMS_OUTPUT.PUT_LINE('Total amount including tip : ' ||total_amount);
        select customer_id, restaurant_id into cust_id_var, rest_id_var 
        from cart 
        where cart_id = cartid_i; -- input into order table
        
        insert into order_t values(order_id_var, deliverymethod_i, cust_id_var, rest_id_var, ordertime_i, null, estimatedtime_i, 'inprogress', 'paid', total_amount); -- input into message table
        
        delete from dish_cart where cart_id = cartid_i; -- deleting from cartdetails        
        
        select r.restaurant_name into rest_name_var
        from cart c inner join restaurant r on c.restaurant_id = r.restaurant_id
        where cart_id = cartid_i; 
        message_body:= 'Order '  || order_id_var || ' is placed at Restaurant '  || rest_name_var || ' with estimated time '  || estimatedtime_i || ' and amount '  || total_amount; -- variable used to store body of message
        
        insert into message values(Message_ID.nextval, cust_id_var,ordertime_i, message_body); -- inserting into message table
        insert into payment values(Payment_ID.nextval, cust_id_var, order_id_var, ordertime_i,  total_amount, paymentmethod_i); -- inserting into payment method
end if;
end;
/

--valid
 exec create_order(60, sysdate, 1 ,  timestamp '2022-12-20 14:00:00.00', 5 , 'card');
--invalid cart ID
     exec create_order(92, sysdate, 1 ,  timestamp '2022-12-20 14:00:00.00', 5 , 'card');

    select * from Cart;
    select * from Dish_cart;
    select * from Order_t;
    select * from Dish_order;
    select * from Payment;
    select * from Message;



--- Feature 13 ---

CREATE OR REPLACE TYPE MyType AS VARRAY(200) OF VARCHAR2(50);-- declaring a avararray to store the list input
/
CREATE OR REPLACE PROCEDURE Advance_search(cust_id int,idlist Mytype,min_score float,min_wait_time varchar) as
-- cartisian product of restaurant,restaurant_category,customer,category 

cursor c1 is select r.restaurant_name, r.address, r.status, r.review_score, r.zip_code,r.wait_time, cg.category_name 
    from restaurant r, customer c, category cg, Restaurant_category rcg 
        where cg.category_id=rcg.category_id 
        and rcg.restaurant_id = r.restaurant_id 
        and c.customer_id=cust_id 
        and r.review_score >= min_score -- comparing min_score from the input
        and substr(r.wait_time,0,2) <= substr(min_wait_time,0,2); -- comparing min_wait_time from the input
cust_count int;
cust_zipcode char(10);
a INTEGER :=0;
begin
 select count(*) into cust_count from customer where customer_id = cust_id;
 if cust_count = 0 then 
   dbms_output.put_line('invalid customer'); -- condition if the customer is not available
 else
select zip_code into cust_zipcode from customer where customer_id = cust_id;
--dbms_output.put_line(cust_zipcode);
for r in c1 loop
if ((r.zip_code=cust_zipcode) or (r.zip_code like  concat(substr(cust_zipcode, 0,4) , '%'))) then --comparing zipcode condition
    for i in 1..idlist.count loop
        if r.category_name = idlist(i) then
        a:=1;
        dbms_output.put_line( 'search results:' ||  chr(10) || 'restaurant name: ' || r.restaurant_name ||  chr(10) || 'Address : ' ||  r.address || chr(10) || 'Status : ' ||  r.status || chr(10)
        || 'avg review score : ' ||  r.review_score || chr(10) || 'zipcode : ' ||  r.zip_code || chr(10) || 'avg wait time : ' ||  r.wait_time || chr(10));
        end if;
    end loop;
    end if;
end loop; 
if a=0 then dbms_output.put_line('No restaurants found near given customer');
end if;
end if;
end;
/


--valid output

exec Advance_search(5,MyType('Indian','Chinese'),3,'50 min');

--invalid output

exec Advance_search(9,MyType('Indian','Chinese'),3,'50 min');

-- exception case where there is no nearby restaurant which satisfies all the conditions

exec Advance_search(2,MyType('Indian','Chinese'),3,'20 min');



--- Feature 14 ---

CREATE OR REPLACE PROCEDURE restaurant_recommendation(custid int)
AS 
    cust_id number;
    rest_id order_t.restaurant_id%type;
    cursor j1 is select restaurant_id from order_t where customer_id=custid;-- restaturent id  is derived from this statement from input customerid
    u j1%rowtype;
    cursor c1 is select customer_id,restaurant_id from order_t 
        where restaurant_id in (select  restaurant_id from order_t where customer_id=custid) and customer_id !=custid;
        -- cust_id and rest_id are retrieved from this statement
    v c1%rowtype; 
    cursor c2 is  select restaurant_id,restaurant_name,address,review_score from restaurant 
        where restaurant_id in(select restaurant_id from order_t 
            where customer_id in (select customer_id from order_t 
                where restaurant_id in (select  restaurant_id from order_t where customer_id=custid)) 
                and restaurant_id not in(select restaurant_id from order_t where customer_id=custid)); -- statemnt to print the restaurent id,name,address,reviews.
    w c2%rowtype;
begin
-- implicit cursor to validate customer_id
select customer_id into cust_id from customer where customer_id=custid;
    open j1;
    open c1;
   open c2; 
    if cust_id!=0 then
        --Dbms_output.put_line(cust_id||'customer id');
        loop
            fetch j1 into u;
            exit when j1%NOTFOUND;
            Dbms_output.put_line('Restaurant_id :' || u.restaurant_id );
            fetch c1 into v;
            exit when c1%NOTFOUND;
            Dbms_output.put_line('Customer '||v.customer_id||' has also chosen '||' Restaurant'||v.restaurant_id);
            fetch c2 into w;
            exit when c2%NOTFOUND;
            Dbms_output.put_line('Restaurant_id: ,'||w.restaurant_id||' Restaurant_name: '||w.restaurant_name||' ,Address: '||w.address||' ,Average reviews: '||w.review_score);
        end loop;
        
    close j1;
    close c1;
    close c2;
end IF;

EXCEPTION 
   WHEN no_data_found THEN 
      dbms_output.put_line('No such customer!');
end;
/

--valid
    select * from order_t;
    exec restaurant_recommendation(2);

--invalid
    exec restaurant_recommendation(9);



