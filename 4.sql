USE banking_db;

SELECT SocialStatuses.StatusName, COUNT(*)
FROM SocialStatuses, Accounts, Cards, Persons
WHERE Persons.StatusId = SocialStatuses.ID AND Accounts.PersonId = Persons.ID AND Cards.AccountId = Accounts.ID
GROUP BY SocialStatuses.StatusName
