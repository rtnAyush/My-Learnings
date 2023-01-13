rference -> https://www.w3schools.com/sql/default.asp

# DataBase Operations
## Create
## Read
## Edit
## Delete

Note: I am folowing , Capital letters  for keyWords and small letters for user define variables

# Create

    CREATE TABLE customers (
    id INT,
    frist_name STRING,
    last_name STRING,
    address STRING
    );
    
Link -> https://www.w3schools.com/sql/sql_datatypes.asp

    CREATE TABLE products (
    id INT NOT NULL,
    name STRING,
    price MONEY,
    PRIMARY KEY (id)
    ); 
  #### Primary key is used to take unique values only
   
    CREATE TABLE orders (
    id INT NOT NULL,
    order_id INT,
    customer_id INT,
    product_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
    );
  #### Foreign key is used to make relation  with other tables.
  
  
# Read
  #### It  will read all  the  columns from products table
    SELECT * FROM products; 
  
  #### It  will read only name and price columns from products table. 
    SELECT name, price FROM products;
    
# Insert columns
  #### To insert all values
    INSERT INTO customers
    VALUES (1,"Ayush","Kumar","naga road raxaul");
  
  #### To insert only some column  value
    INSERT INTO customers (id, last_name)
    VALUES (1,"Kumar");
    

# Update columns
    UPDATE products
    SET name = "Pencil",price  =  10
    WHERE id=1;
    
   ##### here where  must be specified ,else all values of columns name  and price will  became "Pencil" and 10
    
# Add columns
    ALTER TABLE products
    ADD stock INT;
    
 #### In products table , stock columns will be added
    
# Delete Tables
    DELETE FROM demo 
    
    
# SQL Relationships (Inner Join)
Link --> https://www.w3schools.com/sql/sql_join_inner.asp

    SELECT orders.order_id, customers.frist_name, customers.last_name, customers.address, products.name
    FROM orders
    INNER JOIN customers, products ON orders.customer_id = customers.id AND orders.product_id  = products.id;
    
  #### The code will select columns of specified values because of forign key relation from orders
  #### and then Display (join) All the values  in  select section

