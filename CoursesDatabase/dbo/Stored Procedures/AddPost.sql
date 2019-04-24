CREATE PROCEDURE [dbo].[AddPost]
	@Author NVARCHAR(50),
	@Title NVARCHAR(50),
	@Content NVARCHAR(500)
AS
	INSERT INTO Posts(Author, Title, Content, DateCreate) VALUES(@Author, @Title, @Content, GETDATE());
RETURN 0
