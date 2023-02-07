/*=================================================================================================
DESCRIPTION:  To Creates the user

TESTING STRINGS: 	EXEC [Core].[InsertUser]

CHANGE HISTORY:
NAME			DATE    		DESCRIPTION
----------  	-----------		---------------------------------------
Sreeram 		05-Feb-2023		Created
=====================================================================================================*/      
CREATE OR ALTER PROCEDURE [Core].[InsertUser]
(
	@UserId				UNIQUEIDENTIFIER,
	@FirstName			NVARCHAR (200),	
	@LastName			NVARCHAR (200),	
	@FullName			NVARCHAR (200),	
	@Address			NVARCHAR (MAX),
	@Email				NVARCHAR (200)
)
AS
BEGIN
	INSERT INTO [Core].[UserDetail]([UserId],[FirstName],[LastName],[FullName],[Address],[Email],[IsActive] ,[IsDeleted] ,[CreatedDate] ,[ModifiedDate])
	SELECT @UserId,@FirstName,@LastName,@FullName,@Address,@Email,1,0,GETUTCDATE(),GETUTCDATE()
END