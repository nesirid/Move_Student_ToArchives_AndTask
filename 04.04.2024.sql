use	CourseDatabase

--create table Employees(
--[Id] int primary key identity (1,1),
--[Name] nvarchar(50),
--[ManagerId] int
--)
--where [Id] = [ManagerId]


select * from Teachers

--create view getTeachersWithId 
--as
--select * from Teachers where [Id] > 3

--select * from getTeachersWithId

--create view getTeachersWithAge 
--as
--select top 3 * from Teachers where [Age] > 18

--select * from getTeachersWithAge

create function sayHelloWorld()
returns nvarchar (50)
as
begin	
	return 'Hello world'
end 

select dbo.sayHelloWorld()

declare @data nvarchar(30) = (select dbo.sayHelloWorld())

print @data 


create function dbo.showText(@text nvarchar(50))
returns nvarchar(50)
as
begin 
return @text
end 

select dbo.showText('Elasiz Reshad Bey')

create function dbo.SumOfNums(@num1 int, @num2 int)
returns int
as
begin 
	return @num1 + @num2
end 

select dbo.SumOfNums(1,2)
 
declare @id int = (select dbo.SumOfNums(1,2))
select * from Employees where [Id] = @id 

create function dbo.getTeachersByAge(@age int)
returns int
as
begin 
declare @count int;
select @count = COUNT(*) from Teachers where [Age] > @age;
return @count 
end
	
select * from Teachers
select dbo.getTeachersByAge(18) as 'Teachers count'

create function dbo.getAllTeacher()
returns table 
as
return (select * from Teachers)

select * from dbo.getAllTeacher()

create function dbo.SearchingTeachersbyName(@SearchText nvarchar (50))
returns table 
as
return (
	select * from Teachers where [Name] like '%' + @SearchText + '%'
)


select * from dbo.SearchingTeachersbyName('a')
select * from Teachers



create procedure usp_ShowText 
as
begin
	print 'salamlar'
end 

create procedure usp_ShowText2
@text nvarchar(50)
as
begin
	print @text
end 


exec usp_ShowText2 'Salam Fatime xanim'
usp_ShowText




create procedure usp_createTeacher 
@name nvarchar(100),
@surname nvarchar(100),
@email nvarchar(200),
@age int 
as
begin 
insert into Teachers ([Name], [Surname], [Email], [Age])
values (@name, @surname, @email, @age)
end 


exec usp_createTeacher 'Ismayil', 'Ceferli', 'ismayil@gmail.com', 24
exec usp_createTeacher 'Eskerxan', 'Bayramov', 'esgerxan@gmail.com', 24

create procedure usp_deleteTeacherById
@id  int
as 
begin
delete from Teachers where [Id] = @id
end

exec usp_deleteTeacherById 4

select * from Teachers

create function dbo.getTeachersAvgAges(@id int)
returns int 
as
begin
declare @avgAge int;
select @avgAge = AVG(Age) from Teachers where [Id] > @id
return @avgAge
end

select dbo.getTeachersAvgAges(3)

select * from Teachers


