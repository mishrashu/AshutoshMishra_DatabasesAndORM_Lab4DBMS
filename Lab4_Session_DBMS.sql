/**** CREATE DATABASE ****/

CREATE DATABASE IF NOT EXISTS `order-directory`; 
USE `order-directory`;

/**** CREATE TABLES ****/

CREATE TABLE IF NOT EXISTS supplier (
    SUPP_ID INT,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL,
    CONSTRAINT PK_supplier PRIMARY KEY (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS customer (
    CUS_ID INT,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR,
    CONSTRAINT PK_customer PRIMARY KEY (CUS_ID)
);

CREATE TABLE IF NOT EXISTS category (
    CAT_ID INT,
    CAT_NAME VARCHAR(20) NOT NULL,
    CONSTRAINT PK_category PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
    PRO_ID INT,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    CONSTRAINT PK_product PRIMARY KEY (PRO_ID),
    CONSTRAINT FK_product FOREIGN KEY (CAT_ID)
        REFERENCES category (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
    PRICING_ID INT,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    CONSTRAINT PK_supplier_pricing PRIMARY KEY (PRICING_ID),
    CONSTRAINT FK1_supplier_pricing FOREIGN KEY (PRO_ID)
        REFERENCES product (PRO_ID),
    CONSTRAINT FK2_supplier_pricing FOREIGN KEY (SUPP_ID)
        REFERENCES supplier (SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
    ORD_ID INT,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    CONSTRAINT PK_orders PRIMARY KEY (ORD_ID),
    CONSTRAINT FK1_orders FOREIGN KEY (CUS_ID)
        REFERENCES customer (CUS_ID),
    CONSTRAINT FK2_orders FOREIGN KEY (PRICING_ID)
        REFERENCES supplier_pricing (PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
    RAT_ID INT,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    CONSTRAINT PK_rating PRIMARY KEY (RAT_ID),
    CONSTRAINT FK_rating FOREIGN KEY (ORD_ID)
        REFERENCES orders (ORD_ID)
);

/**** INSERT data into TABLES ****/

/* supplier table */

insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (1,'Rajesh Retails','Delhi','1234567890');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (3,'Knome products','Banglore','9785462315');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (4,'Bansal Retails','Kochi','8975463285');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (5,'Mittal Ltd.','Lucknow','7898456532');

/* customer table */

insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (1,'AAKASH','9999999999','DELHI','M');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (2,'AMAN','9785463215','NOIDA','M');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (3,'NEHA','9999999999','MUMBAI','F');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (4,'MEGHA','9994562399','KOLKATA','F');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (5,'PULKIT','7895999999','LUCKNOW','M');

/* category table */

insert into category (CAT_ID,CAT_NAME) values (1,'BOOKS');
insert into category (CAT_ID,CAT_NAME) values (2,'GAMES');
insert into category (CAT_ID,CAT_NAME) values (3,'GROCERIES');
insert into category (CAT_ID,CAT_NAME) values (4,'ELECTRONICS');
insert into category (CAT_ID,CAT_NAME) values (5,'CLOTHES');

/* product table */ 

insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (4,'OATS','Highly Nutritious from Nestle',3);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (6,'MILK','1L Toned MIlk',3);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (9,'Project IGI','compatible with windows 7 and above',2);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (10,'Hoodie','Black GUCCI for 13 yrs and above',5);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
insert into product (PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values (12,'Train Your Brain','By Shireen Stephen',1);

/* supplier_pricing table */

insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (1,1,2,1500);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (2,3,5,30000);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (3,5,1,3000);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (4,2,3,2500);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (5,4,1,1000);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (6,12,2,780);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (7,12,2,789);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (8,3,1,31000);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (9,1,5,1450);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (10,4,2,999);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (11,7,3,549);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (12,7,4,529);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (13,6,2,105);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (14,6,1,99);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (15,2,5,2999);
insert into supplier_pricing (PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) values (16,5,2,2999);

/* order table */

insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (101,1500,'2021-10-06',2,1);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (102,1000,'2021-10-12',3,5);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (103,30000,'2021-09-16',5,2);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (104,1500,'2021-10-05',1,1);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (105,3000,'2021-08-16',4,3);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (106,1450,'2021-08-18',1,9);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (107,789,'2021-09-01',3,7);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (108,780,'2021-09-07',5,6);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (109,3000,'2021-09-10',5,3);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (110,2500,'2021-09-10',2,4);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (111,1000,'2021-09-15',4,5);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (112,789,'2021-09-16',4,7);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (113,31000,'2021-09-16',1,8);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (114,1000,'2021-09-16',3,5);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (115,3000,'2021-09-16',5,3);
insert into `order` (ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) values (116,99,'2021-09-17',2,14);

/* rating table */

insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (1,101,4);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (2,102,3);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (3,103,1);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (4,104,2);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (5,105,4);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (6,106,3);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (7,107,4);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (8,108,4);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (9,109,3);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (10,110,5);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (11,111,3);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (12,112,4);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (13,113,2);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (14,114,1);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (15,115,1);
insert into rating (RAT_ID,ORD_ID,RAT_RATSTARS) values (16,116,0);

/*** Check Table Data. ***/

select * from supplier;
select * from customer;
select * from category;
select * from product;
select * from supplier_pricing;
select * from `order`;
select * from rating;

/*** Queries ***/

/*
4) Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
*/

SELECT 
    COUNT(CUS_ID) as "Customer Count", CUS_GENDER as Gender
FROM
    customer
WHERE
    cus_id IN (SELECT 
            cus_id
        FROM
            `order`
        WHERE
            ord_amount >= 3000)
GROUP BY CUS_GENDER;

/*
5) Display all the orders along with product name ordered by a customer having Customer_Id=2
*/

SELECT 
    t.ORD_ID,
    t.ORD_AMOUNT,
    t.ORD_DATE,
    t.CUS_ID,
    t.pricing_id,
    p.pro_name
FROM
    product p
        INNER JOIN
    (SELECT 
        o.ORD_ID,
            o.ORD_AMOUNT,
            o.ORD_DATE,
            o.CUS_ID,
            sp.pricing_id,
            sp.pro_id
    FROM
        supplier_pricing AS sp
    INNER JOIN (SELECT 
        ORD_ID, ORD_AMOUNT, ORD_DATE, customer.CUS_ID, PRICING_ID
    FROM
        `order`
    INNER JOIN customer ON `order`.cus_id = customer.cus_id
    WHERE
        customer.cus_id = 2) AS o ON sp.pricing_id = o.pricing_id) AS t ON p.pro_id = t.pro_id;

/*
6) Display the Supplier details who can supply more than one product.
*/

SELECT 
    a.supp_id, SUPP_NAME, SUPP_CITY, SUPP_PHONE, a.productCount
FROM
    supplier s
        INNER JOIN
    (SELECT 
        supp_id, COUNT(pro_id) AS productCount
    FROM
        supplier_pricing
    WHERE
        pro_id IN (SELECT 
                pro_id
            FROM
                product)
    GROUP BY supp_id
    HAVING COUNT(*) > 1) a ON a.SUPP_ID = s.supp_id;
    
/*
7) Find the least expensive product from each category and print the table with category id, name, product name and price of the product
*/

select e.cat_id, e.cat_name, e.pro_name, e.supp_price, e.min_supp_price from 
(select d.cat_id, d.cat_name, d.pro_name, sp.supp_price, row_number() OVER (partition by d.cat_id order by sp.supp_price asc) 
as min_supp_price from supplier_pricing sp
inner join
(select c.cat_id, cat_name, p.pro_name,p.pro_id from category as c
inner join product as p
on c.cat_id = p.cat_id) as d
on d.pro_id=sp.pro_id) as e
where e.min_supp_price=1;

/*
8) Display the Id and Name of the Product ordered after “2021-10-05”.
*/

SELECT 
    a.pro_id, a.pro_name
FROM
    `order` o
        INNER JOIN
    (SELECT 
        p.pro_id, p.pro_name, sp.pricing_id
    FROM
        product p
    INNER JOIN supplier_pricing sp ON p.pro_id = sp.pro_id) AS a ON o.pricing_id = a.pricing_id
        AND o.ord_date > '2021-10-05';

/*
9) Display customer name and gender whose names start or end with character 'A'.
*/

SELECT 
    cus_name, cus_gender
FROM
    customer
WHERE
    cus_name LIKE 'A%' OR cus_name LIKE '%A';
    
/*
10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, 
If rating >2 print “Average Service” else print “Poor Service”. Note that there should be one rating per supplier.
*/
USE `order-directory`;
DROP procedure IF EXISTS `supplier_rating`;
DELIMITER $$
USE `order-directory`$$
CREATE PROCEDURE `supplier_rating` ()
BEGIN
SELECT 
    s.supp_id,
    supp_name,
    rosp.Average_Rating,
    CASE
        WHEN Average_Rating = 5 THEN 'Excellent Service'
        WHEN Average_Rating > 4 THEN 'Good Service'
        WHEN Average_Rating > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
FROM
    supplier s
        INNER JOIN
    (SELECT 
            avg(ro.RAT_RATSTARS) as Average_Rating,
            sp.supp_id
    FROM
        supplier_pricing sp
    INNER JOIN (SELECT 
        RAT_ID, r.ORD_ID, RAT_RATSTARS, o.pricing_id
    FROM
        rating r
    INNER JOIN `order` o 
    ON r.ORD_ID = o.ORD_ID ) AS ro ON sp.pricing_id = ro.pricing_id group by sp.supp_id) AS rosp
    ON s.supp_id = rosp.supp_id;
END$$

/* Invoking & executing procedure */
call `supplier_rating`;