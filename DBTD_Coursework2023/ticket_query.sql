--1
/*
    List all relevant
    information about Exeter Food Festival 2023, including the venue, the starting and
    end time, the total number of each type of tickets
*/

SELECT DISTINCT EventName,EventDate,EventStart,EventEnd,EventVenue,TicketTypeName,TicketStartQ FROM Event
JOIN Ticket ON Event.EventID = Ticket.EventID
WHERE EventName = 'Exeter Food Festival 2023';

--2
/*
    Find all the events in Exeter starting from 1 July, 2023 to 10 July,
    2023. List the event title, starting time and end time, and
    description
*/

SELECT EventName,EventDate,EventStart,EventEnd,EventDescription FROM Event 
WHERE EventDate >= '2023-07-01' AND EventDate <= '2023-07-10' ;

--3
/*
    There are three types of tickets (Gold, Silver, Bronze) for the
    Exmouth Music Festival 2023. List available ticket amount for the
    Bronze ticket type, together with its price
*/

SELECT TicketTypeName, SUM(TicketAvailable) AS AvalableCount, TicketPrice FROM Ticket 
WHERE EventID = 'E7' AND TicketTypeName = 'Bronze';

--4
/*
    List all the customer’s names who have booked Gold tickets for the
    Exmouth Music Festival 2023, together with the number of Gold
    tickets booked for each customer. 
*/

SELECT DISTINCT CustomerName,COUNT(TicketTypeName) as NumOfGold FROM Customer
JOIN Booking ON Customer.CustomerID = Booking.CustomerID
JOIN Ticket ON Booking.BookingID = Ticket.TicketBookingID
WHERE TicketTypeName = 'Gold'
GROUP BY Customer.CustomerName;

--5
/*
   List all event names and the number of tickets that have been sold
    out for each event so far, ordered by the number of sold-out tickets
    in descending order
*/

SELECT EventName, TicketTypeName, COUNT(TicketAvailable) AS SoldTickets FROM Ticket
JOIN Event ON Ticket.EventID = Event.EventID 
WHERE TicketAvailable = False
GROUP BY Event.EventName, TicketTypeName
ORDER BY SoldTickets DESC;

--6
/*
    List all the relevant information by offering a booking ID, such as
    the customer’s name, booking time, event title, delivery options,
    ticket types and the number of tickets for each type, the total
    payment and so on.
*/

SELECT DISTINCT CustomerName,BookingID,CustomerEmail,BookingTime,EventName,TicketTypeName,COUNT(TicketBookingID) AS sumOfTickets,TotalAmount,PaymentMethod,VoucherApplied,DeliveryType,PaymentSuccess,PState FROM Booking
JOIN Event ON Booking.EventID = Event.EventID
JOIN Ticket ON Booking.BookingID = Ticket.TicketBookingID
JOIN Customer ON Booking.CustomerID = Customer.CustomerID
JOIN Voucher ON Booking.VoucherID = Voucher.VoucherID
WHERE BookingID = 'B1'
GROUP BY Ticket.TicketTypeName;

--7
/*
    Find which event has the maximum income so far. List its event title
    and its total income
*/

SELECT EventName,SUM(TotalAmount) AS BigTotal FROM Event
JOIN Booking ON Event.EventID = Booking.EventID
GROUP BY Event.EventName
ORDER BY BigTotal DESC
LIMIT 1;

