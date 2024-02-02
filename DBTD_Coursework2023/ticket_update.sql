--1
UPDATE Event
SET EventTotTicket = EventTotTicket + 100
WHERE EventName = 'Exeter Food Festival 2023' ;

UPDATE Ticket
SET TicketStartQ = TicketStartQ + 100
WHERE TicketTypeName = 'Adult';

--Testing queries
--SELECT EventTotTicket FROM Event
--WHERE EventName = 'Exeter Food Festival 2023';
--SELECT * FROM Ticket 
--WHERE TicketTypeName='Adult';

--2
INSERT INTO Customer
VALUES ('C5','Ian Cooper','1989-20-02','IanCoopMail@yahoo.com' );
    
INSERT INTO Booking
VALUES ('B6','C5','E1','V8','2023-02-04 13:04:00', 58.5, 3, True, 'Credit Card', 'Amex', '96593516582', '2992', '12/2027','Active','email',1);

UPDATE Ticket
SET TicketBookingID = 'B6', TicketAvailable = False
WHERE TicketID ='T3' OR TicketID = 'T102' OR TicketID ='T103';

--Testing query
--SELECT BookingID,CustomerID,TicketID,TicketTypeName FROM Booking
--JOIN Ticket ON Booking.BookingID = Ticket.TicketBookingID
--WHERE BookingID='B6';

--3
INSERT INTO Cancellation
VALUES ('C0','B5','2023-11-06','The event I had tickets for got canceled so i am going to get a refund');

UPDATE Booking
SET PState = 'Cancelled'
WHERE BookingID = 'B5';

UPDATE Ticket
SET TicketBookingID = 'None', TicketAvailable = False
WHERE TicketBookingID = 'B5';

--Testing queries
--SELECT * FROM Booking
--WHERE BookingID = 'B5';

--SELECT * FROM Cancellation;

--SELECT * FROM Ticket
--WHERE TicketBookingID = 'B5';

--4
INSERT INTO Voucher
VALUES ('V9','E7','SUMMER20',20);

--Testing query
--SELECT * FROM Voucher;