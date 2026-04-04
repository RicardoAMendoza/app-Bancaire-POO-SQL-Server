-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2024 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : MVC_winapp_NationalBank_SqlServer > https://github.com/RicardoAMendoza/MVC_winapp_NationalBank_SqlServer.git
-- Project : prjWeb_MVC_LaBanquenationale_Rm
-- Instruction :
-- Copy AND paste on SqlServer script AND run it. That will create de data base


--In SQL Server, a "view" is a virtual table that displays the result of a single query,
--essentially acting like a customized snapshot of data from other tables,
--while a "procedure" (also called a stored procedure) is a set of pre-compiled SQL statements
--that can perform multiple operations like inserting, updating, deleting,
--or selecting data, allowing for more complex logic and reusable functionality;
--in simpler terms, a view is just a way to present data in a specific format, 
--while a procedure can actively manipulate data within the database

-- 1.- selectAdmin
-- 2.- selectConseil
-- 3.- selectDirecteur
-- 4.- selectEmploye
-- 5.- selectClient
-- 6.- selectClientbyNameandAccountType
-- 7.- selectClientbyNumber
-- 8.- selectClientByCondition


-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT admin FROM bdLaBanqueNationaleduQuebec
-- 1.- selectAdmin
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectAdmin
AS BEGIN 
	SELECT
		a.idadmin AS ID,
		a.number AS NUMBER,
		CONCAT(a.nomdeFamille,' ',a.nom )AS NAME,
		a.courriel AS [E-MAIL],
		a.utilisateur AS [USER],
		a.motdePasse AS PASSWORD,
		a.sexe AS SEXE,
		a.active AS ACTIVE
	FROM tadmin a ORDER BY [E-MAIL] DESC
END 
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--EXEC selectAdmin

--USE bdLaBanqueNationaleduQuebec
--GO
--DROP PROCEDURE selectAdmin

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT Conseil FROM bdLaBanqueNationaleduQuebec
-- 2.- selectConseil
-- =============================================

USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectConseil
AS BEGIN 
	SELECT
		a.idconseil AS ID,
		a.number AS NUMBER,
		CONCAT(a.nomdeFamille,' ',a.nom) AS NAME,
		a.courriel AS [E-MAIL],
		a.salary AS SALARY,
		a.sexe AS SEX,
		a.active AS ACTIVE,
		a.idbanque AS [ID BANK]
	FROM tconseil a ORDER BY SALARY DESC
END
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--EXEC selectConseil

--SELECT * FROM tconseil

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT Directeur FROM bdLaBanqueNationaleduQuebec
-- 3.- selectDirecteur
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectDirecteur
AS BEGIN 
	SELECT
		a.iddirecteur AS ID,
		a.number AS NUMBER,
		CONCAT(a.nomdeFamille,' ',a.nom) AS NAME,
		a.courriel AS [E-MAIL],
		a.salary AS SALARY,
		a.sexe AS SEX,
		a.active AS ACTIVE
	FROM tdirecteur a ORDER BY SALARY DESC
END 
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--EXEC selectDirecteur
--SELECT * FROM tdirecteur

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT Employe FROM bdLaBanqueNationaleduQuebec
-- 4.- selectEmploye
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectEmploye
AS BEGIN 
	SELECT
		x.idemploye AS ID,
		x.number AS NUMBER,
		CONCAT(x.nomdeFamille,' ',x.nom) AS NAME,
		x.courriel AS [E-MAIL],
		x.hiringDate AS [HAIRING DATE],
		x.salary AS SALARY,
		x.sexe AS SEX,
		x.active AS ACTIVE,
		x.idagences AS [ID AGENCES]
	FROM temploye x ORDER BY [ID AGENCES] ASC
END 
GO

--USE bdLaBanqueNationaleduQuebec
--GO
EXEC selectEmploye
SELECT * FROM temploye 

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2026-03-07
-- Description:	SELECT codeEmploye FROM bdLaBanqueNationaleduQuebec
-- 5.- selectCodeEmploye
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectCodeEmploye
AS BEGIN 
	SELECT
		x.idemploye AS idemployee,
		x.number AS 'Employee'
	FROM temploye x ORDER BY number ASC
END 
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--EXEC selectCodeEmploye
--SELECT * FROM temploye 

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT client FROM bdLaBanqueNationaleduQuebec
-- 6.- selectClient
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectClient
AS BEGIN 
	SELECT
		a.nomdeFamille AS 'NAME',
		a.nom AS 'LAST NAME',
		a.adresse AS 'ADDRESS',
		a.courriel AS [E-MAIL],
		a.number AS [NUMBER],
		a.numerodeCarte AS [CARD],
		a.nip AS NIP,
		a.active AS ACTIVE,
		b.nom AS 'AGENCE',
		b.adresse AS [AGENCE ADDRESS]
	FROM tclient a 
	left join tagences b
	on a.idagences=b.idagences
	ORDER BY b.number ASC, a.number  ASC
END
GO

USE bdLaBanqueNationaleduQuebec
GO
EXEC selectClient
--SELECT * from viewClient
--SELECT * FROM tclient
--DROP PROCEDURE selectClient


-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT clients by Condition FROM bdLaBanqueNationaleduQuebec
-- 7.- selectClientByCondition
-- =============================================

USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectClientByCondition
	@aCondition tv100 = null
AS BEGIN
	SELECT
		a.idclient AS "ID Client",
		a.number AS Number,
		CONCAT(CASE
				when a.sexe ='M' THEN 'Sir'
				when a.sexe='F' THEN 'Mrs' 
				END,
				'   ',a.nomdeFamille,'   ', a.nom) AS 'Client',
		a.courriel AS "e-Mail",
		a.img AS IMG,
		a.adresse AS Address,
		a.numerodeCarte AS "Card Number",
		a.nip AS NIP,
		a.active AS Active,
		---------------------------
		c.number AS 'Compte Number',
		c.balance AS 'Compte Balance',
		---------------------------
		d.accountType AS 'Type Acount',
		d.commission AS 'Commission',
		d.decouvert AS 'Overdraft',
		d.interetImmediat AS 'Interest Rate'
		---------------------------
	FROM tclient a
		left join tclient_compte b
		on a.idclient=b.idclient
		left join tcompte c
		on c.idcompte=b.idcompte
		left join ttypeCompte d
		on d.idtypeCompte=b.idtypeCompte
	WHERE a.number like @aCondition + '%'  or a.nom like @aCondition + '%' or a.nomdeFamille like @aCondition + '%'ORDER BY a.nom
END
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--drop procedure selectClientByCondition

--USE bdLaBanqueNationaleduQuebec
--GO
--EXEC selectClientByCondition
--@aCondition = 'M'

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT client by name AND typeCompte FROM bdLaBanqueNationaleduQuebec
-- 8.- selectClientbyNameandAccountType
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectClientbyNameandAccountType
	@aaccountType tv100 =null,
	@anomdeFamille tv100 =null
AS BEGIN
	DECLARE @setter tmoney; -- IMPORTANT REMARKS THE DECIMALS
	SET @setter=(SELECT commission FROM ttypeCompte WHERE accountType = @aaccountType);
	IF @setter=0  -- 'PaidAccount' comission = 0 
		SELECT
			-- tagence  a ------------------------------
	        a.number AS 'AGENCE CODE',
	    	CONCAT('Agence :','   ',a.nom) AS 'FILIAL AGENCE',
	    	a.adresse AS 'AGENCE ADDRESS',
			-- temploye b ------------------------------
			CONCAT(CASE
					WHEN b.sexe ='M' THEN 'Mr'
					WHEN b.sexe ='F' THEN 'Mrs'
					END,'   ',b.nomdeFamille, '   ', b.nom) AS EMPLOYEE,
		--	b.img AS 'Photo',
			-- tarea c  ------------------------------
			c.codearea AS 'AREA CODE',
	    	c.description AS AREA,
			-- tclient d  ------------------------------
			d.number AS 'ID Client',
			CONCAT(CASE
					WHEN d.sexe ='M' THEN 'Mr'
					WHEN d.sexe ='F' THEN 'Mrs'
					END,'   ',d.nomdeFamille, '   ', d.nom) AS CLIENT,
			-- ttypeCompte e --------------------------
			e.accountType AS 'Type account',
			-- tcompte f ------------------------------
			f.number AS 'COMPTE CODE',
		    f.balance AS 'BALANCE',
	    	f.dateOuverture AS 'OPENDATE',   --SELECT * FROM ttypeCompte
			-- ttypeCompte e --------------------------
			-- NOTE : comission Will NEVER BE CERO
			e.commission AS 'Comission',   -- UnPaidAccount  
			e.decouvert AS 'Overdraft'    -- UnPaidAccount
		FROM tclient d  
			left join tclient_compte P1 
			   on d.idclient=P1.idclient
			left join tcompte f 
			   on P1.idcompte =f.idcompte
			left join ttypeCompte e 
			   on e.idtypeCompte=P1.idtypeCompte
			left join tagences a 
			   on a.idagences=d.idagences
			left join temploye b
			   on b.idagences=a.idagences
			left join temploye_area P2
			on P2.idemploye=b.idemploye
			left join tarea c on c.codearea= P2.codearea
		WHERE d.nomdeFamille = @anomdeFamille  AND e.accountType = @aaccountType																	
	ELSE -- 'UnPaidAccount' comission = 0.12 
		SELECT 
			-- tagence  a ------------------------------
			a.number AS 'AGENCE CODE',
			CONCAT('Agence :','   ',a.nom) AS 'FILIAL AGENCE',
			a.adresse AS 'AGENCE ADDRESS',
			-- temploye b ------------------------------
			CONCAT(
					CASE
						WHEN b.sexe ='M' THEN 'Mr'
						WHEN b.sexe ='F' THEN 'Mrs'
					END,'   ',
				   b.nomdeFamille, '   ', b.nom) AS EMPLOYEE,
			-- tarea c  ------------------------------
			c.codearea AS 'AREA CODE',
	    	c.description AS AREA,
			-- tclient d  ------------------------------
			d.number AS 'ID Client',
			CONCAT(CASE
					WHEN d.sexe ='M' THEN 'Mr'
					WHEN d.sexe ='F' THEN 'Mrs'
					END,'   ',d.nomdeFamille, '   ', d.nom)  AS CLIENT,
			-- ttypeCompte e --------------------------
			e.accountType AS 'Type account',
			-- tcompte f ------------------------------
		f.number AS 'COMPTE CODE',
		f.balance AS 'BALANCE',
		f.dateOuverture AS 'OPENDATE',	
			-- ttypeCompte e --------------------------
			e.interetImmediat AS 'Interest' -- PaidAccount comission = 0
		FROM tclient d  
			left join tclient_compte P1 
			   on d.idclient=P1.idclient
			left join tcompte f 
			   on P1.idcompte =f.idcompte
			left join ttypeCompte e 
			   on e.idtypeCompte=P1.idtypeCompte
			left join tagences a 
			   on a.idagences=d.idagences
			left join temploye b
			   on b.idagences=a.idagences
			left join temploye_area P2
			on P2.idemploye=b.idemploye
			left join tarea c on c.codearea= P2.codearea
		WHERE d.nomdeFamille = @anomdeFamille  AND e.accountType = @aaccountType
END
GO		
USE bdLaBanqueNationaleduQuebec
GO
 EXEC  selectClientbyNameandAccountType
 @anomdeFamille = 'Oprah',
 @aaccountType = 'UnPaidcompte'

USE bdLaBanqueNationaleduQuebec
GO
 EXEC  selectClientbyNameandAccountType
 @anomdeFamille = 'Oprah',
 @aaccountType = 'Paidcompte'
DROP PROCEDURE selectClientbyNameandAccountType

-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	SELECT client by number FROM bdLaBanqueNationaleduQuebec
-- 9.- selectClientbyNumber
-- =============================================
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE selectClientbyNumber
	@aNumber tv100 = null
AS BEGIN
	SELECT
	a.idclient AS "ID Client",
	a.number AS Number,
	CONCAT(CASE
			when a.sexe ='M' THEN 'Sir'
			when a.sexe='F' THEN 'Mrs' 
			END,
			'   ',a.nomdeFamille,'   ', a.nom) AS 'Client',
	a.courriel AS "e-Mail",
	a.img AS IMG,
	a.adresse AS Address,
	a.numerodeCarte AS "Card Number",
	a.nip AS NIP,
	a.active AS Active,
	---------------------------
	c.number AS 'Compte Number',
	c.balance AS 'Compte Balance',
	---------------------------
	d.accountType AS 'Type Acount',
	d.commission AS 'Commission',
	d.decouvert AS 'Overdraft',
	d.interetImmediat AS 'Interest Rate'
	---------------------------
	FROM tclient a
	left join tclient_compte b
	on a.idclient=b.idclient
	left join tcompte c
	on c.idcompte=b.idcompte
	left join ttypeCompte d
	on d.idtypeCompte=b.idtypeCompte
	WHERE a.number like @aNumber + '%'  ORDER BY a.nom
END
GO

--USE bdLaBanqueNationaleduQuebec
--GO
--drop procedure selectClientbyNumber

 USE bdLaBanqueNationaleduQuebec
 GO
EXEC selectClientbyNumber
@aNumber = 'c1'


-- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-01-26
-- Description:	Find any count from any client from any agence
-- 10.- findAgenceByNumberClientNumberAndCompte
-- =============================================

USE bdLaBanqueNationaleduQuebec
GO

CREATE PROCEDURE findAgenceByNumberClientNumberAndCompte
	@aagenceNumber tv100 = null,
	@aclientNumber tv100 = null,
	@acompteNumber tv100 = null
AS BEGIN
	SELECT 
		-- tlabanqueduQuebec  a ------------------------------
		concat (a.number,'  ',a.nom) AS MATRIS,
		a.adresse AS DIRECTION,
		-- tagences  b ---------------------------------------
		concat (b.number,':  ',b.nom) AS AGENCE,
		b.adresse AS DIRECTION,
		-- tdirecteur  d -------------------------------------
		concat (CASE
				WHEN d.sexe ='M' THEN 'Mr'
				WHEN d.sexe ='F' THEN 'Mrs'
				END,'  ',d.nomdeFamille,'  ',d.nom) AS DIRECTEUR,
		-- temploye e ---------------------------------------- 
		CONCAT(CASE
				WHEN e.sexe ='M' THEN 'Mr'
				WHEN e.sexe ='F' THEN 'Mrs'
				END,'   ',e.nomdeFamille, '   ', e.nom) AS EMPLOYEE,
		-- tarea g -------------------------------------------- 
		CONCAT (g.codearea,':  ',g.description) AS AREA,
		-- tclient h ------------------------------------------
		CONCAT(h.number,':   ',
				CASE
				WHEN h.sexe ='M' THEN 'Mr'
				WHEN h.sexe ='F' THEN 'Mrs'
				END,'   ',h.nomdeFamille, '   ', h.nom) AS CLIENT,
		-- tcompte j ------------------------------------------
		j.number AS [ACCOUNT CODE],
		j.balance AS BALANCE,
		j.dateOuverture AS OUVERTURE,
		-- ttypeCompte k --------------------------------------		
		k.accountType AS ACCOUNT,
		k.commission AS COMMISSION,
		K.decouvert AS DECOUVERT,
		K.interetImmediat AS INTERET
	FROM [dbo].[tlabanqueduQuebec] a
		left join [dbo].[tagences] b
			on a.idbanque= b.idbanque
		left join  [dbo].[tdirecteur_agence] c
			on c.idagences=b.idagences
		left join tdirecteur d
			on d.iddirecteur=c.iddirecteur
		left join temploye e
			on e.idagences=b.idagences
		left join temploye_area f
			on f.idemploye=e.idemploye
		left join tarea g
			on g.codearea=f.codearea
		left join tclient h
			on h.idemploye=f.idemploye
		left join tclient_compte i
		   on i.idclient=h.idclient
		left join tcompte j
			on i.idcompte=j.idcompte
		left join ttypeCompte k
			on k.idtypeCompte=i.idtypeCompte
	WHERE h.number like @aclientNumber + '%' 
	  and b.number like @aagenceNumber + '%'
	  and j.number like @acompteNumber + '%'
END
GO

  --USE bdLaBanqueNationaleduQuebec
  --GO
  --EXEC findAgenceByNumberClientNumberAndCompte
  --@aagenceNumber = 'a',
  --@aclientNumber = 'c1',
  --@acompteNumber = 'PA1'

 -- SELECT * FROM tagences
 -- SELECT * FROM tclient

 -- select * from [dbo].[tcompte]
 -- select * from [dbo].[ttypeCompte]
 -- select * from [dbo].[tclient_compte]
 -- select * from [dbo].[ttransaction]
 
 -- =============================================
-- Special Stored Procedures
-- Author:		Ricardo Mendoza
-- Create date: 2025-02-28
-- Name : sp_ClientOperation
-- Description:	Show Client Operations
--11.- sp_ClientOperation
-- =============================================

USE bdLaBanqueNationaleduQuebec
GO
--DROP PROC sp_ClientOperation
CREATE PROCEDURE sp_ClientOperation
	@anumerodeCarte [dbo].[tv100]= null,
	@anumber [dbo].[tv100]= null
AS BEGIN
		SELECT
		r.CLIENT,
		r.NIP,
		r.CARTE,
		r.[ACCOUNT TYPE],
		r.NUMBER,
		r.DATE AS 'DATE dOPÉRATION',
		r.deposer AS 'MONTANT DÉPOSÉ',
		r.retirer AS 'MONTANT RETIRÉ',
		r.BALANCE AS SOLDE
	FROM ttransaction r --WHERE r.CARTE = 123489 and r.NUMBER = 'PA7PA7'
	WHERE r.CARTE = @anumerodeCarte and r.NUMBER = @anumber ORDER BY r.DATE asc
END
GO

--EXEC sp_ClientOperation
--	@anumerodeCarte = 123489,
--	@anumber = 'PA7PA7'

--	EXEC sp_ClientOperation
--	@anumerodeCarte = 123459,
--	@anumber = 'PA4PA4'

--	EXEC sp_ClientOperation
--	@anumerodeCarte = 123499,
--	@anumber = 'PA8PA8'

--	EXEC sp_ClientOperation
--	@anumerodeCarte = 123899,
--	@anumber = 'UA12UA12'

	--UPDATE  tcompte set number = 'PA12PA12' where idcompte = 169

	
-- -----------------------------------------------------
-- 8. PROCEDURE selectqclientByemployeeNumber
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE PROC selectqclientByemployeeNumber
@aemployeeNummber varchar (45) = null
AS
BEGIN
SELECT
a.idclient,
a.clientNumber,
case
when a.sexe ='M' THEN 'Monsieur'
WHEN a.sexe ='F' THEN 'Madame'
END AS 'Genre',
a.name,
a.lastName,
a.email,
b.name as 'Agency',
c.employeeNumber as 'Employee',
concat(c.lastName,' ',c.name) As 'Employee name',
a.img,
a.address,
a.cardNumber,
a.nip,
a.idagences,
a.idemployee,
a.sexe
FROM
tclient	 a inner join tagences b on a.idagences=b.idagences
inner join temployee c on a.idemployee=c.idemployee
WHERE c.employeeNumber = @aemployeeNummber
END
GO