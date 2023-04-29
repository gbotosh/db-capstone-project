
-- Task Create Virtual Tables
CREATE VIEW OrdesView As
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

-- Task: Join
SELECT C.CustomerID, C.FullName, O.OrderID, O.TotalCost, M.MenuName, MS.CourseName
FROM customers C
JOIN orders O
ON C.customerID = O.customerID
JOIN menus M
ON O.MenuID = M.MenuID
JOIN MenuItems MS
ON M.MenuItemsID = MS.MenuItemsID
WHERE O.TotalCost > 150
ORDER BY O.TotalCost;

Task: Subquery
SELECT MenuName
FROM Menus
WHERE MenuID = ANY (SELECT MenuID FROM Orders WHERE Quantity > 2)

-- Exercise: Create optimized queries to manage and analyze data
-- Task 1: Create GetMaxQuantity stored prosedure
DELIMITER $$
CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Qunatity)
FROM ORDERS;
END$$
DELIMITER ; 

-- Task 2: Create GetOrderDetail prepared statement
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE CustomerID = ?';

-- Task 3: Create CancelOrder store procedure
DELIMITER $$
CREATE PROCEDURE CancelOrder(
		IN ID INT
)
BEGIN
DELETE
FROM ORDERS
WHERE OrderID = ID;
END$$
DELIMITER ; 
