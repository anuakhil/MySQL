# 1: Create Database
CREATE DATABASE Sales;

#2: Use the Database
USE Sales;

# 3: Create Table Orders with Constraints
CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

#4: Add New Column order_quantity
ALTER TABLE Orders
ADD COLUMN order_quantity INT NOT NULL;

# 5: Rename the Table to sales_orders
RENAME TABLE Orders TO sales_orders;

# 6: Insert 10 Rows
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES
(1, 'Anu', 'Electronics', 'Smartphone', '1234567890', 2),
(2, 'Akhil', 'Furniture', 'Dining Table', '1234567891', 1),
(3, 'Daksha', 'Apparel', 'Jacket', '1234567892', 3),
(4, 'Aron', 'Electronics', 'Laptop', '1234567893', 1),
(5, 'Nethan', 'Appliances', 'Microwave', '1234567894', 2),
(6, 'Anosh', 'Furniture', 'Sofa', '1234567895', 1),
(7, 'Amruth', 'Electronics', 'Headphones', '1234567896', 4),
(8, 'Priyanka', 'Books', 'Novel', '1234567897', 5),
(9, 'Sasi', 'Groceries', 'Rice Bag', '1234567898', 2),
(10, 'Pushpa', 'Toys', 'Lego Set', '1234567899', 3);

# 7: Retrieve customer_name and Ordered_item
SELECT Customer_name, Ordered_item
FROM sales_orders;

# 8: Update Product Name for Any Row
UPDATE sales_orders
SET Ordered_item = 'Gaming Laptop'
WHERE Order_Id = 4;

#9: Delete the sales_orders Table
DROP TABLE sales_orders;