/*=================================================================================================
DESCRIPTION:  To Deletes the user by Id 

TESTING STRINGS: 	EXEC [Core].[DeleteUser] 'AE26F539-B945-47ED-B2F8-F34AF74EBE3B'

CHANGE HISTORY:
NAME			DATE    		DESCRIPTION
----------  	-----------		---------------------------------------
Sreeram 		05-Feb-2023		Created
=====================================================================================================*/
CREATE OR ALTER PROCEDURE [Core].[DeleteUser]
(
	@UserId UNIQUEIDENTIFIER
)
AS
BEGIN
	--Updating IsDeleted flag
	UPDATE [Core].[UserDetail] SET [IsDeleted] = 1, [ModifiedDate] = GETUTCDATE()
	WHERE [UserId] = @UserId 

	
END