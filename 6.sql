USE banking_db

WITH AccountCardSum AS
(
	SELECT Accounts.ID, SUM(ISNULL(CardMoney, 0)) AS CardSum
	FROM Accounts
	LEFT JOIN Cards ON Cards.AccountId = Accounts.ID
	GROUP BY Accounts.ID
)
SELECT UserName, AccountMoney - AccountCardSum.CardSum AS [Разница баланса аккаунта с суммой балансов карт аккаунта]
FROM Accounts, AccountCardSum
WHERE Accounts.ID = AccountCardSum.ID AND AccountMoney - AccountCardSum.CardSum > 0