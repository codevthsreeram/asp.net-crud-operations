/*=================================================================================================
DESCRIPTION:  To Uodate the user

TESTING STRINGS: 	EXEC [Core].[UpdateUser]

CHANGE HISTORY:
NAME			DATE    		DESCRIPTION
----------  	-----------		---------------------------------------
Sreeram 		05-Feb-2023		Created
=====================================================================================================*/      
CREATE OR ALTER PROCEDURE [Core].[UpdateUser]
(
	@UserId				UNIQUEIDENTIFIER,
	@FirstName			NVARCHAR (200),	
	@LastName			NVARCHAR (200),	
	@FullName			NVARCHAR (200),	
	@Address			NVARCHAR (MAX),
	@Email				NVARCHAR (200),
	@IsActive			BIT,
	@Action				NVARCHAR(50)
)
AS
BEGIN
	IF(@Action = 'All')
	BEGIN
		UPDATE [Core].[UserDetail]
		SET [FirstName] = @FirstName,
			[LastName] = @LastName,
			[FullName] = @FullName,
			[Address] = @Address,
			[Email] = @Email,
			[ModifiedDate] = GETUTCDATE()
		WHERE [UserId] = @UserId
	END
	ELSE IF(@Action = 'State')
	BEGIN
		UPDATE [Core].[UserDetail]
		SET [IsActive] = @IsActive,
			[ModifiedDate] = GETUTCDATE()
		WHERE [UserId] = @UserId
	END
END