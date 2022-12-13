-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database f2f_db;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on f2f_db.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use f2f_db;

-- Put your DDL 
CREATE TABLE customer (
    customerID VARCHAR(10) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    gender VARCHAR(10),
    email VARCHAR(30),
    shipID VARCHAR(30),
    budgetID VARCHAR(10),
    storeID VARCHAR(10),
    priorityID VARCHAR(10)
);

INSERT INTO customer
(customerID, first_name, last_name, age, gender, email, shipID, budgetID, storeID, priorityID)
VALUES
('11234', 'Shruti', 'Kedharnath', 19, 'Female', 'shkedharnath@gmail.com', '345645', '2', '43456', '23453'),
('53526', 'Kirtana', 'Krishnan', 19, 'Female', 'kirtana.krishnan8@gmail.com', '26475', '3', '72829', '62711');

CREATE TABLE budget (
    budgetID VARCHAR(10) primary key,
    highest INT,
    lowest INT,
    currency VARCHAR(20)
);

INSERT INTO budget
(budgetID, highest, lowest, currency)
VALUES
('3', 150, 10, 'US Dollars'),
('2', 75, 5, 'US Dollars');

CREATE TABLE ship_info (
    shipID VARCHAR(20) primary key,
    street_name VARCHAR(20),
    town VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    zipcode VARCHAR(15),
    invoiceID VARCHAR (10)
);

INSERT INTO ship_info
(street_name, town, state, country, zipcode, invoiceID)
VALUES
('40A Leon St', 'Boston', 'MA', 'USA', '02115', '64758'),
('250 Parker St', 'Boston', 'MA', 'USA', '02115', '63743');

CREATE TABLE ff_store (
    storeID VARCHAR(20) primary key,
    styleID VARCHAR(20),
    priorityID VARCHAR(20)
);

INSERT INTO ff_store
(storeID, styleID, priorityID)
VALUES
('23245', '72282', '33835'),
('36373', '27272', '25178');


CREATE TABLE seller (
    sellerID VARCHAR(5) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    business_name VARCHAR(20),
    business_age INT,
    reviewID VARCHAR(5),
    priceID VARCHAR(1),
    shipID VARCHAR(5),
    invoiceID VARCHAR(5),
    currency VARCHAR(20),
    styleID VARCHAR(5),
    ratingID VARCHAR(5),
    priorityID VARCHAR(5)

);


INSERT INTO seller
(sellerID, first_name, last_name, business_name, business_age, reviewID, priceID,
shipID, invoiceID, currency, styleID, ratingID, priorityID)
VALUES
('12345', 'Manasvini', 'Anjaria', 'GreenClothing', 10, '54321', '2', '12098', '5678', 'dollars', '45676', '3453', '1212'),
('09876', 'Nandini', 'Goyal', 'NandiniFashions', 4, '6784', '3', '12345', '0672', 'euros', '34565', '1298', '4782');


CREATE TABLE issue_info (
    priorityID VARCHAR(5) primary key,
    length INT,
    severity VARCHAR(10),
    contributors VARCHAR(20)

);


INSERT INTO issue_info
(priorityID, length, severity, contributors)
VALUES
('6574', 50, 'moderate', 'Fossil Fuel Industry'),
('4591', 10, 'minor', 'Cities');


CREATE TABLE reviews (
    reviewID VARCHAR(5) primary key,
    rating INT,
    comment VARCHAR(100)

);


INSERT INTO reviews (reviewID, rating, comment)
VALUES
('5123', 5, 'Great clothing!'),
('6781', 2, 'Clothing came with a hole.');



CREATE TABLE environmentalist (
    environmentalistID VARCHAR(5) primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    age INT,
    educationID VARCHAR(5),
    years_of_workExperience INT,
    regionID VARCHAR(5),
    issue_of_interest VARCHAR(100)
);


INSERT INTO environmentalist (
    environmentalistID,
    first_name,
    last_name,
    age,
    educationID,
    years_of_workExperience,
    regionID,
    issue_of_interest)
VALUES
('27282', 'Anisha', 'Singh', 35, '2341', 12, '12398', 'Greenhouse Gas Emissions'),
('456754','Meha', 'Macwan', 50, '5690', 30, '34298', 'Child Labor');


CREATE TABLE education (
    educationID VARCHAR(5) primary key,
    length INT,
    school VARCHAR(100),
    degree VARCHAR(100)

);


INSERT INTO education (educationID,
    length,
    school,
    degree)
VALUES
('12903', 4, 'Northeastern University', 'Bachelors in Environmental Science'),
('34591', 8, 'Harvard University', 'Phd in Environmental Science');


CREATE TABLE ratings (
    regionID VARCHAR(5) primary key,
    sustainabilityID VARCHAR(5),
    affordabilityID VARCHAR(5)
);

INSERT INTO ratings (regionID, sustainabilityID, affordabilityID)
VALUES
('45902', '34098', '46721'),
('45025', '39155', '56782');
