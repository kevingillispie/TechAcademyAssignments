/*****************

 STORED PROCEDURES

******************/

-- No. 1
USE LibraryBookList;

CREATE PROC getLostTribeQuantitySharpstown
@bookID INT
AS

BEGIN

	SELECT BookID 'The Lost Tribe', BranchID 'Sharpstown', No_Of_Copies 'Quantity'
		FROM Book_Copies t2
		WHERE BranchID = 1 
		AND BookID = @bookID
	;
END

-- No. 2
CREATE PROC getBookQuantitySharpstown
AS

BEGIN
	SELECT BookID 'The Lost Tribe', BranchID 'Branch', No_Of_Copies 'Quantity' 
		FROM Book_Copies
		WHERE BookID = 1
	;
END


-- No. 3
CREATE PROC getBooklessBorrowers
AS

BEGIN
	SELECT * FROM Borrower
		WHERE CardNo NOT IN 
		(SELECT CardNo FROM Book_Loans)
	;
END

-- No. 4
CREATE PROC getDueTodaySharpstown
AS

BEGIN
	SELECT t5.Name, t5.[Address], t1.Title FROM Borrower t5
		INNER JOIN Book_Loans t4 ON t4.CardNo = t5.CardNo
		INNER JOIN Book t1 on t1.BookID = t4.BookID 
	
		WHERE t4.BranchID = 1
		AND t4.DueDate = GETDATE()
	;
END

-- No. 5
CREATE PROC getTotalBooksLoaned
@branchID INT
AS

BEGIN
	SELECT (SELECT BranchName FROM Library_Branch WHERE BranchID = @branchID), COUNT(*) 
		FROM Book_Loans t4
		INNER JOIN Library_Branch t6 ON t6.BranchID = @branchID
		WHERE t4.BranchID = @branchID
	;
END

-- No. 6
CREATE PROC getBookHoarders
AS

BEGIN
	SELECT t5.Name, t5.[Address], COUNT(t4.CardNo) 
		FROM Borrower t5
		JOIN Book_Loans t4 ON t4.CardNo = t5.CardNo
		GROUP BY t5.CardNo, t5.Name, t5.[Address]
		HAVING COUNT(*) > 5
	;
END


-- No. 7
CREATE PROC getKingBooksCentral
AS

BEGIN
	SELECT t1.Title, t2.AuthorName AS Author, t3.No_Of_Copies AS Quantity 
		FROM Book t1
		JOIN Book_Copies t3 ON t3.BookID = t1.BookID
		JOIN Book_Authors t2 ON t2.BookID = t1.BookID
		WHERE t2.AuthorName = 'King'
		AND t3.BranchID = 2
	;
END

