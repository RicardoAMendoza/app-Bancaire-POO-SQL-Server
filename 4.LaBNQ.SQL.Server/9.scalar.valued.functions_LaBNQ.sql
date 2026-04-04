-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2026 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : app-Bancaire-POO-SQL-Server > https://github.com/RicardoAMendoza/app-Bancaire-POO-SQL-Server/tree/master
-- Project : 3.LaBanqueNationaleduQuebec
-- Instruction :
-- Copy and paste on SqlServer New Query and run it. That will create the functions

-- Ricardo Mendoza (c) 2026





-- Les comptes sont de nature différente selon qu'ils soient rémunérés ou
-- non (comptes courants):

-- ACCOUNT
-- Un Compte:
-- Décrit la notion de compte bancaire : 
-- elle contient le numéro du compte, le nom du titulaire et le solde du compte. 
-- Elle permet d'effectuer les opérations minimales sur un compte bancaire : 
-- consultation du solde, 
-- retirer une somme du compte, 
-- déposer une somme sur le compte.

-- UNPAID ACCOUNT
-- Un CompteNonRemunéré:
-- Est un compte d'un genre spécifique, qui possède une autorisation de découvert modifiable 
-- à tout moment par la banque, les retrait d'argent sont soumis au seuil défini par la valeur 
-- du découvert autorisé. A chaque fois qu'un retrait dépassant le solde (dans la limite 
-- du découvert autorisé) a lieu la banque prélève sur le compte 
-- des frais de gestion de 12% sur le montant du dépassement.

-- PAID ACCOUNT
-- Un CompteRemunéré:
-- Est un compte d'un genre spécifique, qui rémunère les sommes déposées selon une formule dépendant 
-- d'un taux d'intérêt proposé et modifiable par la banque. Nous supposerons que la banque 
-- est une bonne institution car elle crédite le compte, pour tout dépôt, 
-- d'un intérêt immédiat sur la somme déposée.

-------------------------------------------------------------------------------------------
-- PAID ACCOUNT
-------------------------------------------------------------------------------------------
------------------------- 1.FUNCTION fpadepotdArgent(@adepot money, @abalance money)
USE [bdLaBanqueNationaleduQuebec]
GO
CREATE FUNCTION fpadepotdArgent(@adepot money, @abalance money, @ainteretImmediat float)
	RETURNS money
AS BEGIN
	DECLARE @newBalanceadded money
		SET @newBalanceadded =(@abalance + @adepot + @adepot*@ainteretImmediat)
	RETURN @newBalanceadded
END

--drop function [dbo].[fpadepotdArgent]
--drop procedure [dbo].[sp_transaction_fpadepotdArgent]
--drop procedure [dbo].[sp_transaction_depotMoney]
USE [bdLaBanqueNationaleduQuebec]
GO
CREATE procedure sp_transaction_fpadepotdArgent
	@aidtypeCompte int = null,  -- 10
	@aidcompte int = null,  -- 10
	@adepot money = null,
	@anumber [dbo].[tv100] = null --'UA1UA1'
AS BEGIN 
	DECLARE @abalance money;
	DECLARE @aresult money;
	DECLARE @ainteretImmediat float;
	SET @abalance = (SELECT balance FROM tcompte WHERE idcompte = @aidcompte)
	SET @ainteretImmediat = (SELECT [interetImmediat] FROM [dbo].[ttypeCompte] WHERE [idtypeCompte] = @aidtypeCompte)
	SET @aresult = [dbo].[fpadepotdArgent](@adepot , @abalance, @ainteretImmediat)
	IF @aidcompte=0
		INSERT INTO tcompte(balance)
		VALUES (@adepot)
	ELSE
		UPDATE tcompte
		SET balance=@aresult
	WHERE idcompte=@aidcompte and number=@anumber
	SELECT * FROM tcompte WHERE number =@anumber
END
GO

 -- USE [bdLaBanqueNationaleduQuebec]
 -- GO
 -- EXEC sp_transaction_fpadepotdArgent
 -- @aidtypeCompte = 20,
 -- @aidcompte =127,
 -- @adepot = 100000,
 -- @anumber ='PA5PA5'
 -- SELECT * FROM tcompte
-- SELECT * FROM tcompte WHERE number ='PA1PA1'
-- SELECT * FROM ttypeCompte
-- Modificar la tasa de interes
-- UPDATE ttypeCompte SET interetImmediat = .15 WHERE idtypeCompte = 20
-- UPDATE tcompte set balance = 1000 where idcompte =127
-- UPDATE tcompte set balance = 1000 where idcompte =118

-------------------------------------------------------------------------------------------
-- PAID ACCOUNT
-------------------------------------------------------------------------------------------
------------------------- 2.FUNCTION [dbo].[fparetraitsdArgent](@aretrait money, @abalance money)
USE [bdLaBanqueNationaleduQuebec]
GO
CREATE FUNCTION fparetraitsdArgent(@aretrait money, @abalance money)
RETURNS money
AS BEGIN
	DECLARE @anewBalance money
		SET @anewBalance =(@abalance - @aretrait)
	RETURN @anewBalance
END

USE [bdLaBanqueNationaleduQuebec]
GO
CREATE procedure sp_transaction_fparetraitsdArgent
	@aidcompte int= null,  -- 10
	@aretrait money=null,
	@anumber [dbo].[tv100] = null --'UA1UA1'
AS BEGIN 
	DECLARE @abalance money;
	DECLARE @aresult money;
		SET @abalance = (SELECT balance FROM tcompte WHERE idcompte = @aidcompte)
		SET @aresult = [dbo].[fparetraitsdArgent](@aretrait , @abalance)
IF @aidcompte=0
	INSERT INTO tcompte(balance)
	VALUES (@aretrait)
ELSE
	UPDATE tcompte
		SET balance=@aresult
	WHERE idcompte=@aidcompte and number=@anumber
	SELECT * FROM tcompte WHERE number =@anumber
END
GO

-- USE [bdLaBanqueNationaleduQuebec]
-- GO
-- EXEC sp_transaction_fparetraitsdArgent
-- @aidcompte =103,
-- @aretrait= 100000,
-- @anumber ='PA1PA1'
--SELECT * FROM tcompte
-- SELECT * FROM tcompte WHERE number ='PA1PA1'

-------------------------------------------------------------------------------------------
-- UNPAID ACCOUNT
-------------------------------------------------------------------------------------------
------------------ 3.FUNCTION [dbo].[fuaretraitsdArgent](@aretrait money, @abalance money)
-- USE [bdLaBanqueNationaleduQuebec]
-- GO
-- Modificar decouvert
-- UPDATE ttypeCompte SET decouvert = 300 WHERE idtypeCompte = 10

USE [bdLaBanqueNationaleduQuebec]
GO
CREATE FUNCTION fuaretraitsdArgent(@aretrait money, @abalance money, @aidtypeCompte int)
RETURNS money
AS BEGIN
	DECLARE @adecouvert money;
	DECLARE @acommission float;
	DECLARE @anewBalance money;
		SET @adecouvert = (SELECT decouvert FROM ttypeCompte WHERE idtypeCompte = @aidtypeCompte)
		SET @acommission = (SELECT commission FROM ttypeCompte WHERE idtypeCompte = @aidtypeCompte)
			IF @aretrait > @adecouvert   ----- 37000  -      (3000  +(  3000  -   300  )*.12)   = 33676
			                                                  -- 3324
				SET @anewBalance =(@abalance - (@aretrait+(@aretrait-@adecouvert)*@acommission))
			ELSE
				SET @anewBalance =(@abalance - @aretrait)
	RETURN @anewBalance
END
-- SELECT * FROM ttypeCompte
-- SELECT decouvert FROM ttypeCompte WHERE idtypeCompte = 10
-- SELECT commission FROM ttypeCompte WHERE idtypeCompte = 10
-- USE [bdLaBanqueNationaleduQuebec]
-- GO
-- DROP procedure sp_transaction_fuaretraitsdArgent

USE [bdLaBanqueNationaleduQuebec]
GO
CREATE procedure sp_transaction_fuaretraitsdArgent
	@aidcompte int= null,  -- 112
	@aidtypeCompte int =null, -- 10
	@aretrait money=null,
	@anumber [dbo].[tv100]= null --'UA3UA3'
AS BEGIN 
	DECLARE @abalance money;
	DECLARE @aresult money;
		SET @abalance = (SELECT balance FROM tcompte WHERE idcompte = @aidcompte)
		SET @aresult = [dbo].[fuaretraitsdArgent](@aretrait , @abalance, @aidtypeCompte)
	IF @aidcompte=0
		INSERT INTO tcompte(balance)
		VALUES (@aretrait)
	ELSE
		UPDATE tcompte
		SET balance=@aresult
	WHERE idcompte=@aidcompte and number=@anumber
	SELECT * FROM tcompte WHERE number =@anumber
END
GO

-- SELECT * FROM tcompte WHERE number ='UA3UA3'

-- use [bdLaBanqueNationaleduQuebec]
-- GO
-- EXEC sp_transaction_fuaretraitsdArgent
-- @aidcompte = 112,
-- @aidtypeCompte = 10,
-- @aretrait= 3000,
-- @anumber ='UA3UA3'

-- use [bdLaBanqueNationaleduQuebec]
-- GO
-- EXEC sp_transaction_depotMoney
-- @aidcompte =112,
-- @adepot = 1000,
-- @anumber ='UA3UA3'

-------------------------------------------------------------------------------------------
------------------------------- 4.FUNCTION fuadepotdArgent(@adepot money, @abalance money)

USE [bdLaBanqueNationaleduQuebec]
GO
CREATE FUNCTION fuadepotdArgent(@adepot money, @abalance money)
RETURNS money
AS BEGIN
	DECLARE @newBalanceadded money
		SET @newBalanceadded =(@abalance + @adepot)
	RETURN @newBalanceadded
END

USE [bdLaBanqueNationaleduQuebec]
GO
CREATE procedure sp_transaction_fuadepotdArgent
	@aidcompte int= null,  -- 10
	@adepot money=null,
	@anumber [dbo].[tv100] = null --'UA1UA1'
AS BEGIN 
		DECLARE @abalance money;
		DECLARE @aresult money;
			SET @abalance = (SELECT balance FROM tcompte WHERE idcompte = @aidcompte)
			SET @aresult = [dbo].[fuadepotdArgent](@adepot , @abalance)
	IF @aidcompte=0
		INSERT INTO tcompte(balance)
		VALUES (@adepot)
	ELSE
		UPDATE tcompte
			SET balance=@aresult
		WHERE idcompte=@aidcompte and number=@anumber
	SELECT * FROM tcompte WHERE number =@anumber
END
GO

  --use [bdLaBanqueNationaleduQuebec]
  --GO
  --EXEC sp_transaction_fuadepotdArgent
  --@aidcompte =112,
  --@adepot = 1000,
  --@anumber ='UA3UA3'
-- SELECT * FROM tcompte
 -- SELECT * FROM tcompte WHERE number ='UA3UA3'

 --use [bdLaBanqueNationaleduQuebec]
 --GO
 --EXEC sp_transaction_fuaretraitsdArgent
 --@aidcompte =112,
 --@aretrait= 3000,
 --@anumber ='UA3UA3'
