CREATE TABLE [dbo].[Comments]
(
	[Id] INT NOT NULL CONSTRAINT PK_Comment PRIMARY KEY IDENTITY(1,1), 
    [PostId] INT NOT NULL, 
    [Content] NVARCHAR(50) NOT NULL, 
    [Author] NVARCHAR(50) NULL, 
    [DateCreated] DATE NOT NULL, 
    CONSTRAINT [FK_Comments_Posts] FOREIGN KEY (PostId) REFERENCES [Posts]([Id])
)
