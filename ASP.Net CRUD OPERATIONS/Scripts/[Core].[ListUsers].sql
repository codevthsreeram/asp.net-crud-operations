/*=================================================================================================
DESCRIPTION:  To get the list of users by query params

TESTING STRINGS: 	EXEC [Core].[ListUsers] 0,10

CHANGE HISTORY:
NAME			DATE    		DESCRIPTION
----------  	-----------		---------------------------------------
Sreeram 		05-Feb-2023		Created
=====================================================================================================*/
CREATE OR ALTER PROCEDURE [Core].[ListUsers]
(
	@Skip SMALLINT = 0
	, @Take SMALLINT = 20
)
AS
BEGIN
	
	SELECT [UserId], [FirstName],[LastName], [FullName], ISNULL(JSON_VALUE([Address],'$.City'),'') AS [City], [Email],[IsActive],[CreatedDate]
	FROM [Core].[UserDetail] (NOLOCK)
	WHERE [IsDeleted] = 0 
	ORDER BY [CreatedDate] DESC 
	OFFSET @Skip ROWS  
	FETCH NEXT @Take ROWS ONLY	
END