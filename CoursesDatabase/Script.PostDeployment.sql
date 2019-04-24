/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/



/* Create Posts */

DECLARE @Person NVARCHAR(50);		/* Used for storage author name */

SET @Person = 'Hustler';
IF(NOT EXISTS(SELECT * FROM Posts WHERE Author = @Person))
BEGIN	
	EXEC AddPost @Person, 'Title number one', 'Content number one';
END

SET @Person = 'Bothan';
IF(NOT EXISTS(SELECT * FROM Posts WHERE Author = @Person))
BEGIN
	EXEC AddPost @Person, 'Title number 2', 'The best content';
END

/* Create comments */

DECLARE @AuthorCommentId NVARCHAR(50);	/* Used for storage ID author comment	*/
DECLARE @Comment NVARCHAR(500);			/* Used to search for comments			*/

SET @Comment = 'I hate you';
IF(NOT EXISTS(SELECT * FROM Comments WHERE Comments.Content = @Comment))
BEGIN	
	SET @AuthorCommentId = (SELECT TOP 1 Posts.Id FROM Posts WHERE Posts.Author = 'Hustler');
	EXEC AddComment @PostId = @AuthorCommentId, @Content = @Comment, @Author = 'Bothan';
END

SET @Comment = 'I love you';
IF(NOT EXISTS(SELECT * FROM Comments WHERE Comments.Content = @Comment))
BEGIN
	-- SET @AuthorCommentId = (SELECT TOP 1 Posts.Id FROM Posts WHERE Posts.Author = 'Hustler');
	EXEC AddComment @PostId = @AuthorCommentId, @Content = @Comment, @Author = 'Anon';
END

SET @Comment = 'You are cool';
IF(NOT EXISTS(SELECT * FROM Comments WHERE Comments.Content = @Comment))
BEGIN
	SET @AuthorCommentId = (SELECT TOP 1 Posts.Id FROM Posts WHERE Posts.Author = 'Bothan');
	EXEC AddComment @PostId = @AuthorCommentId, @Content =  @Comment, @Author = 'Anon';
END