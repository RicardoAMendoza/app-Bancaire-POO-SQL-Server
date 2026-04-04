-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2026 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : app-Bancaire-POO-SQL-Server > https://github.com/RicardoAMendoza/app-Bancaire-POO-SQL-Server/tree/master
-- Project : 3.LaBanqueNationaleduQuebec
-- Instruction :
-- Copy and paste on SqlServer New Query and run it. That will create the TRANSCTIONS

-- Ricardo Mendoza (c) 2026

-- -----------------------------------------------------
-- 1.- Table `LaBanqueduQuebec_setAreas`.`tlabanqueduQuebec ` 
-- -----------------------------------------------------

-- FIRST RAUND
-- UA1UA1 ----------------------------------------------

USE bdLaBanqueNationaleduQuebec
GO
--update tcompte set balance =2500 where idcompte = 10

--SELECT  [dbo].[fuaretraitsdArgent](1000 , 3500, 10) AS result
------- [dbo].[fuaretraitsdArgent](@aretrait , @abalance, @aidtypeCompte)

--SELECT * FROM ttransaction where idcompte = 10
--SELECT * FROM tcompte where idcompte = 10
--SELECT * FROM ttypeCompte
USE bdLaBanqueNationaleduQuebec
GO
-- CHIDO
 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 245,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA1PA1 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 3560 where idcompte=20

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 9500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- UA2UA2 ----------------------------------------------

--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance =4600 where idcompte = 30

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 3455,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- PA2PA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 5765 where idcompte=40

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 9500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA3UA3 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance = 1900 where idcompte = 50

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 3455,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- PA3PA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 5765 where idcompte=60

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 9500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
 -- UA4UA4 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance = 12000 where idcompte = 70

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 225000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=1456,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- PA4PA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
--update tcompte set balance = 12000 where idcompte = 80

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 8800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=4400,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA5UA5 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =3500 where idcompte = 90
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 550600,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=3000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA5PA5 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =6700 where idcompte = 100

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 6678,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=7895,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA6UA6 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =21000 where idcompte = 110
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 89000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=7000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA6PA6 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =16000 where idcompte = 120

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 8976,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=9234,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA7UA7 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =21000 where idcompte = 130
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 667000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=9900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA74PA7 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =16000 where idcompte = 140

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 4000,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=7689,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 --select * from ttransaction
 --SELECT * FROM tcompte

-- SECOND RAUND
-- PA1PA1 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 3560 where idcompte=20

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 6600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=1100,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA2UA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 30

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 6655,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA2PA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=40

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 5600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA3UA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 50

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 8349,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=8700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA3PA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=60

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 8800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA4UA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 70

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 26000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=7000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA4PA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 80

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=500,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA5UA5 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =3500 where idcompte = 90
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 333000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=8900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA5PA5 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =6700 where idcompte = 100

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 9000,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=4357,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA6UA6 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 110
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 5000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA6PA6 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 76800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA7UA7 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 130
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 6000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA74PA7 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 9900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- SECOND RAUND SECOND DATABASE
-- UA8UA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 150
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 6000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA84PA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 160
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 9900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA9UA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 170 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 6000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA9PA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 180
USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 6600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=1100,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA10UA10 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 190

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 7655,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA11PA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=220

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 7700,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=1900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA11UA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 210

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 9949,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=8990,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=240

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 9800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA12UA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 230

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 33000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 240

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 8700,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=5600,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- FIRST RAUND SECOND DATABASE
-- UA8UA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 150
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 6900,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA84PA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 22200,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=7800,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA9UA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 170 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 8800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=5500,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA9PA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 180
USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 1900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA10UA10 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 190

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 6765,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=8900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA11PA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=220

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 54600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=8600,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA11UA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 210

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 10349,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=6700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=240

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 9800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=6000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA12UA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 230

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 33000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=5000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 240

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 9800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'




-- -----------------------------------------------------
-- 1.- Table `LaBanqueduQuebec_setAreas`.`tlabanqueduQuebec ` 
-- -----------------------------------------------------

-- FIRST RAUND
-- UA1UA1 ----------------------------------------------

USE bdLaBanqueNationaleduQuebec
GO
--update tcompte set balance =2500 where idcompte = 10

--SELECT  [dbo].[fuaretraitsdArgent](1000 , 3500, 10) AS result
------- [dbo].[fuaretraitsdArgent](@aretrait , @abalance, @aidtypeCompte)

--SELECT * FROM ttransaction where idcompte = 10
--SELECT * FROM tcompte where idcompte = 10
--SELECT * FROM ttypeCompte
USE bdLaBanqueNationaleduQuebec
GO
-- CHIDO
 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 1600,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =10,
 @aidtypeCompte = 10,
 @anumber ='UA1UA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA1PA1 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 3560 where idcompte=20

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 19500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- UA2UA2 ----------------------------------------------

--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance =4600 where idcompte = 30

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 9455,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- PA2PA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 5765 where idcompte=40

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 19500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA3UA3 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance = 1900 where idcompte = 50

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 8455,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 -- PA3PA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
--GO
--UPDATE tcompte set balance = 5765 where idcompte=60

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 12500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
 -- UA4UA4 ----------------------------------------------
--USE bdLaBanqueNationaleduQuebec
--GO
--update tcompte set balance = 12000 where idcompte = 70

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 35000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=1456,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- PA4PA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
--update tcompte set balance = 12000 where idcompte = 80

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 13800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=4400,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA5UA5 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =3500 where idcompte = 90
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 1600,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=3000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA5PA5 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =6700 where idcompte = 100

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 9678,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=7895,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA6UA6 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =21000 where idcompte = 110
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 119000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=7000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA6PA6 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =16000 where idcompte = 120

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 9976,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=9234,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 -- UA7UA7 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =21000 where idcompte = 130
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 47000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=9900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

  -- PA74PA7 ----------------------------------------------
 --USE bdLaBanqueNationaleduQuebec
 --GO
 --update tcompte set balance =16000 where idcompte = 140

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 14000,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=7689,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

 --select * from ttransaction
 --SELECT * FROM tcompte

-- SECOND RAUND
-- PA1PA1 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 3560 where idcompte=20

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 16600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=1100,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =20,
 @aidtypeCompte = 20,
 @anumber ='PA1PA1',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA2UA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 30

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 16655,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =30,
 @aidtypeCompte = 10,
 @anumber ='UA2UA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA2PA2 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=40

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 15600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =40,
 @aidtypeCompte = 20,
 @anumber ='PA2PA2',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA3UA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 50

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 18349,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=8700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =50,
 @aidtypeCompte = 10,
 @anumber ='UA3UA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA3PA3 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=60

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 18800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =60,
 @aidtypeCompte = 20,
 @anumber ='PA3PA3',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA4UA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 70

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 6000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=7000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =70,
 @aidtypeCompte = 10,
 @anumber ='UA4UA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA4PA4 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 80

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 11800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=500,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =80,
 @aidtypeCompte = 20,
 @anumber ='PA4PA4',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA5UA5 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =3500 where idcompte = 90
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot =23000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=8900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =90,
 @aidtypeCompte = 10,
 @anumber ='UA5UA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA5PA5 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =6700 where idcompte = 100

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 19000,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=4357,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =100,
 @aidtypeCompte = 20,
 @anumber ='PA5PA5',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA6UA6 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 110
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 50000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =110,
 @aidtypeCompte = 10,
 @anumber ='UA6UA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA6PA6 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120

  USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 7800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =120,
 @aidtypeCompte = 20,
 @anumber ='PA6PA6',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA7UA7 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 130
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 61000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =130,
 @aidtypeCompte = 10,
 @anumber ='UA7UA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA74PA7 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 19900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =140,
 @aidtypeCompte = 20,
 @anumber ='PA7PA7',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- SECOND RAUND SECOND DATABASE
-- UA8UA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 150
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 16000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA84PA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 160
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 19900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=2000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA9UA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 170 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 36000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA9PA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 180
USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 61600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=1100,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA10UA10 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 190

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 17655,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=1000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA11PA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=220

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 17700,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=1900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA11UA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 210

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 19949,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=8990,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=240

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 4500,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA12UA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 230

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 21000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=9000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 240

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 18700,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=5600,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- FIRST RAUND SECOND DATABASE
-- UA8UA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 150
 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 16900,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =150,
 @aidtypeCompte = 10,
 @anumber ='UA8UA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA84PA8 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 120
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 12200,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=7800,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =160,
 @aidtypeCompte = 20,
 @anumber ='PA8PA8',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA9UA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =21000 where idcompte = 170 
 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 18800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=5500,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =170,
 @aidtypeCompte = 10,
 @anumber ='UA9UA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA9PA9 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =16000 where idcompte = 180
USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 12900,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =180,
 @aidtypeCompte = 20,
 @anumber ='PA9PA9',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- UA10UA10 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance =4600 where idcompte = 190

USE bdLaBanqueNationaleduQuebec
GO

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 12765,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=8900,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =190,
 @aidtypeCompte = 10,
 @anumber ='UA10UA10',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA11PA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=220

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 1600,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=8600,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
@aidcompte =220,
 @aidtypeCompte = 20,
 @anumber ='PA11PA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- UA11UA11 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 1900 where idcompte = 210

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 9349,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=6700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =210,
 @aidtypeCompte = 10,
 @anumber ='UA11UA11',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- UPDATE tcompte set balance = 5765 where idcompte=240

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 13800,
 @aretrait=0,
 @aoperation ='deposer'
 
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=6000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'
 
 
-- UA12UA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 230

USE bdLaBanqueNationaleduQuebec
GO
 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 22000,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=5000,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =230,
 @aidtypeCompte = 10,
 @anumber ='UA12UA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'

-- PA12PA12 ----------------------------------------------
-- USE bdLaBanqueNationaleduQuebec
-- GO
-- update tcompte set balance = 12000 where idcompte = 240

 USE bdLaBanqueNationaleduQuebec
 GO
 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 19800,
 @aretrait=0,
 @aoperation ='deposer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=7700,
 @aoperation ='retirer'

 EXEC sp_AccountTransaction
 @aidcompte =240,
 @aidtypeCompte = 20,
 @anumber ='PA12PA12',
 @adepot = 0,
 @aretrait=0,
 @aoperation ='consultation'


 --select * from ttransaction
 --SELECT * FROM tcompte

 select * from ttransaction
 --SELECT * FROM tcompte