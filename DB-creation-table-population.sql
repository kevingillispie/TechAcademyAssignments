CREATE DATABASE LibraryBookList;

/****************

 TABLE CREATION

*****************/

USE LibraryBookList;
--USE db_zoo2;

CREATE TABLE Publisher (
	Name NVARCHAR(100) NOT NULL UNIQUE,
	[Address] NVARCHAR(500) NOT NULL,
	Phone NVARCHAR(20) NULL
);

CREATE TABLE Book (
	BookID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Title NVARCHAR(100) NOT NULL,
	PublisherName NVARCHAR(100) NOT NULL CONSTRAINT fk_PublisherName
	FOREIGN KEY REFERENCES Publisher(Name)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE Book_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID 
	FOREIGN KEY REFERENCES Book(BookID) 
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	AuthorName NVARCHAR(100) NOT NULL
);

CREATE TABLE Library_Branch (
	BranchID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	BranchName NVARCHAR(100) NOT NULL,
	[Address] NVARCHAR(500) NOT NULL
);

CREATE TABLE Borrower (
	CardNo INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(500) NOT NULL,
	[Address] NVARCHAR(500) NOT NULL,
	Phone NVARCHAR(20) NOT NULL
);

CREATE TABLE Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookLoanID
	FOREIGN KEY REFERENCES Book(BookID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID
	FOREIGN KEY REFERENCES Library_Branch(BranchID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo
	FOREIGN KEY REFERENCES Borrower(CardNo)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DueDate NVARCHAR(100) NOT NULL
);

CREATE TABLE Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookCopyID
	FOREIGN KEY REFERENCES Book(BookID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchCopyID
	FOREIGN KEY REFERENCES Library_Branch(BranchID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	No_Of_Copies INT NOT NULL
);



/****************

 TABLE POPULATION

*****************/

SELECT * FROM Publisher;

INSERT INTO Publisher
	(Name, [Address], Phone)
	VALUES
	('Bantam', '1745 Broadway, New York, NY 10019', '212-789-9000'),
	('Mongolian Academy of Culturer and Poetry', 'PO Box 998, Ulaanbaatar 14201, Mongolia', '976-11-331208'),
	('Oxford University Press', '198 Madison Avenue, New York, NY 10016', '800-445-9714'),
	('Penguin', '80 Strand, London, WC2R ORL UK', '+44 (0)20 7840 8400'),
	('Riverhead Books', '375 Hudson Street, New York, NY 10014', NULL),
	(concat('St. Martin', char(39), 's Press'), '175 Fifth Avenue, New York, NY 10010', '888-330-8477'),
	(concat('Barron', char(39), 's'), '250 Wireless Blvd, Hauppauge, NY 11788', NULL),
--	(concat('Barron', char(39), 's'), '250 Wireless Blvd, Hauppauge, NY 11788', NULL),
	('HarperCollins', '195 Broadway, New York, NY 10007', NULL),
	('Cambridge', 'Shaftsbury Road, Cambridge, CB2 8BS UK', '+44 (0)1223 358331'),
	(concat('Writer', char(39), 's Digest Books'), 'Cincinnati', '386-246-3372'),
	('Siles Press', '141 North Clark Drive, Unit 1, West Hollywood, CA 90048', '310-205-0665'),
	('Broadway Paperbacks', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Norton', '500 5th Avenue #6, New York, NY 10110', '212-354-5500'),
--	('Norton', '500 5th Avenue #6, New York, NY 10110', '212-354-5500'),
	('Design Studio Press', '5022 Eagle Rock Blvd, Los Angeles, CA 90041', NULL),
	('Little, Brown and Company', '1290 6th Avenue, New York, NY 10104', '212-364-1100'),
	('Atheneum Books for Young Readers', '1230 6th Avenue, New York, NY 10020', '212-698-7000'),
	('Adams Media', '57 Littlefield Street Suite 3, Avon, MA 02322', '508-427-7100'),
	('Butler Books', 'PO Box 7311, Louisville, KY 40257', '502-897-9393'),
	('Scribner', '1230 6th Avenue, New York, NY 10020', '212-698-7000')
;

select * from book;

INSERT INTO Book 
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Bantam'),
	('Stories from the Steppe', 'Mongolian Academy of Culturer and Poetry'),
	('Classics of Modern Political Theory', 'Oxford University Press'),
	('The New Penguin History of the World', 'Penguin'),
	('Woe Is I', 'Riverhead Books'),
	('The Story of Spanish', concat('St. Martin', char(39), 's Press')),
	('501 Spanish Verbs', concat('Barron', char(39), 's')),
	('501 Latin Verbs', concat('Barron', char(39), 's')),
	(concat('Wheelock', char(39), 's Latin'), 'HarperCollins'),
	(concat('A Student', char(39), 's Introduction to English Grammar'), 'Cambridge'),
	('Mastering Online Research', concat('Writer', char(39), 's Digest Books')),
	('The Compete Book of Chess Strategy', 'Siles Press'),
	('End Game', 'Broadway Paperbacks'),
	('Comics and Sequential Art', 'Norton'),
	('Graphic Storytelling and Visual Narrative', 'Norton'),
	('How to Draw', 'Design Studio Press'),
	('The Adventures of Tintin, Vol. 1', 'Little, Brown and Company'),
	('The Fantastic Flying Books of Mr. Morris Lessmore', 'Atheneum Books for Young Readers'),
	('The Big Book of Words You Should Know', 'Adams Media'),
	('Drawing Sentences A Guide to Diagramming', 'Butler Books'),
	('On Writing', 'Scribner')
;

select * from Book_Authors;

INSERT INTO Book_Authors
	(BookID, AuthorName)
	VALUES
	(1,'Foley'),
	(2,'Wickham-Smith'),
	(3,'Cahn'),
	(4,'Roberts'),
	(5,concat('O', char(39), 'Conner')),
	(6,'Nadeau'),
	(7,'Kendris'),
	(8,'Prior'),
	(9,'Wheelock'),
	(10,'Huddleston'),
	(11,'Shaw'),
	(12,'Silman'),
	(13,'Brady'),
	(14,'Eisner'),
	(15,'Eisner'),
	(16,'Robertson'),
	(17,'Herge'),
	(18,'Joyce'),
	(19,'Olsen'),
	(20,'Moutoux'),
	(21,'King')
;

SELECT * FROM Library_Branch;

INSERT INTO Library_Branch
	(BranchName, [Address])
	VALUES
	('Sharpstown', '123 Dull Street'),
	('Central', '987 Outer Circle'),
	('Beachside', '1010 Mountain Court'),
	('Parkridge', '5050 Fieldale Drive')
;

SELECT * FROM Borrower;

INSERT INTO Borrower
	(Name, [Address], Phone)
	VALUES
	('Kilroy', 'Nazi-Occupied France', '800-FUBAR'),
	('Tom Collins', '84 Beacon Street, Boston, MA 02108', '617-227-9605'),
	('Lemony Snickey', '75 Pucker Street, Winnipeg, Canada', ''),
	('PDQ Bach', '12 Tone Strasse, Leipzig, Germany', '1807-1742?'),
	('David Manning', '4080 Overland Ave, Culver City, CA 90232', '310-244-4000'),
	('Borat Sagdiyev','Astana, Kazahkstan, 010015', '+7 7172 86-75309'),
	('Silence Dogood', '12 Holland Park Road, London W14 8LZ, UK', '+44 (0)207 925 1405'),
	('Betty Crocker', '330 University Ave SE, Minneapolis, MN 55414', '763-764-7600'),
	('Samuel Clemens', '351 Farmington Avenue, Hartford, Connecticut 06105', '860-247-0098'),
	('Foghorn Leghorn', concat('1945 Allen', char(39), 's Alley, Charleston, SC 29493'), '843-588-6464')
;

SELECT * FROM Book_Copies;

INSERT INTO Book_Copies
	(BookID, BranchID, No_Of_Copies)
	VALUES
	(1, 1, 2),
	(2, 1, 1),
	(3, 1, 2),
	(4, 1, 4),
	(5, 1, 4),
	(6, 1, 2),
	(7, 1, 4),
	(8, 1, 2),
	(9, 1, 2),
	(10, 1, 3),
	(11, 1, 1),
	(12, 1, 1),
	(13, 1, 1),
	(14, 1, 3),
	(15, 1, 3),
	(16, 1, 4),
	(17, 1, 3),
	(18, 1, 5),
	(19, 1, 2),
	(20, 1, 1),
	(21, 1, 5),
	(1, 2, 3),
	(2, 2, 2),
	(3, 2, 3),
	(4, 2, 5),
	(5, 2, 5),
	(6, 2, 3),
	(7, 2, 5),
	(8, 2, 3),
	(9, 2, 3),
	(10, 2, 4),
	(11, 2, 2),
	(12, 2, 2),
	(13, 2, 2),
	(14, 2, 4),
	(15, 2, 4),
	(16, 2, 5),
	(17, 2, 4),
	(18, 2, 6),
	(19, 2, 3),
	(20, 2, 2),
	(21, 2, 6),
	(1, 3, 2),
	(2, 3, 1),
	(3, 3, 2),
	(4, 3, 4),
	(5, 3, 4),
	(6, 3, 2),
	(7, 3, 4),
	(8, 3, 2),
	(9, 3, 2),
	(10, 3, 3),
	(11, 3, 1),
	(12, 3, 1),
	(13, 3, 1),
	(14, 3, 3),
	(15, 3, 3),
	(16, 3, 4),
	(17, 3, 3),
	(18, 3, 5),
	(19, 3, 2),
	(20, 3, 1),
	(21, 3, 5),
	(1, 4, 2),
	(2, 4, 1),
	(3, 4, 2),
	(4, 4, 4),
	(5, 4, 4),
	(6, 4, 2),
	(7, 4, 4),
	(8, 4, 2),
	(9, 4, 2),
	(10, 4, 3),
	(11, 4, 1),
	(12, 4, 1),
	(13, 4, 1),
	(14, 4, 3),
	(15, 4, 3),
	(16, 4, 4),
	(17, 4, 3),
	(18, 4, 5),
	(19, 4, 2),
	(20, 4, 1),
	(21, 4, 5)
;

SELECT * FROM Book_Loans;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNo, DateOut, DueDate)
	VALUES
	/*(14, 1, 1, GETDATE(), '2017-11-01'),
	(15, 1, 1, GETDATE(), '2017-11-01'),
	(16, 1, 1, GETDATE(), '2017-11-01'),
	(17, 1, 1, GETDATE(), '2017-11-01'),
	(18, 1, 1, GETDATE(), '2017-11-01'),
	(1, 1, 1, GETDATE(), '2017-11-01'),
	(5, 2, 3, GETDATE(), '2017-12-02'),
	(10, 2, 3, GETDATE(), '2017-12-02'),
	(15, 2, 3, GETDATE(), '2017-12-02'),
	(19, 2, 3, GETDATE(), '2017-12-02'),
	(20, 2, 3, GETDATE(), '2017-12-02'),
	(21, 2, 3, GETDATE(), '2017-12-02'),
	(12, 3, 6, GETDATE(), '2017-10-11'),
	(13, 3, 6, GETDATE(), '2017-10-11'),
	(2, 4, 7, GETDATE(), '2017-09-09'),
	(3, 4, 10, GETDATE(), '2017-08-01'),
	(4, 4, 10, GETDATE(), '2017-08-01'),
	(21, 2, 9, GETDATE(), '2017-08-02'),
	(7, 3, 5, GETDATE(), '2017-12-12')*/
	(8, 1, 8, GETDATE(), '2017-10-01'),
	(9, 1, 8, GETDATE(), '2017-10-01')
;

SELECT * FROM Book
SELECT * FROM Book_Authors
SELECT * FROM Publisher
SELECT * FROM Book_Loans
SELECT * FROM Book_Copies
SELECT * FROM Borrower
SELECT * FROM Library_Branch;