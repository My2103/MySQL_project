CREATE DATABASE contact_information;

USE contact_information;

CREATE TABLE Persons (
	PersonID int PRIMARY KEY,
    PersonName varchar(255),
    PhoneNumber varchar(255),
    Email varchar(255)
);

RENAME TABLE Persons TO Contacts;

ALTER TABLE Contacts 
CHANGE ID Contact_ID VARCHAR(255);

ALTER TABLE Contacts 
CHANGE PersonName FullName VARCHAR(255);

INSERT INTO Contacts (Contact_ID, FullName, PhoneNumber, Email)
VALUES ('1', 'John Smith', '0473518264', 'john@gmail.com'),
	   ('2', 'Sarah Darling', '047143968', 'darling@gmail.com'),
       ('3', 'Alice Won', '0258566185', 'wonalice@gmail.com');

DELETE FROM Contacts WHERE FullName = 'John Smith';

SET SQL_SAFE_UPDATES = 0;

INSERT INTO Contacts (Contact_ID, FullName, PhoneNumber, Email)
VALUES ('4', 'Anne Shirley', '0851296435', 'anne@gmail.com');

UPDATE Contacts
SET FullName = 'Kim Ji Won', Email = 'Jiwon@gmail.com'
WHERE Contact_ID = 2;

SELECT * FROM Contacts;