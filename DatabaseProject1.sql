-- Create Database
CREATE DATABASE LIBRARYMANAGEMENTSYSTEM;
USE LIBRARYMANAGEMENTSYSTEM;

-- Create Patron Table
CREATE TABLE Patron (
    PatronID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    MembershipDate DATE,
    StaffID INT,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

-- Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Create Book Table
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(100),
    ISBN VARCHAR(20),
    Publisher VARCHAR(100),
    PublicationYear INT,
    Genre VARCHAR(50),
    CopiesAvailable INT,
    CategoryID INT,
    StaffID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- Create Loan Table
CREATE TABLE Loan (
    LoanID INT PRIMARY KEY,
    PatronID INT,
    BookID INT,
    StaffID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatronID) REFERENCES Patron(PatronID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
-- Insert Data into Staff
INSERT INTO Staff (StaffID, Name, Position, Email, PhoneNumber) VALUES
(1, 'Mesfin Assefa', 'Librarian', 'mesfin@example.com', '0912345684'),
(2, 'Selamawit Abebe', 'Assistant Librarian', 'selamawit@example.com', '0912345685'),
(3, 'Getachew Tadesse', 'Library Technician', 'getachew@example.com', '0912345686'),
(4, 'Marta Alemayehu', 'Library Assistant', 'marta@example.com', '0912345687'),
(5, 'Yared Bekele', 'Archivist', 'yared@example.com', '0912345688'),
(6, 'Betelhem Tesfaye', 'Cataloger', 'betelhem@example.com', '0912345689'),
(7, 'Daniel Yohannes', 'Library Manager', 'daniel@example.com', '0912345690'),
(8, 'Hanna Demeke', 'Library Assistant', 'hanna@example.com', '0912345691'),
(9, 'Solomon Asfaw', 'Library Clerk', 'solomon@example.com', '0912345692'),
(10, 'Muluwork Kebede', 'Library Archivist', 'muluwork@example.com', '0912345693');

-- Insert Data into Patron
INSERT INTO Patron (PatronID, Name, Address, PhoneNumber, Email, MembershipDate, StaffID) VALUES
(1, 'Mikias Mulu', 'Addis Ababa', '0912345678', 'mikias@example.com', '2023-01-01', 1),
(2, 'Blen Tegegnework', 'Bahir Dar', '0912345679', 'blen@example.com', '2023-02-01', 1),
(3, 'Hilina Asres', 'Gondar', '0912345680', 'hilina@example.com', '2023-03-01', 2),
(4, 'Samuel Terefe', 'Hawassa', '0912345681', 'samuel@example.com', '2023-04-01', 2),
(5, 'Latjor Simon Kang', 'Jimma', '0912345682', 'latjor@example.com', '2023-05-01', 3),
(6, 'Kebede Alemayehu', 'Dire Dawa', '0912345683', 'kebede@example.com', '2023-06-01', 3),
(7, 'Nardos Yonas', 'Mekele', '0912345694', 'nardos@example.com', '2023-07-01', 4),
(8, 'Eyob Habte', 'Adama', '0912345695', 'eyob@example.com', '2023-08-01', 5),
(9, 'Selam Fikru', 'Harar', '0912345696', 'selam@example.com', '2023-09-01', 6),
(10, 'Tinsae Alemu', 'Hosaena', '0912345697', 'tinsae@example.com', '2023-10-01', 7);

-- Insert Data into Category
INSERT INTO Category (CategoryID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History'),
(5, 'Biography'),
(6, 'Children'),
(7, 'Technology'),
(8, 'Philosophy'),
(9, 'Self-Help'),
(10, 'Health');
-- Insert Data into Book
INSERT INTO Book (BookID, Title, Author, ISBN, Publisher, PublicationYear, Genre, CopiesAvailable, CategoryID, StaffID) VALUES
(1, 'Fikir Eske Mekabir', 'Haddis Alemayehu', '978-99944-2-000-0', 'Addis Ababa University Press', 1965, 'Novel', 5, 1, 1),
(2, 'Oromay', 'Bealu Girma', '978-99944-2-001-7', 'Berhanena Selam', 1983, 'Novel', 3, 1, 2),
(3, 'Dertogada', 'Sahle Sellassie', '978-99944-2-002-4', 'Mega Publishing', 1974, 'Novel', 4, 2, 3),
(4, 'Tobiya', 'Gebreyesus Hailu', '978-99944-2-003-1', 'Addis Ababa University Press', 1949, 'Novel', 2, 3, 4),
(5, 'Ye Guzo', 'Mengistu Lemma', '978-99944-2-004-8', 'Berhanena Selam', 1950, 'Play', 6, 4, 5),
(6, 'The Thirteenth Sun', 'Dagnachew Werku', '978-99944-2-005-5', 'Ethiopian Publishing House', 1976, 'Novel', 4, 1, 1),
(7, 'Ye Kuru Ye Kereba', 'Birhanu Zerihun', '978-99944-2-006-2', 'Kuraz Publishing', 1985, 'Poetry', 7, 2, 2),
(8, 'Ye Hilina Dewel', 'Hama Tuma', '978-99944-2-007-9', 'Mega Publishing', 1992, 'Short Story', 3, 3, 3),
(9, 'The Fugitive', 'Mulugeta Lule', '978-99944-2-008-6', 'Addis Ababa University Press', 1978, 'Novel', 5, 4, 4),
(10, 'Ye Zemenawi Tarik', 'Alemayehu Wase', '978-99944-2-009-3', 'Berhanena Selam', 1969, 'History', 2, 5, 5);
-- Insert Data into Loan
INSERT INTO Loan (LoanID, PatronID, BookID, StaffID, LoanDate, DueDate, ReturnDate, Status) VALUES
(3, 3, 3, 3, '2023-07-10', '2023-07-24', NULL, 'active'),
(4, 4, 4, 4, '2023-07-12', '2023-07-26', NULL, 'active'),
(5, 5, 5, 5, '2023-07-15', '2023-07-29', NULL, 'active'),
(6, 6, 6, 6, '2023-07-18', '2023-08-01', NULL, 'active'),
(7, 7, 7, 7, '2023-08-01', '2023-08-15', NULL, 'active'),
(8, 8, 8, 8, '2023-08-05', '2023-08-19', NULL, 'active'),
(9, 9, 9, 9, '2023-08-10', '2023-08-24', NULL, 'active'),
(10, 10, 10, 10, '2023-08-15', '2023-08-29', NULL, 'active');

-- Select Queries
SELECT * FROM Patron;
SELECT * FROM Category;
SELECT * FROM Staff;
SELECT * FROM Book;
SELECT * FROM Loan;



-----------------------------------------------------------------------------------------------==
------------------------------------------------------------------------------------------------------
--ALL ABOUT TRANSACTION
--Example of a transaction for borrowing a book
BEGIN;
-- Insert a new loan transaction
INSERT INTO Loan (LoanID, PatronID, BookID, StaffID, LoanDate, DueDate, Status) 
VALUES (11, 1, 2, 1, '2023-04-02', '2023-04-16', 'active');
INSERT INTO Loan (LoanID, PatronID, BookID, StaffID, LoanDate, DueDate, Status)
VALUES (12, 2, 3, 2, '2024-04-02', '2024-04-16', 'active');

-- Update the book's availability
UPDATE Book SET CopiesAvailable = CopiesAvailable - 1 WHERE BookID = 2;
UPDATE Book SET CopiesAvailable = CopiesAvailable - 1 WHERE BookID = 3;
-- Select Queries
SELECT * FROM Patron;
SELECT * FROM Category;
SELECT * FROM Staff;
SELECT * FROM Book;
SELECT * FROM Loan;



-----------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--ALL ABOUT INDEXES USING PROCEDURE

-- Creating Indexes for Loan Table
CREATE INDEX idx_loan_patronid ON Loan (PatronID);  -- Optimized naming for clarity
CREATE INDEX idx_loan_bookid ON Loan (BookID);
CREATE INDEX idx_loan_status ON Loan (Status);

-- Creating Indexes for Book Table
CREATE INDEX idx_book_title ON Book (Title);  -- For fast searches by book title
CREATE INDEX idx_book_author ON Book (Author);  -- For fast searches by author name
CREATE INDEX idx_book_isbn ON Book (ISBN);  -- For fast searches by ISBN

-- Creating Indexes for Patron Table
CREATE INDEX idx_patron_id ON Patron (PatronID);
CREATE INDEX idx_patron_email ON Patron (Email);
CREATE INDEX idx_patron_phone ON Patron (PhoneNumber);

-- Displaying all indexes in the database for Loan and Book tables
SELECT 
    i.name AS IndexName,
    t.name AS TableName,
    i.type_desc AS IndexType,
    c.name AS ColumnName
FROM 
    sys.indexes i
JOIN 
    sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
JOIN 
    sys.tables t ON i.object_id = t.object_id
JOIN 
    sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    t.name IN ('Loan', 'Book', 'Patron');  -- Included Patron table for index checking

-- Loan Queries using Indexed Columns
   SELECT * FROM Loan WHERE PatronID = 1;  -- Uses idx_loan_patronid
  SELECT * FROM Loan WHERE Status = 'active';  -- Uses idx_loan_status

-- Book Queries using Indexed Columns
 SELECT * FROM Book WHERE Title LIKE '%Fiker Eske Mekabr%';  -- Uses idx_book_title
 SELECT * FROM Book WHERE Author = 'Haddis Alemayehu';  -- Uses idx_book_author
 SELECT * FROM Book WHERE ISBN = '123-456-789';  -- Uses idx_book_isbn

-- Patron Queries using Indexed Columns
   SELECT * FROM Patron WHERE PatronID = 1;  -- Uses idx_patron_id
   SELECT * FROM Patron WHERE Email = 'mikias@example.com';  -- Uses idx_patron_email
   SELECT * FROM Patron WHERE PhoneNumber = '0912345678';  -- Uses idx_patron_phone


----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
----FUNCTIONS FOR THIS SYSTEM
-- Create Patron Table
-- Create Stored Procedure to Add a Patron
CREATE PROCEDURE AddPatron
(
    @PatronID INT,
    @Name VARCHAR(100),
    @Address VARCHAR(255),
    @PhoneNumber VARCHAR(15),
    @Email VARCHAR(100),
    @MembershipDate DATE,
    @StaffID INT
)
AS
BEGIN
    -- Insert A NEW PATRON
    INSERT INTO Patron (PatronID, Name, Address, PhoneNumber, Email, MembershipDate, StaffID)
    VALUES (@PatronID, @Name, @Address, @PhoneNumber, @Email, @MembershipDate, @StaffID);

    -- Display the newly inserted patron
    SELECT * FROM Patron WHERE PatronID = @PatronID;
END;
GO
-- Execute the procedure to add another patron
EXEC AddPatron
    @PatronID = 11, 
    @Name = 'Alemu Abebe', 
    @Address = '456 Elm St, TownsAzezo', 
    @PhoneNumber = '0923456789', 
    @Email = 'abe.doe@example.com', 
    @MembershipDate = '2025-04-02', 
    @StaffID = 8;
SELECT * FROM Patron WHERE PatronID = 11;
SELECT * FROM Patron;
DELETE FROM Patron WHERE PatronID = 11;
DELETE FROM Patron WHERE PatronID = 12;


-----------------------------------------------------------------------------------------------------------------
-- Create Loan Table
CREATE PROCEDURE AddLoan
(
    @LoanID INT,
    @PatronID INT,
    @BookID INT,
    @StaffID INT,
    @LoanDate DATE,
    @DueDate DATE,
    @Status VARCHAR(20)
)
AS
BEGIN
    
    BEGIN TRANSACTION;

    -- Check if the book is available
    IF EXISTS (SELECT 1 FROM Book WHERE BookID = @BookID AND CopiesAvailable > 0)
    BEGIN
        -- Insert new loan record
        INSERT INTO Loan (LoanID, PatronID, BookID, StaffID, LoanDate, DueDate, Status)
        VALUES (@LoanID, @PatronID, @BookID, @StaffID, @LoanDate, @DueDate, @Status);

        -- Update the availability of the book
        UPDATE Book
        SET CopiesAvailable = CopiesAvailable - 1
        WHERE BookID = @BookID;

        -- Commit transaction
        COMMIT;
        
        -- Display the inserted loan record
        SELECT * FROM Loan WHERE LoanID = @LoanID;
    END
    ELSE
    BEGIN
        -- Rollback transaction if no available copies
        ROLLBACK;
        PRINT 'Book is not available for loan.';
    END
END;
GO
EXEC AddLoan 
    @LoanID = 13, 
    @PatronID = 1, 
    @BookID = 1, 
    @StaffID = 1, 
    @LoanDate = '2024-04-03', 
    @DueDate = '2024-04-17', 
    @Status = 'active';

SELECT * FROM Loan WHERE LoanID = 13;
SELECT * FROM Loan;
SELECT * FROM Book;
--------------------------------------------------------------------------------------------------------------------
-- Return Book
CREATE PROCEDURE ReturnBook
(
    @LoanID INT,
    @ReturnDate DATE
)
AS
BEGIN
    -- Declare a variable to store BookID
    DECLARE @BookID INT;

    -- Get the BookID from the Loan table
    SELECT @BookID = BookID FROM Loan WHERE LoanID = @LoanID;

    -- Update the loan return date and status
    UPDATE Loan
    SET ReturnDate = @ReturnDate, Status = 'returned'
    WHERE LoanID = @LoanID;

    -- Increase the book's availability
    UPDATE Book
    SET CopiesAvailable = CopiesAvailable + 1
    WHERE BookID = @BookID;

    -- Display the updated loan record
    SELECT * FROM Loan WHERE LoanID = @LoanID;
END;
GO
EXEC ReturnBook 
    @LoanID = 12, 
    @ReturnDate = '2024-04-10';
    EXEC ReturnBook 
    @LoanID = 13, 
    @ReturnDate = '2024-04-11';
     EXEC ReturnBook 
    @LoanID = 6, 
    @ReturnDate = '2024-04-11';
  SELECT * FROM Loan WHERE LoanID = 12;
  SELECT * FROM Loan WHERE LoanID = 13;
  SELECT * FROM Loan WHERE LoanID = 6;
  SELECT * FROM Loan;

-------------------------------------------------------------------------------------------------------------

-- Search Books by Author
CREATE PROCEDURE SearchBooksByTitle
(
    @Title VARCHAR(255)
)
AS
BEGIN
    SELECT * FROM Book WHERE Title LIKE '%' + @Title + '%';
END;
GO
EXEC SearchBooksByTitle @Title = 'Fikir';
SELECT * FROM Book WHERE Title LIKE '%Fikir%';
EXEC SearchBooksByTitle @Title = 'Tobiya';
SELECT * FROM Book WHERE Title LIKE '%Tobiyau%';
-----------------------------------------------------------------------------------------------------

-- Search Patrons by Email
CREATE PROCEDURE SearchPatronsByEmail
(
    @Email VARCHAR(100)
)
AS
BEGIN
    SELECT * FROM Patron WHERE Email = @Email;
END;
GO
EXEC SearchPatronsByEmail @Email = 'mikias@example.com';
SELECT * FROM Patron WHERE Email = 'mikias@example.com';
SELECT * FROM Patron WHERE Email = Email;


-- Search Loans by PatronID
CREATE PROCEDURE SearchLoansByPatronID
(
    @PatronID INT
)
AS
BEGIN
    SELECT * FROM Loan WHERE PatronID = @PatronID;
END;
GO
EXEC SearchLoansByPatronID @PatronID = 1;
SELECT * FROM Loan WHERE PatronID = 1;
-------------------------------------------------------------------------------------------------------------------

-- Display Indexes
CREATE PROCEDURE DisplayIndexes
AS
BEGIN
    SELECT 
        i.name AS IndexName,
        t.name AS TableName,
        i.type_desc AS IndexType,
        c.name AS ColumnName
    FROM 
        sys.indexes i
    JOIN 
        sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    JOIN 
        sys.tables t ON i.object_id = t.object_id
    JOIN 
        sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    WHERE 
        t.name IN ('Loan', 'Book');
END;
GO
EXEC DisplayIndexes;


-------------------------------------------------------------------------------------------------------------------
-- Transaction for Borrowing Books
CREATE PROCEDURE CommitTransaction
(
    @LoanID INT,
    @PatronID INT,
    @BookID INT,
    @StaffID INT,
    @LoanDate DATE,
    @DueDate DATE,
    @Status VARCHAR(20)
)
AS
BEGIN
    BEGIN TRANSACTION;

    -- Create a new loan by executing the AddLoan procedure
    EXEC AddLoan @LoanID, @PatronID, @BookID, @StaffID, @LoanDate, @DueDate, @Status;

    -- Commit the transaction
    COMMIT;
END;
GO
EXEC CommitTransaction 
    @LoanID = 2, 
    @PatronID = 1, 
    @BookID = 2, 
    @StaffID = 1, 
    @LoanDate = '2023-04-02', 
    @DueDate = '2023-04-16', 
    @Status = 'active';
    
   

    
 --------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
---------------------TRIGGER-----------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

IF OBJECT_ID('trg_FineCheck', 'TR') IS NOT NULL
    DROP TRIGGER trg_FineCheck;
GO

-- Create the Fine Calculation Trigger
CREATE TRIGGER trg_FineCheck
ON Loan
AFTER UPDATE
AS
BEGIN
    -- Declare variables
    DECLARE @LoanID INT, @ReturnDate DATE, @DueDate DATE, @FineAmount DECIMAL(10, 2);

    -- Ensure the trigger only runs when ReturnDate is updated
    IF UPDATE(ReturnDate)
    BEGIN
        -- Loop through all updated rows
        DECLARE LoanCursor CURSOR FOR
        SELECT LoanID, ReturnDate, DueDate
        FROM inserted;

        OPEN LoanCursor;
        FETCH NEXT FROM LoanCursor INTO @LoanID, @ReturnDate, @DueDate;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- Check if the book is returned late
            IF @ReturnDate > @DueDate
            BEGIN
                -- Calculate fine (assuming $1 per day late)
                SET @FineAmount = DATEDIFF(DAY, @DueDate, @ReturnDate) * 1.00;

                -- Prevent recursion before updating
                DISABLE TRIGGER trg_FineCheck ON Loan;

                UPDATE Loan
                SET FineAmount = @FineAmount
                WHERE LoanID = @LoanID;

                ENABLE TRIGGER trg_FineCheck ON Loan;

                PRINT 'Late return! Fine: ' + CAST(@FineAmount AS VARCHAR(100)) + ' USD';
            END
            ELSE
            BEGIN
                -- Ensure FineAmount is 0 if returned on time
                DISABLE TRIGGER trg_FineCheck ON Loan;

                UPDATE Loan
                SET FineAmount = 0
                WHERE LoanID = @LoanID;

                ENABLE TRIGGER trg_FineCheck ON Loan;

                PRINT 'Returned on time, no fine.';
            END

            FETCH NEXT FROM LoanCursor INTO @LoanID, @ReturnDate, @DueDate;
        END;

        CLOSE LoanCursor;
        DEALLOCATE LoanCursor;
    END
END;
GO
-----------------------------------------------------------------------------------------------------------------------------
-- Create LoanHistory table for audit logging
IF OBJECT_ID('LoanHistory', 'U') IS NOT NULL
    DROP TABLE LoanHistory;
GO

CREATE TABLE LoanHistory (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    LoanID INT,
    BookID INT,
    PatronID INT,
    StaffID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FineAmount DECIMAL(10,2),
    ActionType VARCHAR(50),
    ActionDate DATETIME DEFAULT GETDATE()
);
GO
-- Create trigger for loan history tracking
IF OBJECT_ID('trg_LoanHistory', 'TR') IS NOT NULL
    DROP TRIGGER trg_LoanHistory;
GO

CREATE TRIGGER trg_LoanHistory
ON Loan
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Handle INSERT operations
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO LoanHistory (LoanID, BookID, PatronID, StaffID, LoanDate, DueDate, ReturnDate, FineAmount, ActionType)
        SELECT 
            i.LoanID, i.BookID, i.PatronID, i.StaffID, i.LoanDate, i.DueDate, i.ReturnDate, i.FineAmount, 'INSERT'
        FROM inserted i;
    END
    
    -- Handle UPDATE operations
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        INSERT INTO LoanHistory (LoanID, BookID, PatronID, StaffID, LoanDate, DueDate, ReturnDate, FineAmount, ActionType)
        SELECT 
            i.LoanID, i.BookID, i.PatronID, i.StaffID, i.LoanDate, i.DueDate, i.ReturnDate, i.FineAmount, 'UPDATE'
        FROM inserted i;
    END
    
    -- Handle DELETE operations
    IF EXISTS (SELECT * FROM deleted) AND NOT EXISTS (SELECT * FROM inserted)
    BEGIN
        INSERT INTO LoanHistory (LoanID, BookID, PatronID, StaffID, LoanDate, DueDate, ReturnDate, FineAmount, ActionType)
        SELECT 
            d.LoanID, d.BookID, d.PatronID, d.StaffID, d.LoanDate, d.DueDate, d.ReturnDate, d.FineAmount, 'DELETE'
        FROM deleted d;
    END
END;
GO
------------------------------------------------------------------------------------------------------------------------
-- Create trigger to update book availability when loan status changes
IF OBJECT_ID('trg_UpdateBookAvailability', 'TR') IS NOT NULL
    DROP TRIGGER trg_UpdateBookAvailability;
GO

CREATE TRIGGER trg_UpdateBookAvailability
ON Loan
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Handle new loans (status = 'active')
    UPDATE b
    SET b.CopiesAvailable = b.CopiesAvailable - 1
    FROM Book b
    INNER JOIN inserted i ON b.BookID = i.BookID
    WHERE i.Status = 'active' AND (NOT EXISTS (SELECT 1 FROM deleted d WHERE d.LoanID = i.LoanID) OR 
          (EXISTS (SELECT 1 FROM deleted d WHERE d.LoanID = i.LoanID AND d.Status <> 'active'));
    
    -- Handle returned books (status = 'returned')
    UPDATE b
    SET b.CopiesAvailable = b.CopiesAvailable + 1
    FROM Book b
    INNER JOIN inserted i ON b.BookID = i.BookID
    WHERE i.Status = 'returned' AND EXISTS (SELECT 1 FROM deleted d WHERE d.LoanID = i.LoanID AND d.Status <> 'returned');
END;
GO


COMMIT;
-------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
--BACKUP AND RECOVERY
--A. FOR BACKUP
--1.Full Backup:
BACKUP DATABASE LIBRARYMANAGEMENT
TO DISK = 'C:\Backup\LibraryManagementFull.bak';

--2.Differential Backup:
BACKUP DATABASE LIBRARYMANAGEMENT
TO DISK = 'C:\Backup\LibraryManagementDifferential.bak'
DIFFERENTIAL;

--3.Transaction Log Backup
BACKUP LOG LIBRARYMANAGEMENT
TO DISK = 'C:\Backup\LibraryManagementLog.trn';

--B. FOR RECOVERY
--1.Restore Full Backup
RESTORE DATABASE LIBRARYMANAGEMENT
FROM DISK = 'C:\Backup\LibraryManagementFull.bak';

--2.Restore Differential Backup
RESTORE DATABASE LIBRARYMANAGEMENT
FROM DISK = 'C:\Backup\LibraryManagementFull.bak';
RESTORE DATABASE LIBRARYMANAGEMENT
FROM DISK = 'C:\Backup\LibraryManagementDifferential.bak'
WITH NORECOVERY;  -- Keeps the database in restoring mode to apply the next backup.

--3.Restore Transaction Log Backup:
RESTORE LOG LIBRARYMANAGEMENT
FROM DISK = 'C:\Backup\LibraryManagementLog.trn'
WITH STOPAT = '2024-04-02 12:00:00';  -- Specify the recovery point

--4.Restore with Recovery
RESTORE DATABASE LIBRARYMANAGEMENT
FROM DISK = 'C:\Backup\LibraryManagementFull.bak'
WITH RECOVERY;  -- Finalizes the restore and brings the database online
