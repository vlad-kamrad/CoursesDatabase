CREATE PROCEDURE [dbo].[AddComment]
	@PostId INT = 0,
	@Content NVARCHAR(50),
	@Author NVARCHAR(50)
AS
	INSERT INTO Comments(PostId, Content, Author, DateCreated) VALUES(@PostId, @Content, @Author, GETDATE());
RETURN 0
