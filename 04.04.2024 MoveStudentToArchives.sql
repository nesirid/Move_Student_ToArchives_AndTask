CREATE DATABASE CoureDbAcountController;
USE CoureDbAcountController
DROP TABLE Students
DROP TABLE StudentArchives

CREATE TABLE Students (
    [Id] INT PRIMARY KEY IDENTITY(1,1) ,
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] INT,
    [Email] NVARCHAR(100),
    [Address] NVARCHAR(255)
);

CREATE TABLE StudentArchives (
    [Id] INT PRIMARY KEY ,
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] INT,
    [Email] NVARCHAR(100),
    [Address] NVARCHAR(255)
);

INSERT INTO Students ([Name], [Surname], [Age], [Email], [Address])
values
('Vasif', 'MEmmedov', 23, 'Vasif@Gmail.com', 'Memmed 2 kuc 5');




CREATE PROCEDURE MoveStudentToArchives
    @Id INT

AS
BEGIN
IF EXISTS (SELECT 1 FROM Students WHERE [Id] = @Id)
    BEGIN
        INSERT INTO StudentArchives ([Id], [Name], [Surname], [Age], [Email], [Address])
        SELECT [Id], [Name], [Surname], [Age], [Email], [Address]
        FROM Students
        WHERE [Id] = @Id;
		DELETE FROM Students WHERE [Id] = @Id;
		PRINT 'Archive Access Create'
		END
		ELSE
		BEGIN
			print 'Daxil olunmus Id uzre hec bir Student tapilmadi '
END

	END;

	
	
exec MoveStudentToArchives @Id = 3;

SELECT * FROM StudentArchives;
SELECT * FROM Students;