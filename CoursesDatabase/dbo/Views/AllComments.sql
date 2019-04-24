CREATE VIEW [dbo].[AllComments]
	AS 
		SELECT Posts.Author AS Author, Posts.Title AS Title, Comments.Content AS Content 
		FROM Posts, Comments
		WHERE Comments.PostId = Posts.Id;
