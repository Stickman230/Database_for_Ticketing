CREATE DATABASE OnlineBookingTicketingSystem;

CREATE TABLE Event (
    EventID VARCHAR(255) PRIMARY KEY,
    EventName VARCHAR(255),
    EventDate DATE,
    EventStart TIME,
    EventEnd TIME,
    EventVenue VARCHAR(255), 
    EventDescription TEXT,
    EventTotTicket INT,
    EventIncome DECIMAL(7,2)
);

CREATE TABLE Ticket (
    TicketID VARCHAR(255) PRIMARY KEY,
    EventID VARCHAR(255),
    TicketTypeName VARCHAR(255),
    TicketPrice DECIMAL(7, 2),
    TicketDescription TEXT,
    TicketStartQ INT,
    TicketAvailable BOOLEAN,
    TicketBookingID VARCHAR(255),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE Customer (
    CustomerID VARCHAR(255) PRIMARY KEY,
    CustomerName VARCHAR(255),
    CustomerDOB DATE,
    CustomerEmail VARCHAR(255) UNIQUE
);

CREATE TABLE Booking (
    BookingID VARCHAR(255) PRIMARY KEY,
    CustomerID VARCHAR(255),
    EventID VARCHAR(255),
    VoucherID VARCHAR(255),
    BookingTime DATETIME,
    TotalAmount DECIMAL(8, 2),
    TicketQuantity INT,
    PaymentSuccess BOOLEAN,
    PaymentMethod VARCHAR(50),
    CardType VARCHAR(50),
    CardNumber VARCHAR(20),
    CardSecCode VARCHAR(4),
    CardExpDate CHAR(7),
    PState VARCHAR(50),
    DeliveryType VARCHAR(50),
    VoucherApplied DECIMAL(3, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID)
);


CREATE TABLE Voucher (
    VoucherID VARCHAR(255) PRIMARY KEY,
    EventID VARCHAR(255),
    VoucherCode VARCHAR(20),
    VoucherDiscount DECIMAL(3, 2),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);


CREATE TABLE Cancellation (
    CancellationID VARCHAR(255) PRIMARY KEY,
    BookingID VARCHAR(255),
    CurrentDate DATE,
    Reason TEXT,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


-- insert some values
INSERT INTO Event VALUES ('E0', 'HugeEvent', '2023-10-23', '12:00:00', '16:00:00','MGMGrand','An enormous event with the participation of very big artists',1,10);
INSERT INTO Event VALUES ('E1', 'Exeter Food Festival 2023', '2023-06-16', '12:00:00', '21:00:00','EscotPark','Join us at Escot Park for Exeter Foodies Festival 2023 - our biggest celebration yet of top chefs, tasty food, delicious drinks and live music. ',200,4000);
INSERT INTO Event VALUES ('E2', 'Lets Rock!', '2023-07-01', '19:00:00', '23:00:00','Cathedral Yard','Let s Rock Exeter! will return to the magnificent Powderham Castle on Saturday 1st July 2023. ',30,1000);
INSERT INTO Event VALUES ('E3', 'Exeter Craft Festival', '2023-07-04', '14:00:00', '18:00:00','Powderham Castle','this very special event is run entirely by a team of volunteers. This celebration of art, craft and entertainment has been an annual event for over 40 years. Over 100 stalls in a unique tented village showcase the work of the West Country best artists and makers. ',20,500);
INSERT INTO Event VALUES ('E4', 'Exeter Craft Festival Day2', '2023-07-05', '15:00:00', '20:00:00','Powderham Castle','this very special event is run entirely by a team of volunteers. This celebration of art, craft and entertainment has been an annual event for over 40 years. Over 100 stalls in a unique tented village showcase the work of the West Country best artists and makers. ',20,500);
INSERT INTO Event VALUES ('E5', 'Exeter Craft Festival Day3', '2023-07-06', '14:00:00', '20:00:00','Powderham Castle','this very special event is run entirely by a team of volunteers. This celebration of art, craft and entertainment has been an annual event for over 40 years. Over 100 stalls in a unique tented village showcase the work of the West Country best artists and makers. ',20,500);
INSERT INTO Event VALUES ('E6', 'Exeter-french-festival', '2023-07-08', '12:30:00', '15:00:00','Exeter Community Centre','Come along with your friends and experience something French: cinéma, cooking, language games as well as the famous concours de pétanque. Its free! ',20,0);
INSERT INTO Event VALUES ('E7', 'Exmouth Music Festival 2023', '2023-07-19', '18:30:00', '02:00:00','Emouth Beach ','Get ready for one of the best music festival of your life ',80,1700);

INSERT INTO Customer VALUES ('C0', 'Maxime Reynaud', '2004-10-23', 'email@gmail.com');
INSERT INTO Customer VALUES ('C1', 'Jonh Doe', '2000-10-10', 'mymail@gmail.com');
INSERT INTO Customer VALUES ('C2', 'George Washington', '1732-02-22', 'GWmail@gmail.com');
INSERT INTO Customer VALUES ('C3', 'Jason Bourne', '1994-03-22', 'JasonBmail@gmail.com');
INSERT INTO Customer VALUES ('C4', 'Joe Smiths ', '1981-11-30', 'JoeSmith@gmail.com');

INSERT INTO Voucher VALUES ('V0', 'E0', '0Change', 0);
INSERT INTO Voucher VALUES ('V1', 'E1', '0Change', 0);
INSERT INTO Voucher VALUES ('V2', 'E2', '0Change', 0);
INSERT INTO Voucher VALUES ('V3', 'E3', '0Change', 0);
INSERT INTO Voucher VALUES ('V4', 'E4', '0Change', 0);
INSERT INTO Voucher VALUES ('V5', 'E5', '0Change', 0);
INSERT INTO Voucher VALUES ('V6', 'E6', '0Change', 0);
INSERT INTO Voucher VALUES ('V7', 'E7', '0Change', 0);
INSERT INTO Voucher VALUES ('V8', 'E1', 'FOOD10', 10);


INSERT INTO Booking VALUES ('B0', 'C0', 'E0', 'V0', '2023-09-24 13:43:00', 10, 1, True, 'Debit Card', 'Amex', '374018447622929', '4904', '08/2024','Active','email',1);
INSERT INTO Booking VALUES ('B1', 'C0', 'E1', 'V1', '2023-09-24 13:43:00', 65, 3, True, 'Debit Card', 'Amex', '374018447622929', '4904', '08/2025','Active','email',1);
INSERT INTO Booking VALUES ('B2', 'C1', 'E7', 'V7', '2023-07-10 19:35:00', 40, 2, False, 'Credit Card', 'Master Card', '594298677612929', '7414', '07/2026','Active','At the Venue',1);
INSERT INTO Booking VALUES ('B3', 'C2', 'E7', 'V7', '2023-06-16 20:15:00', 80, 2, True, 'Credit Card', 'Visa', '99029857817222', '6355', '02/2027','Active','email',1);
INSERT INTO Booking VALUES ('B4', 'C3', 'E7', 'V7', '2023-05-29 11:00:00', 40, 1, True, 'Credit Card', 'aster Card', '64948262758942', '1265', '10/2026','Active','email',1);
INSERT INTO Booking VALUES ('B5', 'C4', 'E6', 'V6', '2023-07-05 15:00:00', 20, 1, True, 'Credit Card', 'Visa', '867567825867', '6543', '01/2024','Active','email',1);

INSERT INTO Ticket VALUES ('T0', 'E0', 'Special', 10, 'This ticket grants you acces too all Special events', 1, False,'B0');
INSERT INTO Ticket VALUES ('T1', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, False,'B1');
INSERT INTO Ticket VALUES ('T2', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, False,'B1');
INSERT INTO Ticket VALUES ('T3', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T4', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T5', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T6', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T7', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T8', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T9', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T10', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T11', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T12', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T13', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T14', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T15', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T16', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T17', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T18', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T19', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T20', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T21', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T22', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T23', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T24', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T25', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T26', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T27', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T28', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T29', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T30', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T31', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T32', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T33', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T34', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T35', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T36', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T37', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T38', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T39', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T40', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T41', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T42', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T43', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T44', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T45', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T46', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T47', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T48', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T49', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T50', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T51', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T52', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T53', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T54', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T55', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T56', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T57', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T58', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T59', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T60', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T61', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T62', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T63', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T64', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T65', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T66', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T67', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T68', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T69', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T70', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T71', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T72', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T73', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T74', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T75', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T76', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T77', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T78', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T79', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T80', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T81', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T82', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T83', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T84', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T85', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T86', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T87', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T88', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T89', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T90', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T91', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T92', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T93', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T94', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T95', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T96', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T97', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T98', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T99', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T100', 'E1', 'Child', 15, 'This ticket grants you acces too all child events, for 5 to 15 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T101', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, False,'B1');
INSERT INTO Ticket VALUES ('T102', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T103', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T104', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T105', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T106', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T107', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T108', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T109', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T110', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T111', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T112', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T113', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T114', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T115', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T116', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T117', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T118', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T119', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T120', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T121', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T122', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T123', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T124', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T125', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T126', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T127', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T128', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T129', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T130', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T131', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T132', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T133', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T134', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T135', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T136', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T137', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T138', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T139', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T140', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T141', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T142', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T143', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T144', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T145', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T146', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T147', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T148', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T149', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T150', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T151', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T152', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T153', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T154', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T155', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T156', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T157', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T158', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T159', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T160', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T161', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T162', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T163', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T164', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T165', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T166', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T167', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T168', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T169', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T170', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T171', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T172', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T173', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T174', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T175', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T176', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T177', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T178', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T179', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T180', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T181', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T182', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T183', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T184', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T185', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T186', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T187', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T188', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T189', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T190', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T191', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T192', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T193', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T194', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T195', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T196', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T197', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T198', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T199', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');
INSERT INTO Ticket VALUES ('T200', 'E1', 'Adult', 25, 'This ticket grants you acces too all of the event, for above 16 years old', 100, True,'None');

INSERT INTO Ticket VALUES ('T201', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T202', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T203', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T204', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T205', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T206', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T207', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T208', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T209', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T210', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T211', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T212', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T213', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T214', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T215', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T216', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T217', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T218', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T219', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T220', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T221', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T222', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T223', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T224', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T225', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T226', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T227', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T228', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T229', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T230', 'E7', 'Bronze', 10, 'This ticket grants you acces too all of the Bronze event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T232', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, False, 'B2');
INSERT INTO Ticket VALUES ('T233', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, False, 'B2');
INSERT INTO Ticket VALUES ('T234', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T235', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T236', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T237', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T238', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T239', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T240', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T241', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T242', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T243', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T244', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T245', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T246', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T247', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T248', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T249', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T250', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T251', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T252', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T253', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T254', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T255', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T256', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T257', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T258', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T259', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T260', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T261', 'E7', 'Silver', 20, 'This ticket grants you acces too all of the Silver event', 30, True, 'None');
INSERT INTO Ticket VALUES ('T263', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, False, 'B3');
INSERT INTO Ticket VALUES ('T264', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, False, 'B3');
INSERT INTO Ticket VALUES ('T265', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, False, 'B4');
INSERT INTO Ticket VALUES ('T266', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T267', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T268', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T269', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T270', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T271', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T272', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T273', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T274', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T275', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T276', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T277', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T278', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T279', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T280', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T281', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');
INSERT INTO Ticket VALUES ('T282', 'E7', 'Gold', 40, 'This ticket grants you acces too all of the Gold event', 20, True, 'None');

INSERT INTO Ticket VALUES ('T283', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T284', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T285', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T286', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T287', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T288', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T289', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T290', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T291', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T292', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T293', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T294', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T295', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T296', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T297', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T298', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T299', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T300', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T301', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T302', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T303', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T304', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T305', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T306', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T307', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T308', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T309', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T310', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T311', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');
INSERT INTO Ticket VALUES ('T312', 'E2', 'Normal', 10, 'This ticket grants you acces too all Rocking events', 30, True, 'None');

INSERT INTO Ticket VALUES ('T313', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T314', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T315', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T316', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T317', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T318', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T319', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T320', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T321', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T322', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T323', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T324', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T325', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T326', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T327', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T328', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T329', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T330', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T331', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T332', 'E3', 'Normal', 20, 'This ticket grants you acces too all events', 20, True, 'None');

INSERT INTO Ticket VALUES ('T333', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T334', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T335', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T336', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T337', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T338', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T339', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T340', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T341', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T342', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T343', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T344', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T345', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T346', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T347', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T348', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T349', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T350', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T351', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T352', 'E4', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');

INSERT INTO Ticket VALUES ('T353', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T354', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T355', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T356', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T357', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T358', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T359', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T360', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T361', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T362', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T363', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T364', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T365', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T366', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T367', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T368', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T369', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T370', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T371', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T372', 'E5', 'Normal', 40, 'This ticket grants you acces too all events', 20, True, 'None');

INSERT INTO Ticket VALUES ('T373', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, False, 'B5');
INSERT INTO Ticket VALUES ('T374', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T375', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T376', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T377', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T378', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T379', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T380', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T381', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T382', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T383', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T384', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T385', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T386', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T387', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T388', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T389', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T390', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T391', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');
INSERT INTO Ticket VALUES ('T392', 'E6', 'Normal', 0, 'This ticket grants you acces too all events', 20, True, 'None');