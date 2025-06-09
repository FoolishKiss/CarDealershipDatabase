-- 1. Get all dealerships

USE
	millerauto;

SELECT
	*

FROM
	dealership;
    
-- 2. Find all vehicles for a specific dealership

USE
	millerauto;

SELECT
	I.DealershipID,
	I.vin,
    V.year,
    V.make,
    V.model

FROM
	inventory I
    Join vehicles V on (V.vin = I.vin)
    
WHERE
	DealershipID = 1;
    
-- 3. Find a car by VIN

USE
	millerauto;

SELECT
	*
    
FROM
	vehicles V
    
WHERE
	vin = 10112;
    
-- 4. Find the dealership where a certain car is located, by VIN

USE
	millerauto;

SELECT
	V.vin,
    V.make,
    V.model,
    D.address as 'Car Location'
    
FROM
	vehicles V
    Join inventory I on (I.vin = V.vin)
    Join dealership D on(D.DealershipID = I.DealershipID)
    
WHERE
	V.vin = 10112;
    
-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)

USE
	millerauto;

SELECT
	V.vin,
    V.make,
    V.model,
    D.dealershipName
    
FROM
	vehicles V
    Join inventory I on (I.vin = V.vin)
    Join dealership D on(D.DealershipID = I.DealershipID)
    
WHERE
	V.VehicleType = 'Coupe';
    
-- 6. Get all sales information for a specific dealer for a specific date range

USE
	millerauto;

SELECT
	*
    
FROM
	salescontract S
    
WHERE
	S.Date 
		between '2025-01-01' and '2025-06-01';