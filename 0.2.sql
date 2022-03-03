USE banking_db;

INSERT INTO SocialStatuses
	(StatusName) 
VALUES 
	('���������'), 
	('�������'), 
	('����������� ����'),
	('���������� ���'),
	('������� ���');

INSERT INTO Persons(PersonName, StatusId)
VALUES 
	('������ �������� �����������', (
		SELECT ID FROM SocialStatuses WHERE StatusName = '���������')),
	('������ ���� ����������', (
		SELECT ID FROM SocialStatuses WHERE StatusName = '�������')),
	('�������� ���� �����������', (
		SELECT ID FROM SocialStatuses WHERE StatusName = '����������� ����')),
	('������ ������� ��������', (
		SELECT ID FROM SocialStatuses WHERE StatusName = '���������� ���')),
	('������ ��������� ������������', (
		SELECT ID FROM SocialStatuses WHERE StatusName = '������� ���'));

INSERT INTO Localities(LocalityName)
VALUES
	('�����'),
	('������'),
	('�����'),
	('������'),
	('�������'),
	('������');

INSERT INTO Banks(BankName)
VALUES
	('������������'),
	('���-��������'),
	('�������������'),
	('���-����'),
	('�����-����'),
	('�����������');


INSERT INTO BankBranches(BankId, LocalityId, LocalAddress)
VALUES
	(
		(SELECT ID FROM Banks WHERE BankName = '������������'), 
		(SELECT ID FROM Localities WHERE LocalityName = '�����'), 
		'��. ������������ �.12'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = '������������'), 
		(SELECT ID FROM Localities WHERE LocalityName = '�����'), 
		'��. ����������� �.2'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = '���-��������'), 
		(SELECT ID FROM Localities WHERE LocalityName = '������'), 
		'��. ������������ �.24'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = '���-��������'), 
		(SELECT ID FROM Localities WHERE LocalityName = '�����'), 
		'��. ����������� �.3'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = '�����������'), 
		(SELECT ID FROM Localities WHERE LocalityName = '�����'), 
		'��. ����������� �.14'
	);



INSERT INTO Accounts(UserName, AccountMoney, BankId, PersonId)
VALUES
	(
		'������������ 1',
		210, 
		(SELECT ID FROM Banks WHERE BankName = '������������'),
		(SELECT ID FROM Persons WHERE PersonName = '������ �������� �����������')
	),
	(
		'GGD',
		100, 
		(SELECT ID FROM Banks WHERE BankName = '���-��������'),
		(SELECT ID FROM Persons WHERE PersonName = '������ ���� ����������')
	),
	(
		'�����',
		100, 
		(SELECT ID FROM Banks WHERE BankName = '������������'),
		(SELECT ID FROM Persons WHERE PersonName = '�������� ���� �����������')
	),
	(
		'���',
		100, 
		(SELECT ID FROM Banks WHERE BankName = '�����������'),
		(SELECT ID FROM Persons WHERE PersonName = '������ ������� ��������')
	),
	(
		'���',
		100, 
		(SELECT ID FROM Banks WHERE BankName = '�����������'),
		(SELECT ID FROM Persons WHERE PersonName = '������ ��������� ������������')
	);
	
INSERT INTO Cards(CardName, CardMoney, AccountId)
VALUES 
	(
		'Belcard Standart',
		11, 
		(SELECT ID FROM Accounts WHERE UserName = '������������ 1') 
	),
	(
		'VISA Classic',
		67, 
		(SELECT ID FROM Accounts WHERE UserName = 'GGD') 
	),
	(
		'VISA Virtuon',
		33, 
		(SELECT ID FROM Accounts WHERE UserName = 'GGD') 
	),
	(
		'VISA Gold',
		44, 
		(SELECT ID FROM Accounts WHERE UserName = '���') 
	),
	(
		'VISA Gold',
		55, 
		(SELECT ID FROM Accounts WHERE UserName = '���') 
	);