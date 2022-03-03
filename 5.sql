USE banking_db
GO

CREATE OR ALTER PROCEDURE SocialSubsidy (@inputStatus NVARCHAR(30) = 'Пенсионер', @inputMoneyIncrease MONEY = 10)
AS
BEGIN
	
	SELECT Accounts.UserName, Accounts.AccountMoney
	FROM Accounts

	UPDATE Accounts
	SET AccountMoney = AccountMoney + @inputMoneyIncrease
	WHERE PersonId IN (
		SELECT Persons.ID
		FROM Persons
		WHERE Persons.StatusId = (
			SELECT SocialStatuses.ID
			FROM SocialStatuses
			WHERE StatusName = @inputStatus
		)
	)

	SELECT Accounts.UserName, Accounts.AccountMoney
	FROM Accounts

END
GO

EXECUTE SocialSubsidy
	