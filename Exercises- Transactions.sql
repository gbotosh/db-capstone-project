-- Populate Bookings table
INSERT INTO Customers()
VALUES(),
	  (),
      ();

INSERT INTO Bookings(BookingDate, TableNumber, CustomerID)
VALUES('22-10-10', 5,1),
	  ('22-11-12', 3, 3),
      ('22-10-11', 2, 2),
      ('22-10-13', 2, 1);
      

      
-- Create CheckBooking stored procedure
DELIMITER $$
CREATE PROCEDURE CheckBooking(
				IN BDate date,
                IN TNo int
)
BEGIN
DECLARE TableCount INT;
SELECT COUNT(*) INTO TableCount
FROM Bookings
WHERE BookingDate = Bdate AND TableNumber = TNo;

	IF TableCount = 0 THEN
		SELECT "Table is not booked" AS BookingStatus;
	ELSE 
		SELECT "Table is booked" AS BookingStatus;
	END IF;
END$$

DELIMITER ;
CALL CheckBooking('22-10-10', 5);

-- Creaate AddValidBooking stored procedures
DELIMITER $$
CREATE PROCEDURE AddValidBooking(
				IN BDate date,
                IN TNo int
)
BEGIN
DECLARE TableCount INT;
START TRANSACTION;
INSERT INTO Bookings (TableNumber, BookingDate, CustomerID)
VALUES(TNo, BDATE);
SELECT COUNT(*) INTO TableCount
FROM Bookings
WHERE TableNumber = TNo; 
	IF TableCount > 1 THEN
		ROLLBACK;
		SELECT "Table is already booked - booking cancelled" AS BookingStatus;
	ELSE 
		Commit;
		SELECT "Table is booked" AS BookingStatus;
	END IF;
END$$

DELIMITER ;

CALL AddValidBooking(5, '22-10-10');


