/*=================================================================================================
DESCRIPTION:  To get the user details by userId

TESTING STRINGS: 	EXEC [Core].[GetUserById] 'AE26F539-B945-47ED-B2F8-F34AF74EBE3B'

CHANGE HISTORY:
NAME			DATE    		DESCRIPTION
----------  	-----------		---------------------------------------
Sreeram 		05-Feb-2023		Created
=====================================================================================================*/
CREATE OR ALTER PROCEDURE [Core].[GetUserById]  
	@UserId UNIQUEIDENTIFIER
AS
BEGIN	
	SELECT [UserId], [FirstName], [LastName], [FullName], [Address], [Email],[IsActive],[CreatedDate],[ModifiedDate]
	FROM [Core].[UserDetail] (NOLOCK)
	WHERE [UserId] = @UserId
END