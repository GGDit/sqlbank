USE banking_db
GO

CREATE OR ALTER PROCEDURE MoneyTransfer (@inputMoneyToMove MONEY = 3, @inputUserName NVARCHAR(30) = 'GGD', @inputCardName NVARCHAR(30) = 'VISA Classic')
AS
BEGIN

	SELECT PersonName, UserName, AccountMoney, CardName, CardMoney
	FROM Accounts, Cards, Persons
	WHERE Cards.AccountId = Accounts.ID AND Accounts.PersonId = Persons.ID



	IF(
		SELECT AccountMoney - @inputMoneyToMove
		FROM Accounts
		WHERE UserName = @inputUserName
	) >= 0
	BEGIN
		BEGIN TRAN
		
		UPDATE Accounts
		SET AccountMoney = AccountMoney - @inputMoneyToMove
		WHERE UserName = @inputUserName;

		UPDATE Cards
		SET CardMoney = CardMoney + @inputMoneyToMove
		WHERE 
			Cards.AccountId = (
				SELECT Accounts.ID
				FROM Accounts
				WHERE UserName = @inputUserName
			) AND
			CardName = @inputCardName;

		COMMIT TRAN
	END

	SELECT PersonName, UserName, AccountMoney, CardName, CardMoney
	FROM Accounts, Cards, Persons
	WHERE Cards.AccountId = Accounts.ID AND Accounts.PersonId = Persons.ID

END
GO

EXECUTE MoneyTransfer