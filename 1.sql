USE banking_db;

--Первый вариант
SELECT DISTINCT BankName 
FROM Banks 
WHERE ID IN (SELECT BankID 
             FROM BankBranches
             WHERE LocalityID = (SELECT ID 
                                  FROM Localities 
                                  WHERE LocalityName = 'Минск'));

--Второй вариант
SELECT Banks.BankName, BankBranches.LocalAddress 
FROM Banks, BankBranches, Localities 
WHERE Banks.ID = BankBranches.BankId AND Localities.ID = BankBranches.LocalityId AND LocalityName = 'Минск'