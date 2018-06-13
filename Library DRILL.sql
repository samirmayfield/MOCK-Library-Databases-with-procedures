		/* creation of database */


USE MASTER
GO
DROP DATABASE db_library_drill
GO
CREATE DATABASE db_library_drill;
GO
USE db_library_drill


--CREATE PROCEDURE --


			/* creation of tables */

CREATE TABLE tbl_publisher (
	publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL 
);

CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	book_title VARCHAR(50) NOT NULL,
	book_publisher VARCHAR(50) FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,

);


CREATE TABLE tbl_borrowers (
	borrowers_cardno BIGINT PRIMARY KEY NOT NULL,
	borrowers_name VARCHAR(50) NOT NULL,
	borrowers_address VARCHAR(50) NOT NULL, 
	borrowers_phone BIGINT NOT NULL
);



CREATE TABLE tbl_library_branch (
	library_branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	library_branch_name VARCHAR(50) NOT NULL,
	library_branch_address VARCHAR(50) NOT NULL

);


CREATE TABLE tbl_book_authors (
	book_authors_id  INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_authors_name VARCHAR (50) NOT NULL,

);


CREATE TABLE tbl_book_loans (
	book_loans_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_branch_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(library_branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_cardno BIGINT NOT NULL FOREIGN KEY REFERENCES tbl_borrowers(borrowers_cardno) ON UPDATE CASCADE ON DELETE CASCADE,
	book_loans_dateout DATETIME NOT NULL,
	book_loans_duedate DATE NOT NULL
);



CREATE TABLE tbl_book_copies (
	book_copies_book_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_branch_ID INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(library_branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_copies_no_of_copies INT NOT NULL 
);



			/* creation of rows eg INSERT STATMENTS */

INSERT INTO tbl_publisher 
(publisher_Name, publisher_address, publisher_phone)
	VALUES
	('Picador USA', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('Pan Books', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('Allen & Unwin', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('Harvill Secker', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('The Viking Press', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('publisher that is not fake in any way I promise', '123 not-fake st New York, NY 10101', '(800) 221-7945'),
	('F', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('G', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('H', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('I', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('J', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('k', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('L', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('M', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('N', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('O', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('P', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('Q', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('R', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('S', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('T', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('U', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('V', '175 5th Ave, New York, NY 10010', '(800) 221-7945')

	
INSERT INTO tbl_book 
(book_title, book_publisher)
	VALUES
	('The Lost Tribe','Picador USA'),
	('Hitchhikers guide to the galaxy', 'Pan Books'),
	('The Hobbit', 'Allen & Unwin'),
	('1984','The Viking Press'),
	('The Grapes of Wrath','The Viking Press'),
	('To Kill a Mockingbird','The Viking Press'),
	('Lord of the Flies','The Viking Press'),
	('The Odyssey','The Viking Press'),
	('Hamlet','The Viking Press'),
	('The Catcher in the Rye','publisher that is not fake in any way I promise'),
	('Brave New World','publisher that is not fake in any way I promise'),
	('Harry Potter and the Sorcerers stone','publisher that is not fake in any way I promise'),
	('Animal Farm','publisher that is not fake in any way I promise'),
	('Romeo and Juliet','publisher that is not fake in any way I promise'),
	('Of Mice and Men','publisher that is not fake in any way I promise'),
	('The Hunger Games','publisher that is not fake in any way I promise'),
	('Huckleberry Finn','publisher that is not fake in any way I promise'),
	('Crime and Punishment','publisher that is not fake in any way I promise'),
	('The Cat in the Hat','publisher that is not fake in any way I promise'),
	('Where the Sidewalk Ends','publisher that is not fake in any way I promise'),
	('The Outsides','publisher that is not fake in any way I promise'),
	('Tom Sawyer','publisher that is not fake in any way I promise'),
	('The Shining', 'publisher that is not fake in any way I promise'),
	('Berserk', 'publisher that is not fake in any way I promise'),
	('Goodnight PunPun', 'publisher that is not fake in any way I promise'),
	('I, Robot', 'publisher that is not fake in any way I promise'),
	('The Age of Reason', 'publisher that is not fake in any way I promise'),
	('The Time Machine', 'publisher that is not fake in any way I promise'),
	('Do Androids Dream of Electric Sheep', 'publisher that is not fake in any way I promise'),
	('American Gods', 'publisher that is not fake in any way I promise'),
	('The Martian', 'publisher that is not fake in any way I promise'),
	('Fullmetal Alchemist', 'publisher that is not fake in any way I promise'),
	('Monster', 'publisher that is not fake in any way I promise'),
	('One Piece', 'publisher that is not fake in any way I promise'),
	('A Silent Voice', 'publisher that is not fake in any way I promise'),
	('Akira', 'publisher that is not fake in any way I promise'),
	('Nana', 'publisher that is not fake in any way I promise'),
	('Hunter x Hunter', 'publisher that is not fake in any way I promise'),
	('Flowers of Evil', 'publisher that is not fake in any way I promise'),
	('Welcome to the NHK', 'publisher that is not fake in any way I promise'),
	('For Bread Alone', 'publisher that is not fake in any way I promise'),
	('Yu Yu Hakusho', 'publisher that is not fake in any way I promise'),
	('Bleach', 'publisher that is not fake in any way I promise'),
	('Dragon Ball', 'publisher that is not fake in any way I promise')



INSERT INTO tbl_book_authors
	(book_authors_id,book_authors_name)
	VALUES
	(1,'Mark Lee'),
	(2,'Douglas Adams'),
	(3,'J.R.R. Tolkien'),
	(4,'George Orwell'),
	(5,'John Steinbeck'),
	(6,'Harper Lee'),
	(7,'William Golding'),
	(8,'Homer'),
	(9,'Willam Shakespeare'),
	(10,'J.D. Salinger'),
	(11,'Aldous Huxley'),
	(12,'J.K. Rowling'),
	(13,'George Orwell'),
	(14,'Willam Shakespeare'),
	(15,'John Steinbeck'),
	(16,'Suzanne Collins'),
	(17,'Mark Twain'),
	(18,'Fyodor dostoyevsky'),
	(19,'Dr. Seuss'),
	(20,'Shel Silverstein'),
	(21,'S.E. Hinton'),
	(22, 'Mark Twain'),
	(23, 'Stephen King'),
	(24, 'Kentaro Miura'),
	(25, 'Inio Asano'),
	(26, 'Isaac Asimov'),
	(27, 'Thomas Paine'),
	(28, 'H.G. Wells'),
	(29, 'Phillip K. Dick'),
	(30, 'Neil Gaiman'),
	(31, 'Andy Weir'),
	(32, 'Hiromu Arakawa'),
	(33, 'Naoki Urasawa'),
	(34, 'Eiichiro Oda'),
	(35, 'Yoshoitoki Ooima'),
	(36, 'Katsuhiro Otomo'),
	(37, 'Ai Yazawa'),
	(38, 'Yoshihiro Togashi'),
	(39, 'Shuzo Oshimi'),
	(40, 'Tatsuhiko Takimoto'),
	(41, 'Mohamed Choukri'),
	(42, 'Yoshihiro Togashi'),
	(43, 'Tite Kubo'),
	(44, 'Akira Toriyama')


	
	INSERT INTO tbl_library_branch
	(library_branch_name, library_branch_address)
	VALUES
	('North Branch', '1000 4th Ave, Seattle, WA 98104'),
	('West Branch', '100 Larkin St, San Francisco, CA 94102'),
	('Central', '101 Independence Ave SE, Washington, DC 20540'),
	('Sharpstown', '205 West 14th Street, Austin, TX 78701')
	

	
	INSERT INTO tbl_book_copies
	(book_copies_book_ID, book_copies_branch_ID, book_copies_no_of_copies)
	VALUES
	(1, 2, 5),
	(2, 2, 5),
	(3, 2, 5),
	(4, 2, 5),
	(5, 2, 5),
	(6, 2, 5),
	(7, 2, 5),
	(8, 2, 5),
	(9, 2, 5),
	(10, 2, 5),
	(11, 1, 5),
	(12, 1, 5),
	(13, 1, 5),
	(14, 1, 5),
	(15, 1, 5),
	(16, 1, 5),
	(17, 1, 5),
	(18, 1, 5),
	(19, 1, 5),
	(20, 1, 5),
	(21, 1, 5),
	(22, 3, 5),
	(23, 3, 5),
	(24, 3, 5),
	(25, 3, 5),
	(26, 3, 5),
	(27, 3, 5),
	(28, 3, 5),
	(29, 3, 5),
	(30, 3, 5),
	(31, 3, 5),
	(32, 3, 5),
	(33, 4, 5),
	(34, 4, 5),
	(35, 4, 5),
	(36, 4, 5),
	(37, 4, 5),
	(38, 4, 5),
	(39, 4, 5),
	(40, 4, 5),
	(41, 4, 5),
	(42, 4, 5),
	(43, 4, 5),
	(44, 4, 5)

	
	
	INSERT INTO tbl_borrowers 
	(borrowers_cardno, borrowers_name, borrowers_address, borrowers_phone)
	VALUES
	(7901155514567697, 'Victor Lacey', '24 East Primrose St. Lake Jackson TX 77566', 2515469442),
	(6569808243579751, 'Tobin Leyton', '834 East Lincoln Ave. York, PA 17402', 1255464478),
	(3849808564738751, 'Justin Kendal', '9284 Oak Meadow Lane Jenison, MI 49428', 9495694371),
	(7483747294065847, 'Prudence Carlisle', '85 Grand Lane Garden City, NY 11530', 6304468851),
	(5728264738291038, 'Harper Elwes', '7607 Holly St. Dekalb, IL 60115', 2269062721),
	(9827348762346512, 'Claude Dyer', '9827 Sunbeam Drive Freeport, NY 11520', 6729251352),
	(7634768237623768, 'Harlow Tirrell', '27 Silver Spear Dr. Winter Garden, FL 34787', 8402770241),
	(8924789373478345, 'Lindsay Althaus', '860 North Mountainview Rd. Brockton, MA 02301', 7618569283),
	(5641238736475648, 'Rayyan Abel', '659 Prince Avenue Glen Allen, VA 23059', 9752733860),
	(0980989879878767, 'Leslie Guinness', '349 Newport Street Manitowoc, WI 54220', 6501594192),
	(7682347682347689, 'Agam Conti', '9278 Bellevue Ave. Drexel Hill, PA 19026', 2754700347),
	(9879879878768767, 'Hadar Franco', '357 Paris Hill Dr. Kent, OH 44240', 7736713150),
	(1230982349877567, 'Hilary Jeffries', '361 Sage St. Los Angeles, CA 90008', 2863466930),
	(7623762384634562, 'Taylor Earls', '140 SW. Bradford Street Beloit, WI 53511', 1915979830),
	(6782356729374637, 'Lacy Geissler', '489 W. Vermont Lane Bountiful, UT 84010', 6915127673),
	(6345346345272278, 'Ora Kuhn', '43 St Louis St. Indianapolis, IN 46201', 5316738669),
	(7689494756483930, 'Dale Green', '7411 Lakeshore Rd. Xenia, OH 45385', 8908802576)

	
	INSERT INTO tbl_book_loans
	(book_loans_id, book_loans_branch_ID, Book_loans_cardno, Book_loans_dateout, Book_loans_duedate)
	VALUES
	(1, 2,7901155514567697, '2017-01-01 12:30:30', '2017-02-01'),
	(1, 2,7901155514567697, '2017-01-01 12:30:30', '2017-02-01'),
	(1, 2,7901155514567697, '2017-01-01 12:30:30', '2017-02-01'),
	(1, 2,7901155514567697, '2017-01-01 12:30:30', '2017-02-01'),
	(1, 2,7901155514567697, '2017-01-01 12:30:30', '2017-02-01'),
	(38, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(38, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(38, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(38, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(38, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(35, 4,7689494756483930, '2017-01-04 09:27:46', '2017-02-04'),
	(25, 3,7634768237623768, '2017-01-05 12:41:18', '2017-02-05'),
	(25, 3,7634768237623768, '2017-01-05 12:41:18', '2017-02-05'),
	(25, 3,7634768237623768, '2017-01-05 12:41:18', '2017-02-05'),
	(25, 3,7634768237623768, '2017-01-05 12:41:18', '2017-02-05'),
	(7, 2,3849808564738751, '2017-01-05 17:05:55', '2017-02-05'),
	(5, 2,3849808564738751, '2017-01-05 17:05:55', '2017-02-05'),
	(8, 2,3849808564738751, '2017-01-05 17:05:55', '2017-02-05'),
	(10, 2,3849808564738751, '2017-01-05 17:05:55', '2017-02-05'),
	(25, 3,9879879878768767, '2017-01-10 11:25:30', '2017-02-10'),
	(26, 3,9879879878768767, '2017-01-10 11:25:30', '2017-02-10'),
	(27, 3,9879879878768767, '2017-01-10 11:25:30', '2017-02-10'),
	(28, 3,9879879878768767, '2017-01-10 11:25:30', '2017-02-10'),
	(29, 3,9879879878768767, '2017-01-10 11:25:30', '2017-02-10'),
	(2, 2,6569808243579751, '2017-01-11 12:17:12', '2017-02-12'),
	(22, 3,7483747294065847, '2017-01-13 08:27:35', '2017-02-13'),
	(23, 3,7483747294065847, '2017-01-13 08:27:35', '2017-02-13'),
	(24, 3,7483747294065847, '2017-01-13 08:27:35', '2017-02-13'),
	(25, 3,7483747294065847, '2017-01-13 08:27:35', '2017-02-13'),
	(26, 3,7483747294065847, '2017-01-13 08:27:35', '2017-02-13'),
	(2, 2,5728264738291038, '2017-01-18 14:25:43', '2017-02-18'),
	(3, 2,5728264738291038, '2017-01-18 14:25:43', '2017-02-18'),
	(4, 2,5728264738291038, '2017-01-18 14:25:43', '2017-02-18'),
	(5, 2,5728264738291038, '2017-01-18 14:25:43', '2017-02-18'),
	(6, 2,5728264738291038, '2017-01-18 14:25:43', '2017-02-18'),
	(5, 2,9827348762346512, '2017-01-21 15:01:53', '2017-02-21'),
	(6, 2,9827348762346512, '2017-01-21 15:01:53', '2017-02-21'),
	(9, 2,9827348762346512, '2017-01-21 15:01:53', '2017-02-21'),
	(11, 1,8924789373478345, '2017-01-25 11:43:32', '2017-02-25'),
	(12, 1,8924789373478345, '2017-01-25 11:43:32', '2017-02-25'),
	(13, 1,8924789373478345, '2017-01-25 11:43:32', '2017-02-25'),
	(14, 1,8924789373478345, '2017-01-25 11:43:32', '2017-02-25'),
	(15, 1,8924789373478345, '2017-01-25 11:43:32', '2017-02-25'),
	(16, 1,5641238736475648, '2017-01-25 12:28:33', '2017-02-25'),
	(17, 1,5641238736475648, '2017-01-25 12:28:33', '2017-02-25'),
	(18, 1,5641238736475648, '2017-01-25 12:28:33', '2017-02-25'),
	(43, 4,0980989879878767, '2017-01-27 16:11:42', '2017-02-27'),
	(42, 4,0980989879878767, '2017-01-27 16:11:42', '2017-02-27'),
	(44, 4,7682347682347689, '2017-01-28 12:18:30', '2017-02-28'),
	(43, 4,7682347682347689, '2017-01-28 12:18:30', '2017-02-28'),
	(42, 4,7682347682347689, '2017-01-28 12:18:30', '2017-02-28'),
	(41, 4,7682347682347689, '2017-01-28 12:18:30', '2017-02-28'),
	(4, 2,1230982349877567, '2017-01-28 12:37:39', '2017-02-28'),
	(5, 2,1230982349877567, '2017-01-28 12:37:39', '2017-02-28'),
	(38, 4,6782356729374637, '2017-01-29 11:54:25', '2017-03-01'),
	(34, 4,6782356729374637, '2017-01-30 08:21:46', '2017-03-02'),
	(33, 4,6782356729374637, '2017-01-30 08:21:46', '2017-03-02'),
	(36, 4,6345346345272278, '2017-01-31 10:40:10', '2017-03-03'),
	(37, 4,6345346345272278, '2017-05-08 10:40:10', '2017-06-08')




			/* the protion that for the stored procedures */
			




			/*********************************
			1. on stored proc
			**********************************/




			
SELECT book_title, book_copies_no_of_copies
FROM tbl_book
	INNER JOIN tbl_book_copies ON tbl_book.book_id = tbl_book_copies.book_copies_book_ID
	INNER JOIN tbl_library_branch ON tbl_book_copies.book_copies_branch_ID = tbl_library_branch.library_branch_id
WHERE book_title = 'the lost tribe'
	AND   
	library_branch_name = 'Sharptown'      -- Nothing in my Database fits this Select statement, so table has no rows --



	
			/*********************************
			2. on stored proc
			**********************************/
	
	
		
SELECT book_title, book_copies_branch_ID, library_branch_name, book_copies_no_of_copies
FROM tbl_book
	INNER JOIN tbl_book_copies ON tbl_book.book_id = tbl_book_copies.book_copies_book_ID
	INNER JOIN tbl_library_branch ON tbl_book_copies.book_copies_branch_ID = tbl_library_branch.library_branch_id
WHERE book_title = 'the lost tribe'
	

			
			
			/*********************************
			3. on stored proc
			**********************************/
			
		
SELECT borrowers_name, book_loans_id
FROM tbl_borrowers
	FULL OUTER JOIN tbl_book_loans ON tbl_borrowers.borrowers_cardno = tbl_book_loans.book_loans_cardno
	WHERE book_loans_branch_ID IS NULL

	


			/*********************************
			4. on stored proc
			**********************************/			
			
			
			
		
SELECT book_title, borrowers_name, borrowers_address,book_loans_dateout ,book_loans_duedate
FROM tbl_book_loans
	INNER JOIN tbl_book ON tbl_book_loans.book_loans_id = tbl_book.book_id
	INNER JOIN tbl_borrowers ON tbl_book_loans.book_loans_cardno = tbl_borrowers.borrowers_cardno
	INNER JOIN tbl_library_branch ON tbl_book_loans.book_loans_branch_ID = tbl_library_branch.library_branch_id
WHERE library_branch_name = 'sharpstown' 
	and
	book_loans_duedate = '2017-06-08' --this query will have to be changed in the future if you want a current date --
	




		/*********************************
			5. on stored proc
			**********************************/			
			

	
SELECT COUNT (library_branch_name), library_branch_name
FROM tbl_library_branch
	INNER JOIN tbl_book_loans ON tbl_library_branch.library_branch_id = tbl_book_loans.book_loans_branch_ID
	GROUP BY library_branch_name


		/*********************************
			6. on stored proc
		**********************************/
		
		
SELECT COUNT(tbl_book_loans.book_loans_cardno) AS Number_of_books_borrowed , borrowers_name AS Name, borrowers_address AS Address
FROM tbl_book_loans
	INNER JOIN tbl_borrowers ON tbl_book_loans.book_loans_cardno = tbl_borrowers.borrowers_cardno 
	GROUP BY book_loans_cardno , borrowers_name, borrowers_address 
	HAVING COUNT(book_loans_cardno)  > 5
	 

		
		/*********************************
			7. on stored proc
		**********************************/


SELECt book_title, book_copies_no_of_copies, book_authors_name
FROM tbl_book
	INNER JOIN tbl_book_authors ON tbl_book.book_id = tbl_book_authors.book_authors_id
	INNER JOIN tbl_book_copies ON tbl_book.book_id = tbl_book_copies.book_copies_book_ID
	INNER JOIN tbl_library_branch ON tbl_book_copies.book_copies_branch_ID = tbl_library_branch.library_branch_id
	WHERE book_authors_name = 'Stephen King'
	AND
	library_branch_name = 'Central'
					
			

		/*********************************
		Saved queries for quick access put here
		
	
	SELECT * FROM tbl_book_loans
	
	SELECT * FROM tbl_book

	SELECT * FROM tbl_borrowers

	SELECT * FROM tbl_book_copies
	
	SELECT * FROM tbl_book_authors
		INNER JOIN tbl_book ON tbl_book_authors.book_authors_id = tbl_book.book_id
		
	SELECT * FROM tbl_library_branch 
		
	SELECT * FROM tbl_publisher 
		

		INNER JOIN tbl_library_branch ON tbl_book_copies.book_copies_branch_ID = tbl_library_branch.library_branch_id
WHERE book_title = 'the lost tribe'
		
			INNER JOIN tbl_publisher ON tbl_book.book_publisher = tbl_publisher.publisher_Name
		
		**********************************/