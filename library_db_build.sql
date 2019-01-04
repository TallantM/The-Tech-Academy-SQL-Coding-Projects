use master
drop database library;
go
Create database library;
go
use library

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

INSERT INTO tbl_library_branch
		(branch_name, branch_address)
		VALUES 
		('east', '1234 east ave'),
		('central', '5678 north ave'),
		('sharpstown', '895 grey st'),
		('west', '478 e 27th ave')
	;

CREATE TABLE tbl_borrower (
	borrower_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_borrower
		(borrower_name, borrower_address, borrower_phone)
		VALUES 
		('janiah kramer', '21 w windsor dr', '977-526-5644'),
		('charlie wall', '42 oklahoma lane', '222-354-1235'),
		('drew clayton', '8317 deerfield st', '789-613-7394'),
		('roselyn hall', '9296 w new saddle st', '303-568-9875'),
		('nyla boyd', '53 carson st', '305-985-3020'),
		('alexzander burgess', '6 north myrtle ave', '254-985-0000'),
		('connor werner', '9712 san carlos lane', '780-985-9632'),
		('travis taylor', '9998 tunnel dr', '304-650-9874'),
		('leyla sutton', '44 cooper dr', '452-785-2456'),
		('sharon ray', '751 yukon dr', '606-852-7412')
	;

CREATE TABLE tbl_publisher (
	publisher_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	publisher_name VARCHAR(50) NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_publisher
		(publisher_name, publisher_address, publisher_phone)
		VALUES 
		('a', '123 jacobs wy', '987-858-9952'),
		('b', '678 ute ave', '456-987-2584'),
		('c', '0987 height rd', '254-987-9512'),
		('d', '456 view dr', '687-298-3483')
	;

CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	book_title VARCHAR(50) NOT NULL,
	publisher_id INT NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisher_id)
);

INSERT INTO tbl_book
		(book_title, publisher_id)
		VALUES 
		('the shining', 1),
		('pet sematary', 1),
		('Harry Potter and the Sorcerers Stone', 2),
		('Harry Potter and the Chamber of Secrets', 2),
		('Harry Potter and the Prisoner of Azkaban', 2),
		('Harry Potter and the Goblet of Fire', 2),
		('Harry Potter and the Order of the Phoenix', 2),
		('Harry Potter and the Half-Blood Prince', 2),
		('Harry Potter and the Deathly Hallows', 2),
		('the hobbit', 3),
		('the fellowship of the ring', 3),
		('the two towers', 3),
		('the return of the king', 3),
		('a christmas carol', 4),
		('the lost tribe', 4),
		('mere christianity', 4),
		('the adventures of tom sawyer', 4),
		('hamlet', 4),
		('animal farm', 4),
		('the cat in the hat', 4)
	;

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id),
	branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	amount_copies INT NOT NULL
);

INSERT INTO tbl_book_copies
		(book_id, branch_id, amount_copies)
		VALUES 
		(1, 1, 5),
		(2, 2, 5),
		(3, 3, 5),
		(4, 4, 5),
		(5, 1, 5),
		(6, 2, 5),
		(7, 3, 5),
		(8, 4, 5),
		(9, 1, 5),
		(10, 2, 5),
		(11, 3, 5),
		(12, 4, 5),
		(13, 1, 5),
		(14, 2, 5),
		(15, 3, 5),
		(16, 4, 5),
		(17, 1, 5),
		(18, 2, 5),
		(19, 3, 5),
		(20, 4, 5),
		(1, 1, 5),
		(2, 2, 5),
		(3, 3, 5),
		(4, 4, 5),
		(5, 1, 5),
		(6, 2, 5),
		(7, 3, 5),
		(8, 4, 5),
		(9, 1, 5),
		(10, 2, 5),
		(11, 3, 5),
		(12, 4, 5),
		(13, 1, 5),
		(14, 2, 5),
		(15, 3, 5),
		(16, 4, 5),
		(17, 1, 5),
		(18, 2, 5),
		(19, 3, 5),
		(20, 4, 5)
	;

CREATE TABLE tbl_book_loan (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id),
	branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id),
	borrower_id INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(borrower_id),
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
);

INSERT INTO tbl_book_loan
		(book_id, branch_id, borrower_id, date_out, date_due)
		VALUES 
		(1, 2, 1, '7/18/2018', '7/25/2018'),
		(2, 2, 2, '7/18/2018', '7/25/2018'),
		(3, 3, 3, '12/7/2018', '12/14/2018'),
		(4, 4, 4, '7/21/2018', '7/28/2018'),
		(5, 1, 5, '9/12/2018', '9/19/2018'),
		(6, 2, 6, '8/22/2018', '8/29/2018'),
		(7, 3, 7, '10/18/2018', '10/25/2018'),
		(8, 4, 8, '11/8/2018', '11/15/2018'),
		(9, 1, 9, '8/29/2018', '9/5/2018'),
		(10, 2, 10, '7/19/2018', '7/26/2018'),
		(11, 3, 1, '11/4/2018', '11/11/2018'),
		(12, 4, 2, '11/3/2018', '11/10/2018'),
		(13, 1, 3, '12/3/2018', '12/10/2018'),
		(14, 2, 4, '10/12/2018', '10/19/2018'),
		(15, 3, 5, '8/10/2018', '8/17/2018'),
		(16, 4, 6, '10/13/2018', '10/20/2018'),
		(17, 1, 7, '12/10/2018', '12/17/2018'),
		(18, 2, 8, '10/9/2018', '10/16/2018'),
		(19, 3, 9, '12/11/2018', '12/18/2018'),
		(20, 4, 10, '8/17/2018', '8/24/2018'),
		(1, 1, 1, '12/2/2018', '12/9/2018'),
		(2, 2, 2, '7/17/2018', '7/24/2018'),
		(3, 3, 3, '10/30/2018', '11/6/2018'),
		(4, 4, 4, '10/2/2018', '10/9/2018'),
		(5, 1, 5, '7/23/2018', '7/30/2018'),
		(6, 2, 6, '12/12/2018', '12/19/2018'),
		(7, 3, 7, '9/13/2018', '9/20/2018'),
		(8, 4, 8, '9/26/2018', '10/3/2018'),
		(9, 1, 9, '9/5/2018', '9/12/2018'),
		(10, 2, 10, '11/23/2018', '11/30/2018'),
		(11, 3, 1, '9/29/2018', '10/6/2018'),
		(12, 4, 2, '9/28/2018', '10/5/2018'),
		(13, 1, 3, '9/19/2018', '9/26/2018'),
		(14, 2, 4, '6/7/2018', '6/14/2018'),
		(15, 3, 5, '7/10/2018', '7/17/2018'),
		(16, 4, 6, '12/29/2018', '1/5/2019'),
		(17, 1, 7, '11/11/2018', '11/18/2018'),
		(18, 2, 8, '9/9/2018', '9/16/2018'),
		(19, 3, 9, '9/17/2018', '9/24/2018'),
		(20, 4, 10, '9/30/18', '10/7/2018'),
		(15, 3, 1, '1/1/2019', '1/8/2019'),
		(16, 4, 2, '1/1/2019', '1/8/2019'),
		(17, 1, 3, '1/1/2019', '1/8/2019'),
		(18, 2, 4, '1/2/2019', '1/9/2019'),
		(19, 3, 5, '1/2/2019', '1/9/2019'),
		(20, 4, 6, '1/2/2019', '1/9/2019'),
		(1, 1, 7, '1/3/2019', '1/10/2019'),
		(2, 2, 8, '1/3/2019', '1/10/2019'),
		(3, 3, 9, '1/3/2019', '1/10/2019'),
		(4, 4, 10, '1/2/2019', '1/9/2019'),
		(18, 2, 10, '1/2/2019', '1/9/2019'),
		(19, 3, 9, '1/2/2019', '1/9/2019')
	;

CREATE TABLE tbl_author (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_book(book_id),
	author_name VARCHAR(50) NOT NULL,
);

INSERT INTO tbl_author
		(book_id, author_name)
		VALUES 
		(1, 'stephen king'),
		(10, 'j.k. rowling'),
		(14, 'charles dickens'),
		(3, 'j.r.r. tolkien'),
		(16, 'c.s. lewis'),
		(17, 'mark twain'),
		(18, 'william shakespeare'),
		(14, 'charles dickens'),
		(20, 'dr. seuss'),
		(19, 'george orwell'),
		(4, 'j.r.r. tolkien'),
		(5, 'j.r.r. tolkien'),
		(6, 'j.r.r. tolkien'),
		(7, 'j.r.r. tolkien'),
		(8, 'j.r.r. tolkien'),
		(9, 'j.r.r. tolkien'),
		(2, 'stephen king'),
		(11, 'j.k. rowling'),
		(12, 'j.k. rowling'),
		(13, 'j.k. rowling'),
		(15, 'matthew caldwell')
	;

use library
go
--Procedure 1
create procedure dbo.uspLostTribeSharpstown
as
select count(tbl_book.book_title)
from tbl_library_branch 
inner join tbl_book_loan on tbl_library_branch.branch_id = tbl_book_loan.branch_id
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
where book_title = 'the lost tribe' and branch_name = 'sharpstown'

--Procedure 2
create procedure dbo.uspLostTribeCopies
as
select tbl_book.book_title, tbl_library_branch.branch_name, tbl_book_copies.amount_copies
from tbl_library_branch 
inner join tbl_book_loan on tbl_library_branch.branch_id = tbl_book_loan.branch_id
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
inner join tbl_book_copies on tbl_book.book_id = tbl_book_copies.book_id
where book_title = 'the lost tribe'

--Procedure 3 -I do not know how to write this query
create procedure dbo.uspNoCheckouts
as
select tbl_borrower.borrower_name
from tbl_borrower
inner join tbl_book_loan on tbl_borrower.borrower_id = tbl_book_loan.borrower_id
where date_due < '1/3/2019'

--Procedure 4
create procedure dbo.uspSharpstownDue
as
select tbl_book.book_title, tbl_borrower.borrower_name, tbl_borrower.borrower_address
from tbl_book_loan
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
inner join tbl_borrower on tbl_book_loan.borrower_id = tbl_borrower.borrower_id
where date_due = '1/3/2019'
;

--Procedure 5
create procedure dbo.uspLoanTotals
as
select tbl_library_branch.branch_name, count(tbl_book_loan.book_id)
from tbl_library_branch 
inner join tbl_book_loan on tbl_library_branch.branch_id = tbl_book_loan.branch_id
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
where date_due >= '1/3/2019'
group by tbl_library_branch.branch_name

--Procedure 6
create procedure dbo.uspMoreThanFiveBooks
as
select tbl_borrower.borrower_name, tbl_borrower.borrower_address, count(tbl_book_loan.book_id)
from tbl_book_loan
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
inner join tbl_borrower on tbl_book_loan.borrower_id = tbl_borrower.borrower_id
where count(tbl_book_loan.book_id) > 5
;

--Procedure 7
create procedure dbo.uspLostTribeSharpstown
as
select count(tbl_book.book_title)
from tbl_library_branch 
inner join tbl_book_loan on tbl_library_branch.branch_id = tbl_book_loan.branch_id
inner join tbl_book on tbl_book_loan.book_id = tbl_book.book_id
where book_title = 'the lost tribe' and branch_name = 'sharpstown'