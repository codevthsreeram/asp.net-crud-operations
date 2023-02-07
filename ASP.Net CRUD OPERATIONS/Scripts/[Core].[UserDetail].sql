CREATE TABLE [Core].[UserDetail] (
    [UserId]				UNIQUEIDENTIFIER NOT NULL,
	[FirstName]				NVARCHAR (200)	 NOT NULL,	
    [LastName]				NVARCHAR (200)	 NOT NULL,	
	[FullName]				NVARCHAR (200)	 NOT NULL,	
	[Address]				NVARCHAR (MAX)	 NOT NULL,	
	[Email]					NVARCHAR (200)	 NOT NULL,	
	[IsActive]              BIT              NOT NULL DEFAULT 1 ,
	[IsDeleted]             BIT              NOT NULL DEFAULT 0 ,	
    [CreatedDate]           DATETIME         NOT NULL,
    [ModifiedDate]          DATETIME         NOT NULL

    CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED ([UserId] ASC),
	CONSTRAINT [CK_UserDetail_Address_IsJson] CHECK (ISJSON([Address]) > (0))
);
