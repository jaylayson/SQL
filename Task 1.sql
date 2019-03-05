CREATE DATABASE IF NOT EXISTS Oktomook;



USE Oktomook;



CREATE TABLE Branch(

	branchNumber INT AUTO_INCREMENT,

	branchName VARCHAR(100) NOT NULL,

	streetNo VARCHAR(20) NOT NULL,

	streetName VARCHAR(100) NOT NULL,

	branchCity VARCHAR(100) NOT NULL,

	branchState VARCHAR(100) NOT NULL,
	numberEmployees INT,

PRIMARY KEY(branchNumber)
);


CREATE TABLE Publisher(

	publisherCode INT AUTO_INCREMENT,

	publisherName VARCHAR(60) NOT NULL,

	publisherCity VARCHAR(100),

	publisherState ENUM('QLD', 'VIC', 'NSW', 'WA', 'TAS', 'NT', 'SA'),

PRIMARY KEY(publisherCode)

);

CREATE TABLE Author(

	authorID INT AUTO_INCREMENT,

	firstName VARCHAR(60) NOT NULL,

	lastName VARCHAR(60) NOT NULL,

PRIMARY KEY(authorID)

);

CREATE TABLE Book(
	ISBN INT(13),

	title VARCHAR(100) NOT NULL,
	publisherCode INT NOT NULL,

	genre ENUM('Non-Fiction', 'Science Fiction', 'Fantasy', 'Crime', 'Mystery', 'Young Adult', 'Romance', 'General Fiction'),

	retailPrice FLOAT(100,2),
	paperback ENUM('TRUE','FALSE') NOT NULL,

PRIMARY KEY(ISBN),

FOREIGN KEY(publisherCode) REFERENCES Publisher(publisherCode)

);

CREATE TABLE Wrote(
	ISBN INT(13) NOT NULL,

	authorID INT NOT NULL,

	sequenceNumber INT,

PRIMARY KEY(ISBN, authorID),

FOREIGN KEY(ISBN) REFERENCES Book(ISBN),
FOREIGN KEY(authorID) REFERENCES Author(authorID)

);


CREATE TABLE Inventory(
	ISBN INT(13) NOT NULL,

	branchNumber INT NOT NULL,

	quantityInStock INT DEFAULT 0,

PRIMARY KEY(ISBN, branchNumber),

FOREIGN KEY(ISBN) REFERENCES Book(ISBN),
FOREIGN KEY(branchNumber) REFERENCES Branch(branchNumber)

);