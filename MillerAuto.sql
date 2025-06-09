# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          MillerAuto                                      #
# ---------------------------------------------------------------------- #

DROP DATABASE IF EXISTS millerauto;

CREATE DATABASE IF NOT EXISTS millerauto;

USE millerauto;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealership"                                                 #
# ---------------------------------------------------------------------- #

CREATE TABLE `Dealership` (
    `DealershipID` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `DealershipName` VARCHAR(50) NOT NULL UNIQUE,
    `Address` VARCHAR(50),
    `Phone` VARCHAR(12)
);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
    `Vin` INTEGER NOT NULL PRIMARY KEY UNIQUE,
    `Year` INTEGER,
    `Make` VARCHAR(50),
    `Model` VARCHAR(50),
    `VehicleType` VARCHAR(20),
    `Color` VARCHAR(20),
    `Odometer` INTEGER,
    `Price` DECIMAL(10,2),
    `Sold` BOOLEAN
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"                                                  #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
`DealershipID` INTEGER,
`Vin` INTEGER,
PRIMARY KEY (`DealershipID`, `Vin`)
);

# ---------------------------------------------------------------------- #
# Add table "Sales Contract"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `SalesContract` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Vin` INTEGER UNIQUE,
    `CustomerName` VARCHAR(100),
    `CustomerEmail` VARCHAR(100),
    `Date` DATE,
    `TotalPrice` DECIMAL(10,2),
    `MonthlyPayment` DECIMAL(10,2),
    `IsFinanced` BOOLEAN    
);

# ---------------------------------------------------------------------- #
# Add table "Leasae Contract"                                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `LeaseContract` (
    `ID` INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Vin` INTEGER UNIQUE,
    `CustomerName` VARCHAR(100),
    `CustomerEmail` VARCHAR(100),
    `Date` DATE,
    `TotalPrice` DECIMAL(10,2),
    `MonthlyPayment` DECIMAL(10,2)
);

# ---------------------------------------------------------------------- #
# Add info into "Dealership"                                             #
# ---------------------------------------------------------------------- #

INSERT INTO Dealership (DealershipID, DealershipName, Address, Phone)
VALUES
(null, 'Miller & Sons Used Cars', '123 My Way Pkwy', '972-0076545'),
(null, 'Miller Luxury Automotives', '111 Midas Touch Ave', '214-1116545');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               #
# ---------------------------------------------------------------------- #

INSERT INTO Vehicles (Vin, `Year`, Make, Model, VehicleType, Color, Odometer, Price, Sold)
VALUES
(10112, 1993, 'Ford', 'Explorer', 'SUV', 'Red', 525123, 955.00, False),
(37846, 2001, 'Ford', 'Ranger', 'Truck', 'Yellow', 172544, 1955.00, False),
(44901, 2012, 'Honda', 'Civic', 'SUV', 'Gray', 103221, 6955.00, False),
(90901, 2025, 'Nissan', 'Altima', 'Sedan', 'Black', 20000, 35000.00, False),
(11177, 2025, 'Ford', 'Mustang', 'Coupe', 'Red', 100, 50000.00, True),
(11111, 2025, 'Porsche', '911 Carrera', 'Coupe', 'Red', 100, 122095.00, True);

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #

INSERT INTO Inventory (DealershipID, Vin)
VALUES
(1, 10112),
(1, 37846),
(1, 44901),
(1, 90901),
(2, 11111),
(2, 11177);

# ---------------------------------------------------------------------- #
# Add info into "SalesContract"                                          #
# ---------------------------------------------------------------------- #

INSERT INTO SalesContract (ID, Vin, CustomerName, CustomerEmail, `date`, TotalPrice, MonthlyPayment, isFinanced)
VALUES
(null, 11111, 'James Bosley', 'bigbrobosley@gmail.com', '2025-06-01', 122095.00, 0.00, FALSE);

# ---------------------------------------------------------------------- #
# Add info into "LeaseContract"                                          #
# ---------------------------------------------------------------------- #

INSERT INTO LeaseContract (ID, Vin, CustomerName, CustomerEmail, `date`, TotalPrice, MonthlyPayment)
VALUES
(null, 11177, 'Griffin Roberts', 'biggrif@gmail.com', '2025-06-01', 50000.00, 100.00);