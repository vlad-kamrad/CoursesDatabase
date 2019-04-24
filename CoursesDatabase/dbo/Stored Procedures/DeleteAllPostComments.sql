CREATE PROCEDURE [dbo].[DeleteAllPostComments]
	@PostId INT
AS
	DELETE FROM Comments WHERE Comments.PostId = @PostId;
RETURN 0
