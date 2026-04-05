-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2026 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : app-Bancaire-POO-SQL-Server > https://github.com/RicardoAMendoza/app-Bancaire-POO-SQL-Server/tree/master
-- Project : 3.LaBanqueNationaleduQuebec
-- Instruction :
-- Copy and paste on SqlServer New Query and run it. That will create the tables

-- Ricardo Mendoza (c) 2026

------ INDEX

USE bdLaBanqueNationaleduQuebec
GO
------ 1.
--SELECT * FROM  tlabanqueduQuebec
------ 2.
--SELECT * FROM tconseil
------ 3.
--SELECT * FROM tdirecteur
------ 4.
--SELECT * FROM tagences
------ 5.
--SELECT * FROM [dbo].[tdirecteur_agence]
------ 6.
--SELECT * FROM tarea
------ 7.
--SELECT * FROM temploye
------ 8.
--SELECT * FROM temploye_area
------ 9.
--SELECT * FROM tclient
------ 10.
--SELECT * FROM tcompte
------ 11.
--SELECT * FROM ttypeCompte
------ 12.
--SELECT * FROM tclient_compte
------ 13.
--SELECT * FROM ttransaction
------ 14.
--SELECT * FROM tadmin

-- -----------------------------------------------------
-- 1.- Table `bdLaBanqueNationaleduQuebec`.`tlabanqueduQuebec ` 
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
create table tlabanqueduQuebec(
idbanque int IDENTITY (10,10)
)
ALTER TABLE tlabanqueduQuebec ADD number int
ALTER TABLE tlabanqueduQuebec ADD nom tv100
ALTER Table tlabanqueduQuebec 
ADD capital DECIMAL(22,6) NULL DEFAULT NULL
ALTER Table tlabanqueduQuebec ADD adresse tv100
-- CONSTRAINTS -- --------------------------------------
ALTER Table tlabanqueduQuebec add 
CONSTRAINT pk_idbanque PRIMARY KEY(idbanque)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tlabanqueduQuebec]

-- -----------------------------------------------------
-- 2.- Table `bdLaBanqueNationaleduQuebec`.` tconseil`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tconseil(
idconseil int IDENTITY(10,10)
)
ALTER TABLE tconseil add idbanque int NOT NULL
ALTER TABLE tconseil add number tv100
ALTER TABLE tconseil add nomdeFamille tv100
ALTER TABLE tconseil add nom tv100
ALTER TABLE tconseil add courriel tv100
ALTER TABLE tconseil add img tv100
ALTER TABLE tconseil add salary tmoney
ALTER TABLE tconseil add sexe tv1
ALTER TABLE tconseil add active tv1
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tconseil add 
CONSTRAINT pk_idbanque_idconseil primary key (idbanque,idconseil)
ALTER TABLE tconseil add 
CONSTRAINT fk_tconseil_idbanque FOREIGN KEY(idbanque) 
references tlabanqueduQuebec(idbanque)

--USE bdLaBanqueNationaleduQuebec
--GO
-- SELECT * FROM [dbo].[tconseil]

-- -----------------------------------------------------
-- 3.- Table `bdLaBanqueNationaleduQuebec`.` tdirecteur`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tdirecteur(
iddirecteur int IDENTITY (10,10)
)
ALTER TABLE tdirecteur add number tv100
ALTER TABLE tdirecteur add nomdeFamille tv100
ALTER TABLE tdirecteur add nom tv100
ALTER TABLE tdirecteur add courriel tv100
ALTER Table tdirecteur add img tv100
ALTER TABLE tdirecteur add salary tmoney
ALTER TABLE tdirecteur add sexe tv1
ALTER Table tdirecteur add active tv1
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tdirecteur add
constraint pk_iddirecteur PRIMARY KEY(iddirecteur)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tdirecteur]


-- -----------------------------------------------------
-- 4.- Table `bdLaBanqueNationaleduQuebec`.` tagences`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tagences(
idagences int IDENTITY (10,10)
)
ALTER TABLE tagences add number tv100
ALTER Table tagences add nom tv100
ALTER TABLE tagences add adresse tv100
ALTER TABLE tagences add idbanque int NOT NULL
-- ALTER TABLE tagences add iddirecteur int NOT NULL
-- CONSTRAINTS -- ----------------------------------------
ALTER TABLE tagences add
CONSTRAINT pk_idagences PRIMARY KEY (idagences)
ALTER TABLE tagences add
CONSTRAINT fk_tagences_idbanque FOREIGN KEY(idbanque) 
REFERENCES tlabanqueduQuebec(idbanque)
-- ALTER TABLE tagences ADD
-- CONSTRAINT fk_tagences_iddirecteur FOREIGN KEY(iddirecteur)
-- REFERENCES tdirecteur(iddirecteur)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM tagences

-- -----------------------------------------------------
-- 5.- Table `bdLaBanqueNationaleduQuebec`.` tdirecteur_agences`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tdirecteur_agence(
iddirecteur int NOT NULL,
idagences int NOT NULL
)
-- CONSTRAINTS -- ----------------------------------------
ALTER TABLE tdirecteur_agence ADD 
CONSTRAINT fk_tdirecteur_agence_iddirecteur FOREIGN KEY(iddirecteur)
REFERENCES tdirecteur(iddirecteur)
ALTER TABLE tdirecteur_agence ADD
CONSTRAINT fk_tdirecteur_agence_idagences FOREIGN KEY(idagences)
REFERENCES tagences(idagences)


-- -----------------------------------------------------
-- 6.- Table `bdLaBanqueNationaleduQuebec`.` tarea`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tarea(
codearea tv3
)

ALTER TABLE tarea add description tv100
ALTER TABLE tarea ALTER COLUMN codearea tv3 NOT NULL
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tarea ADD
CONSTRAINT pk_tarea_codearea PRIMARY KEY(codearea)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM tarea

-- -----------------------------------------------------
-- 7.- Table `bdLaBanqueNationaleduQuebec`.` temploye`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE temploye(
idemploye int IDENTITY(10,10)
)

ALTER TABLE temploye ADD number tv100
ALTER TABLE temploye ADD nomdeFamille tv100
ALTER TABLE temploye ADD nom tv100
ALTER TABLE temploye ADD courriel tv100
ALTER TABLE temploye ADD img tv100
ALTER TABLE temploye ADD hiringDate DATE NULL
ALTER TABLE temploye add salary tmoney
ALTER TABLE temploye ADD sexe tv1
ALTER TABLE temploye ADD active tv1
ALTER TABLE temploye ADD idagences int NOT NULL
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE temploye ADD
CONSTRAINT pk_idemploye PRIMARY KEY(idemploye)
ALTER TABLE temploye ADD 
CONSTRAINT fk_temploye_idagences FOREIGN KEY (idagences) 
REFERENCES tagences(idagences)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM temploye

-- -----------------------------------------------------
-- 8.- Table `bdLaBanqueNationaleduQuebec`.`temploye_area`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE temploye_area(
idemploye int NOT NULL
)
ALTER TABLE temploye_area ADD codearea tv3 NOT NULL
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE temploye_area ADD
CONSTRAINT fk_temploye_idemploye FOREIGN KEY(idemploye)
REFERENCES temploye(idemploye)
ALTER TABLE temploye_area ADD
CONSTRAINT fk_tarea_codearea FOREIGN KEY(codearea)
REFERENCES tarea(codearea)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM temploye_area

-- -----------------------------------------------------
-- 9.- Table `bdLaBanqueNationaleduQuebec`.`tclient`
-- -----------------------------------------------------
CREATE TABLE tclient(
idclient int IDENTITY(10,10)
)
ALTER TABLE tclient ADD number tv100
ALTER TABLE tclient ADD nomdeFamille tv100
ALTER TABLE tclient ADD nom tv100
ALTER TABLE tclient ADD courriel tv100
ALTER TABLE tclient ADD img tv100
ALTER TABLE tclient ADD adresse tv100
-- ALTER TABLE tclient ADD numerodeCarte tv100
ALTER TABLE tclient ADD numerodeCarte int
ALTER TABLE tclient ADD nip tv100
ALTER TABLE tclient ADD sexe tv1
ALTER TABLE tclient ADD age int
ALTER TABLE tclient ADD active tv1
ALTER TABLE tclient ADD idagences int
ALTER TABLE tclient ADD idemploye int
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tclient ADD
CONSTRAINT pk_idclient PRIMARY KEY (idclient)
ALTER TABLE tclient ADD 
CONSTRAINT fk_tclient_idagences FOREIGN KEY (idagences)
REFERENCES tagences(idagences)
-- CASCADE -- ------------------------------------------
-- idagences
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE tclient ADD
CONSTRAINT fk_tclient_idemploye FOREIGN KEY (idemploye)
REFERENCES temploye(idemploye)
-- CASCADE -- ------------------------------------------
-- idemploye
ON UPDATE CASCADE
ON DELETE CASCADE

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tclient]

-- -----------------------------------------------------
-- 	10.- Table `bdLaBanqueNationaleduQuebec`.`tcompte`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
CREATE TABLE tcompte(
idcompte int IDENTITY (10,10)
)
--ALTER TABLE tarea ALTER COLUMN codearea tv3 NOT NULL
ALTER TABLE tcompte ADD number tv100 NULL default NULL
--ALTER TABLE [dbo].[tcompte] ALTER COLUMN [number] tv3 NOT NULL
--ALTER TABLE [dbo].[tcompte] ALTER COLUMN [number] tv3 NULL
ALTER TABLE tcompte ADD balance tmoney
-- -----------------------------------------------------
ALTER TABLE tcompte ADD deposer tmoney
ALTER TABLE tcompte ADD retirer tmoney
ALTER TABLE tcompte ADD dateOperation DATE NOT NULL
ALTER TABLE tcompte ALTER COLUMN dateOperation DATE NULL
-- -----------------------------------------------------
ALTER TABLE tcompte ADD dateOuverture DATE NOT NULL
ALTER TABLE tcompte ADD dateCloture DATE NOT NULL
ALTER TABLE tcompte ADD idemploye int NOT NULL
ALTER TABLE tcompte ADD idagences int NOT NULL
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tcompte ADD
CONSTRAINT pk_idcompte PRIMARY KEY(idcompte)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tcompte]

-- -----------------------------------------------------
-- 11.- Table `bdLaBanqueNationaleduQuebec`.`ttypeCompte`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
CREATE TABLE ttypeCompte(
idtypeCompte int IDENTITY(10,10)
)
ALTER TABLE ttypeCompte ADD accountType tv100
ALTER TABLE ttypeCompte ADD commission tmoney
ALTER TABLE ttypeCompte ADD decouvert tmoney
ALTER TABLE ttypeCompte ADD interetImmediat tmoney
-- ALTER TABLE ttypeCompte ADD interetImmediat tmoney
-- ALTER TABLE ttypeCompte -- --------------------------
ALTER TABLE ttypeCompte ALTER COLUMN interetImmediat float
ALTER TABLE ttypeCompte ALTER COLUMN commission float
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE ttypeCompte ADD 
CONSTRAINT pk_idtypeCompte PRIMARY KEY(idtypeCompte)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[ttypeCompte]

-- -----------------------------------------------------
-- 12.- Table `bdLaBanqueNationaleduQuebec`.`tclient_compte`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tclient_compte(
idtypeCompte int NOT NULL,
idclient int NOT NULL,
idcompte int NOT NULL
)
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tclient_compte ADD
CONSTRAINT pk_tclient_compte_idtypeCompte_idclient
PRIMARY KEY (idtypeCompte,idclient)
-- CONSTRAINTS -- FOREIGN KEY --------------------------
ALTER TABLE tclient_compte ADD
CONSTRAINT fk_tclient_compte_idtypeCompe FOREIGN KEY(idtypeCompte)
REFERENCES ttypeCompte
ALTER TABLE tclient_compte ADD
CONSTRAINT fk_tclient_compte_idclient FOREIGN KEY(idclient)
REFERENCES tclient(idclient)
-- CASCADE -- ------------------------------------------
-- idclient
ON UPDATE CASCADE
ON DELETE CASCADE

ALTER TABLE tclient_compte ADD
CONSTRAINT fk_tclient_compte_idcompte FOREIGN KEY (idcompte)
REFERENCES tcompte(idcompte)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tclient_compte]

-- -----------------------------------------------------
-- 13.- Table `bdLaBanqueNationaleduQuebec`.`ttransaction`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
CREATE TABLE ttransaction(
idtransaction int IDENTITY(10,10)
)
-- -----------------------------------------------------
ALTER TABLE ttransaction ADD idcompte int NULL DEFAULT NULL
ALTER TABLE ttransaction ALTER COLUMN idcompte int NOT NULL
-- -----------------------------------------------------
ALTER TABLE ttransaction ADD [CLIENT CODE] tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD CLIENT tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD NIP tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD SEXE tv1 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD AGE int NULL DEFAULT NULL
ALTER TABLE ttransaction ADD CARTE tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD AGENCES tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD [ACCOUNT TYPE] tv100 NULL DEFAULT NULL
ALTER TABLE ttransaction ADD NUMBER tv100 NULL DEFAULT NULL
-- OPERATION --------------------------------------------
ALTER TABLE ttransaction ADD deposer tmoney
ALTER TABLE ttransaction ADD retirer tmoney
ALTER TABLE ttransaction ADD BALANCE tmoney NULL DEFAULT NULL
ALTER TABLE ttransaction ADD COMMISSION tmoney NULL DEFAULT NULL
ALTER TABLE ttransaction ADD DECOUVERT tmoney NULL DEFAULT NULL
ALTER TABLE ttransaction ADD INTERET tmoney NULL DEFAULT NULL
ALTER TABLE ttransaction ADD [DATE] DATETIME2 NULL DEFAULT NULL
-- CONSTRAINTS -- FOREIGN KEY --------------------------
ALTER TABLE ttransaction ADD
CONSTRAINT fk_ttransaction_idcompte FOREIGN KEY (idcompte) 
REFERENCES tcompte(idcompte)

 --USE bdLaBanqueNationaleduQuebec
 --GO
 --DROP TABLE ttransaction
 --DROP TABLE tclient_compte
 --DROP TABLE ttypeCompte
 --drop table tcompte

--USE bdLaBanquenationale
--GO
--SELECT * FROM [dbo].[ttransaction]
--select * from ttypeCompte
--select * from tcompte

-- -----------------------------------------------------
-- 14.- Table `bdLaBanqueNationaleduQuebec`.`tadmin`
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

CREATE TABLE tadmin(
idadmin int IDENTITY(10,10)
)
ALTER TABLE tadmin ADD number tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD nomdeFamille tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD nom tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD courriel tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD img tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD utilisateur tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD motdePasse tv100 NULL DEFAULT NULL
ALTER TABLE tadmin ADD sexe tv1 NULL DEFAULT NULL
ALTER TABLE tadmin ADD active tv1 NULL DEFAULT NULL
-- CONSTRAINTS -- --------------------------------------
ALTER TABLE tadmin ADD
CONSTRAINT pk_idadmin PRIMARY KEY(idadmin)

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM [dbo].[tadmin]