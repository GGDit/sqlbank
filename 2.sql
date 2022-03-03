USE banking_db;

SELECT BankName, CardName, CardMoney, PersonName
FROM Persons, Accounts, Cards, Banks
WHERE Accounts.BankId = Banks.ID AND 
      Accounts.PersonId = Persons.ID AND
	  Cards.AccountId = Accounts.ID
ORDER BY BankName