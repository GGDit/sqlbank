USE banking_db
GO

CREATE OR ALTER FUNCTION IfAccountMoneyLessSumCardMoney()
RETURNS BIT
BEGIN
	
	IF EXISTS(
		SELECT AccountMoney
		FROM Accounts
		WHERE AccountMoney < (
			SELECT SUM(Cards.CardMoney)
			FROM Cards
			WHERE Accounts.ID = Cards.AccountId
			GROUP BY Cards.AccountId
		)
	)
    RETURN 1
	
	RETURN 0

END
GO

CREATE OR ALTER TRIGGER Accounts_MoneyChanging
ON Accounts
AFTER UPDATE
AS
BEGIN

	IF dbo.IfAccountMoneyLessSumCardMoney() = 1
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Заблокированно изменение балланса аккаута (введенное значение меньше суммы баллансов на картах данного аккаунта)', 1, 1);
	END

END
GO

CREATE OR ALTER TRIGGER Cards_MoneyChanging 
ON Cards
AFTER UPDATE
AS
BEGIN

	IF dbo.IfAccountMoneyLessSumCardMoney() = 1
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Заблокированно изменение балланса карты (результирующая сумма балансов карт больше баланса на аккаунте, к которому карты привязаны)', 1, 1);
	END

END