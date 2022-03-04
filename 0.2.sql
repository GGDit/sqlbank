USE banking_db;

INSERT INTO SocialStatuses
	(StatusName) 
VALUES 
	('Пенсионер'), 
	('Студент'), 
	('Многодетная мать'),
	('Ликвидатор ЧАС'),
	('Ветеран ВОВ');

INSERT INTO Persons(PersonName, StatusId)
VALUES 
	('Бушков Аристарх Геннадьевич', (
		SELECT ID FROM SocialStatuses WHERE StatusName = 'Пенсионер')),
	('Гвоздёв Глеб Дмитриевич', (
		SELECT ID FROM SocialStatuses WHERE StatusName = 'Студент')),
	('Гуськова Анна Григорьевна', (
		SELECT ID FROM SocialStatuses WHERE StatusName = 'Многодетная мать')),
	('Петров Василий Иванович', (
		SELECT ID FROM SocialStatuses WHERE StatusName = 'Ликвидатор ЧАС')),
	('Ющенко Александр Владимирович', (
		SELECT ID FROM SocialStatuses WHERE StatusName = 'Ветеран ВОВ'));

INSERT INTO Localities(LocalityName)
VALUES
	('Минск'),
	('Гомель'),
	('Брест'),
	('Гродно'),
	('Витебск'),
	('Могилёв');

INSERT INTO Banks(BankName)
VALUES
	('Беларусьбанк'),
	('БПС-Сбербанк'),
	('Белинвестбанк'),
	('БНБ-Банк'),
	('Альфа-Банк'),
	('Паритетбанк');


INSERT INTO BankBranches(BankId, LocalityId, LocalAddress)
VALUES
	(
		(SELECT ID FROM Banks WHERE BankName = 'Беларусьбанк'), 
		(SELECT ID FROM Localities WHERE LocalityName = 'Минск'), 
		'пр. Дзержинского д.12'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = 'Беларусьбанк'), 
		(SELECT ID FROM Localities WHERE LocalityName = 'Брест'), 
		'пр. Победителей д.2'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = 'БПС-Сбербанк'), 
		(SELECT ID FROM Localities WHERE LocalityName = 'Гомель'), 
		'ул. Крестьянская д.24'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = 'БПС-Сбербанк'), 
		(SELECT ID FROM Localities WHERE LocalityName = 'Брест'), 
		'ул. Победителей д.3'
	),
	(
		(SELECT ID FROM Banks WHERE BankName = 'Паритетбанк'), 
		(SELECT ID FROM Localities WHERE LocalityName = 'Минск'), 
		'ул. Домашевская д.14'
	);



INSERT INTO Accounts(UserName, AccountMoney, BankId, PersonId)
VALUES
	(
		'Пользователь 1',
		210, 
		(SELECT ID FROM Banks WHERE BankName = 'Беларусьбанк'),
		(SELECT ID FROM Persons WHERE PersonName = 'Бушков Аристарх Геннадьевич')
	),
	(
		'GGD',
		100, 
		(SELECT ID FROM Banks WHERE BankName = 'БПС-Сбербанк'),
		(SELECT ID FROM Persons WHERE PersonName = 'Гвоздёв Глеб Дмитриевич')
	),
	(
		'Анюта',
		100, 
		(SELECT ID FROM Banks WHERE BankName = 'Беларусьбанк'),
		(SELECT ID FROM Persons WHERE PersonName = 'Гуськова Анна Григорьевна')
	),
	(
		'ПВИ',
		100, 
		(SELECT ID FROM Banks WHERE BankName = 'Паритетбанк'),
		(SELECT ID FROM Persons WHERE PersonName = 'Петров Василий Иванович')
	),
	(
		'ЮАВ',
		100, 
		(SELECT ID FROM Banks WHERE BankName = 'Паритетбанк'),
		(SELECT ID FROM Persons WHERE PersonName = 'Ющенко Александр Владимирович')
	);
	
INSERT INTO Cards(CardName, CardMoney, AccountId)
VALUES 
	(
		'Belcard Standart',
		11, 
		(SELECT ID FROM Accounts WHERE UserName = 'Пользователь 1') 
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
		(SELECT ID FROM Accounts WHERE UserName = 'ПВИ') 
	),
	(
		'VISA Gold',
		55, 
		(SELECT ID FROM Accounts WHERE UserName = 'ЮАВ') 
	);