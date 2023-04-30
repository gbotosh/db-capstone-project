-- Create AddBooking stored procedure
DELIMITER $$
CREATE PROCEDURE AddBooking(
				IN BID INT,
                IN TNo INT,
                IN BDate DATE,
                IN CID INT
)
BEGIN
INSERT INTO Bookings(BookingID, TableNumber, BookingDate, CustomerID)
VALUES(BID, TNo, BDATE, CID);
END$$

DELIMITER ;

-- Create UpdateBooking stored procedure
DELIMITER $$
CREATE PROCEDURE UpdateBooking(
				IN BID INT,
                IN BDate DATE
)
BEGIN
UPDATE Bookings
SET BookingDate = BDate
WHERE BookingID = BID;
END$$

DELIMITER ;



-- Create CancelBooking stored procedure
DELIMITER $$
CREATE PROCEDURE CancelBooking(
				IN BID INT
)
BEGIN
DELETE FROM Bookings
WHERE BookingID = BID;
END$$

DELIMITER ;