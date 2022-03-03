USE banking_db;

--������ �������
SELECT DISTINCT BankName 
FROM Banks 
WHERE ID IN (SELECT BankID 
             FROM BankBranches
             WHERE LocalityID = (SELECT ID 
                                  FROM Localities 
                                  WHERE LocalityName = '�����'));

--������ �������
SELECT Banks.BankName, BankBranches.LocalAddress 
FROM Banks, BankBranches, Localities 
WHERE Banks.ID = BankBranches.BankId AND Localities.ID = BankBranches.LocalityId AND LocalityName = '�����'