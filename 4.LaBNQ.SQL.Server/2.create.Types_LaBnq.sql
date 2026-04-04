-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2026 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : app-Bancaire-POO-SQL-Server > https://github.com/RicardoAMendoza/app-Bancaire-POO-SQL-Server/tree/master
-- Project : 3.LaBanqueNationaleduQuebec
-- Instruction :
-- Copy and paste on SqlServer New Query and run it. That will create the types

-- Ricardo Mendoza (c) 2026

-- -----------------------------------------------------
-- Create Types 
-- -----------------------------------------------------

use [bdLaBanqueNationaleduQuebec]
go

create type tv100 from VARCHAR(100) NULL
create type tmoney from money NULL
create type tv3 from VARCHAR(3) NULL
create type tv1 from VARCHAR(1) NULL