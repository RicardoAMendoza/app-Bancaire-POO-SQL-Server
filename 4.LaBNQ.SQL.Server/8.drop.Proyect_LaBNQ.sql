-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2026 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : app-Bancaire-POO-SQL-Server > https://github.com/RicardoAMendoza/app-Bancaire-POO-SQL-Server/tree/master
-- Project : 3.LaBanqueNationaleduQuebec
-- Instruction :
-- Copy and paste on SqlServer New Query and run it. That will drop the project

-- Ricardo Mendoza (c) 2026

USE bdLaBanqueNationaleduQuebec
GO

--DROP DATABASE bdLaBanqueNationaleduQuebec

-- -----------------------------------------------------
-- Drop Tables 
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO

-- 1.
DROP TABLE tconseil
-- 2.
DROP TABLE temploye_area
-- 3.
DROP TABLE tarea
-- 4.
DROP TABLE ttransaction
-- 5.
DROP TABLE tclient_compte
-- 6.
DROP TABLE tcompte
-- 7.
DROP TABLE ttypeCompte
-- 8.
DROP TABLE tclient
-- 9.
DROP TABLE temploye
-- 10.
DROP TABLE tadmin
-- 11.
DROP TABLE [dbo].[tdirecteur_agence]
-- 12.
DROP TABLE tdirecteur
-- 13.
DROP TABLE tagences
-- 14.
DROP TABLE tlabanqueduQuebec

-- -----------------------------------------------------
-- DROP PROCEDURE 
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
-- =====================================================
-- Stored Procedures for Data
-- =====================================================
-- 1.
DROP PROCEDURE sp_save_tlabanqueduQuebec
-- 2.
DROP PROCEDURE sp_save_tconseil
-- 3.
DROP PROCEDURE sp_save_tdirecteur
-- 4.
DROP PROCEDURE sp_save_tagences
-- 5.
DROP PROCEDURE sp_save_tdirecteur_agences
-- 6.
DROP PROCEDURE sp_save_tarea
-- 7.
DROP PROCEDURE sp_save_temploye
-- 8.
DROP PROCEDURE sp_save_temploye_area
-- 9.
DROP PROCEDURE sp_save_tclient
-- 10.
DROP PROCEDURE sp_save_tcompte
-- 11.
DROP PROCEDURE sp_save_ttypeCompte
-- 12.
DROP PROCEDURE sp_save_tclient_compte
-- 13.
DROP PROCEDURE[dbo].[sp_save_tadmin]
-- =====================================================
-- Special Stored Procedures
-- =====================================================
-- 1.ok
DROP PROCEDURE [dbo].[selectAdmin]
-- 2.ok
DROP PROCEDURE [dbo].[selectConseil]
-- 3.ok
DROP PROCEDURE [dbo].[selectDirecteur]
-- 4.ok
DROP PROCEDURE [dbo].[selectEmploye]
-- 5.ok 
DROP PROCEDURE selectCodeEmploye
-- 6.ok
DROP PROCEDURE [dbo].[selectClient]
-- 7.ok
DROP PROCEDURE [dbo].[selectClientByCondition]
-- 8.ok
DROP PROCEDURE [dbo].[selectClientbyNameandAccountType]
-- 9.ok
DROP PROCEDURE [dbo].[selectClientbyNumber]
-- 10.ok
DROP PROCEDURE findAgenceByNumberClientNumberAndCompte
-- 11.ok
DROP PROCEDURE sp_ClientOperation
-- 12.ok
DROP PROCEDURE selectqclientByemployeeNumber
-- 13.
DROP PROCEDURE [dbo].[sp_AccountTransaction]
-- 14.
DROP PROCEDURE [dbo].[sp_transaction_fpadepotdArgent]
-- 15.
DROP PROCEDURE [dbo].[sp_transaction_fparetraitsdArgent]
-- 16.
DROP PROCEDURE [dbo].[sp_transaction_fuadepotdArgent]
-- 17.
DROP PROCEDURE [dbo].[sp_transaction_fuaretraitsdArgent]
-- 18.
DROP PROCEDURE [dbo].[selectAgences]
-- 19.
DROP PROCEDURE [dbo].[selectCodeEmploye]

-- -----------------------------------------------------
--DROP PROCEDURE [dbo].[selectqClientByNumber]
-- =====================================================
-- Transaction Stored Procedures
-- =====================================================
--USE bdLaBanqueNationaleduQuebec
--GO
--DROP PROCEDURE sp_AccountTransaction

-- -----------------------------------------------------
-- Drop Views 
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO
-- 1.
drop view [dbo].[viewClient]
-- 2.
drop view [dbo].[viewClentComptes]
-- 3.
drop view [dbo].[viewAgences]
-- 4.
drop view [dbo].[viewCompte]
-- 5.
drop VIEW viewAgences_employee_Client
-- 6.
drop view viewLaBanqueduQuebec
-- 7.
drop view [dbo].[viewACCOUNT]

-- -----------------------------------------------------
-- Drop Types 
-- -----------------------------------------------------
USE bdLaBanqueNationaleduQuebec
GO
-- 1.
DROP TYPE tv100
-- 2.
DROP TYPE tv3
-- 3.
DROP TYPE tv1
-- 4.
DROP TYPE tmoney

-- -----------------------------------------------------
-- Drop Functions 
-- -----------------------------------------------------

-- 1.
DROP FUNCTION [dbo].[fpadepotdArgent]
-- 2.
DROP FUNCTION [dbo].[fparetraitsdArgent]
-- 3.
DROP FUNCTION [dbo].[fuadepotdArgent]
-- 4.
DROP FUNCTION [dbo].[fuaretraitsdArgent]
