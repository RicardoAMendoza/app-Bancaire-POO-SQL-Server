-- This project uses the following licenses:
-- MIT License
-- Copyright (c) 2024 Ricardo Alfredo Mendoza Cortes 
-- Montréal Québec Canada

-- Repository : MVC_winapp_NationalBank_SqlServer > https://github.com/RicardoAMendoza/MVC_winapp_NationalBank_SqlServer.git
-- Project : prjWeb_MVC_LaBanquenationale_Rm
-- Instruction :
-- Copy and paste on SqlServer script and run it. That will create de data base


-- -----------------------------------------------------
-- 1. EXEC  sp_save_LaBanqueNationale
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

EXEC sp_save_tlabanqueduQuebec
@aidbanque =0,
@anumber = "LaBanqueNationale",
@anom = "La Banque Nationale",
@acapital = 100000000,
@aadresse = "1000 rue Masson, Mntreal, Canada, H4N3N1"

--USE [bdLaBanqueNationaleduQuebec]
--GO
--SELECT * FROM tlabanqueduQuebec

-- -----------------------------------------------------
-- 2. EXEC  sp_save_tconseil
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO
-- ---------------------------- Patrick

EXEC  sp_save_tconseil
@aidconseil = 0,
@anumber ="dir01",
@anomdeFamille ="Patrick",
@anom = "Dorre",
@acourriel = "dorre@gmail.com",
@aimg ="dorre.png",
@asalary = 80000,
@asexe ="M",
@aactive="A",
@aidbanque = 10

-- ---------------------------- Tonye
EXEC  sp_save_tconseil
@aidconseil = 0,
@anumber = "dir02",
@anomdeFamille = "Fernand",
@anom = "Bikatal-Bi-Tonye",
@acourriel = "bikatal@gmail.com",
@aimg = "fernand.png",
@asalary = 90000,
@asexe = 'M',
@aactive ="A", 
@aidbanque = 10

-- ---------------------------- Saint
EXEC sp_save_tconseil
@aidconseil = 0,
@anumber = "dir03",
@anomdeFamille = "Richard",
@anom = "Saint-Vingt-Cent",
@acourriel = "bikatal@gmail.com",
@aimg = "richard.png",
@asalary = 60000,
@asexe = 'M',
@aactive ="N",
@aidbanque = 10

--USE [bdLaBanqueNationaleduQuebec]
--GO
--SELECT * FROM tlaBanquenationale
--SELECT * FROM tconseil

-- -----------------------------------------------------
-- 3. EXEC  sp_save_tdirecteur
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO
-- ---------------------------- Patrick
EXEC  sp_save_tdirecteur
@aiddirecteur = 0,
@anumber ="dir01",
@anomdeFamille ="Patrick",
@anom = "Dorre",
@acourriel = "dorre@gmail.com",
@aimg ="dorre.png",
@asalary = 80000,
@asexe ="M",
@aactive="A"

-- ---------------------------- Tonye
EXEC  sp_save_tdirecteur
@aiddirecteur = 0,
@anumber = "dir02",
@anomdeFamille = "Fernand",
@anom = "Bikatal-Bi-Tonye",
@acourriel = "bikatal@gmail.com",
@aimg = "fernand.png",
@asalary = 90000,
@asexe = 'M',
@aactive ="N" 

-- ---------------------------- Saint
EXEC  sp_save_tdirecteur
@aiddirecteur = 0,
@anumber = "dir03",
@anomdeFamille = "Richard",
@anom = "Saint-Vingt-Cent",
@acourriel = "bikatal@gmail.com",
@aimg = "richard.png",
@asalary = 60000,
@asexe = 'M',
@aactive ="A" 

-- ---------------------------- Andy
EXEC  sp_save_tdirecteur
@aiddirecteur = 0,
@anumber = "dir04",
@anomdeFamille = "Andy",
@anom = "DelRisco",
@acourriel = "DelRisco@gmail.com",
@aimg = "andy.png",
@asalary = 90000,
@asexe = 'M',
@aactive ="A" 

--USE [bdLaBanqueNationaleduQuebec]
--GO
--SELECT * FROM tdirecteur

-- -----------------------------------------------------
-- 4.- EXEC sp_save_tagences
-- -----------------------------------------------------

EXEC sp_save_tagences
@aidagences=0,
@anumber ="A1A1",
@anom ="Rosemont NB",
@aadresse ="3540 rue Msson, Rosemont, Montrela, 3H1N4L",
@aidbanque =10
--@aiddirecteur = 10

EXEC sp_save_tagences
@aidagences = 0,
@anumber = 'A2A2',
@anom = 'MontRoyal NB',
@aadresse = '3131 Guy, MontRoyal, Montreal, 4J5W3L',
@aidbanque = 10
--@aiddirecteur = 20

EXEC sp_save_tagences
@aidagences = 0,
@anumber = 'A3A3',
@anom = 'Beaubien NB',
@aadresse = '247 Beaubien, Roemont, Montreal, 3H5Y7A',
@aidbanque = 10
--@aiddirecteur = 30

EXEC sp_save_tagences
@aidagences = 0,
@anumber = 'A4A4',
@anom = 'Alexander NB',
@aadresse = '456 Alexander, Montreal Nort, Montreal, 3R78U9',
@aidbanque = 10
--@aiddirecteur = 20

--USE [bdLaBanqueNationaleduQuebec]
--GO
--SELECT * FROM tlabanqueduQuebec
--SELECT * FROM tdirecteur
--SELECT * FROM tagences

-- -----------------------------------------------------
-- 5. EXEC [dbo].[sp_save_tdirecteur_agences]
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

EXEC [dbo].[sp_save_tdirecteur_agences]
@aiddirecteur = 40,
@aidagences = 10

EXEC [dbo].[sp_save_tdirecteur_agences]
@aiddirecteur = 30,
@aidagences = 20

EXEC [dbo].[sp_save_tdirecteur_agences]
@aiddirecteur = 20,
@aidagences = 30

EXEC [dbo].[sp_save_tdirecteur_agences]
@aiddirecteur = 10,
@aidagences = 40

-- -----------------------------------------------------
-- 6. EXEC sp_save_tarea
-- -----------------------------------------------------

USE [bdLaBanqueNationaleduQuebec]
GO

EXEC sp_save_tarea
@acodearea = [FIN],
@adescription = 'Finances'

EXEC sp_save_tarea
@acodearea = [INS],
@adescription = 'Insurances'

EXEC sp_save_tarea
@acodearea = [INV],
@adescription = 'Investments'

EXEC sp_save_tarea
@acodearea = [SAV],
@adescription = 'Savings'

EXEC sp_save_tarea
@acodearea = [CON],
@adescription = 'Contable'

--SELECT * FROM tarea

-- -----------------------------------------------------
-- 6. EXEC sp_save_temploye 
-- -----------------------------------------------------

USE bdLaBanqueNationaleduQuebec
GO

EXEC sp_save_temploye 
@aidemploye  = 0,
@anumber  = 'E1E1',
@anomdeFamille  = 'Juan',
@anom = 'Zamanego',
@acourriel  = 'zamanego@gamil.com',
@aimg  = 'zamanego.png',
@ahiringDate  = '2017-02-23',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 10

EXEC sp_save_temploye 
@aidemploye  = 0,
@anumber  = 'E3E3',
@anomdeFamille  = 'Cesar',
@anom = 'Silva',
@acourriel  = 'cesar@gmail.com',
@aimg  = 'silva.png',
@ahiringDate  = '2014-09-19',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 20

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E4E4',
@anomdeFamille  = 'Ana',
@anom = 'Fernandez',
@acourriel  = 'fernandez@gmail.com',
@aimg  = 'fernandez.png',
@ahiringDate  = '2013-11-15',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 30

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E2E2',
@anomdeFamille  = 'Rauoul',
@anom = 'Nguiya',
@acourriel  = 'raoul@gmail.com',
@aimg  = 'nguiya.png',
@ahiringDate  = '2013-03-23',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 40

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E5E5',
@anomdeFamille  = 'Maria',
@anom = 'Houda',
@acourriel  = 'maria@google.com',
@aimg  = 'houda.png',
@ahiringDate  = '2012-01-01',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 10

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E6E6',
@anomdeFamille  = 'Maria',
@anom = 'Arteaga',
@acourriel  = 'arteaga@gmail.com',
@aimg  = 'arteaga.png',
@ahiringDate  = '2011-02-03',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 20

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E7E7',
@anomdeFamille  = 'Maria',
@anom = 'Madany',
@acourriel  = 'madany@google.com',
@aimg  = 'madany.png',
@ahiringDate  = '2015-08-10',
@asalary = 100000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 30

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E8E8',
@anomdeFamille  = 'Roseely',
@anom = 'Brand',
@acourriel  = 'brand@gmail.com',
@aimg  = 'brand.png',
@ahiringDate  = '2012-05-13',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 40

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E10E10',
@anomdeFamille  = 'Esmeralda',
@anom = 'Mafogue',
@acourriel  = 'esmeralda@gmail.com',
@aimg  = 'mafogue.png',
@ahiringDate  = '2000-09-02',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 10

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E9E9',
@anomdeFamille  = 'Silvayn',
@anom = 'Trudeau',
@acourriel  = 'trudeau@gmail.com',
@aimg  = 'trudeau.png',
@ahiringDate  = '2012-04-21',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 20

EXEC [dbo].[sp_save_temploye ]  
@aidemploye  = 0,
@anumber  = 'E11E11',
@anomdeFamille  = 'Brack',
@anom = 'Obama',
@acourriel  = 'obama@gamil.com',
@aimg  = 'brand.png',
@ahiringDate  = '1999-01-12',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 30

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E12E12',
@anomdeFamille  = 'Benoit',
@anom = 'Fracoise',
@acourriel  = 'benoit@gmail.com',
@aimg  = 'francoise.png',
@ahiringDate  = '1998-04-03',
@asalary = 150000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 40

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E13E13',
@anomdeFamille  = 'Helena',
@anom = 'Gonzalez',
@acourriel  = 'gonzalez@google.com',
@aimg  = 'gonzalez.png',
@ahiringDate  = '2015-08-10',
@asalary = 450000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 10

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E14E14',
@anomdeFamille  = 'Diana',
@anom = 'Rosamonte',
@acourriel  = 'rosamonte@google.com',
@aimg  = 'rosamonte.png',
@ahiringDate  = '2022-01-23',
@asalary = 250000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 20

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E15E15',
@anomdeFamille  = 'Claudia',
@anom = 'Sheinbown',
@acourriel  = 'sheinbown@google.com',
@aimg  = 'sheinbown.png',
@ahiringDate  = '2023-09-10',
@asalary = 150000.99,
@asexe = 'F',
@aactive = 'A',
@aidagences = 30

EXEC [dbo].[sp_save_temploye ] 
@aidemploye  = 0,
@anumber  = 'E16E16',
@anomdeFamille  = 'Andres',
@anom = 'Lopez',
@acourriel  = 'lopez@google.com',
@aimg  = 'lopez.png',
@ahiringDate  = '2018-09-02',
@asalary = 350000.99,
@asexe = 'M',
@aactive = 'A',
@aidagences = 40

USE bdLaBanqueNationaleduQuebec
GO
--SELECT * FROM tagences
--SELECT * FROM temploye

-- -----------------------------------------------------
-- 7. EXEC sp_save_temploye_area
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

EXEC sp_save_temploye_area
@aidemploye = 10,
@acodearea = 'FIN'

EXEC sp_save_temploye_area
@aidemploye = 20,
@acodearea = 'FIN'

EXEC sp_save_temploye_area
@aidemploye = 30,
@acodearea = 'FIN'

EXEC sp_save_temploye_area
@aidemploye = 40,
@acodearea = 'INS'

EXEC sp_save_temploye_area
@aidemploye = 50,
@acodearea = 'INS'

EXEC sp_save_temploye_area
@aidemploye = 60,
@acodearea = 'INS'

EXEC sp_save_temploye_area
@aidemploye = 70,
@acodearea = 'INV'

EXEC sp_save_temploye_area
@aidemploye = 80,
@acodearea = 'INV'

EXEC sp_save_temploye_area
@aidemploye = 90,
@acodearea = 'INV'

EXEC sp_save_temploye_area
@aidemploye  = 100,
@acodearea = 'SAV'

EXEC sp_save_temploye_area
@aidemploye  = 110,
@acodearea = 'SAV'

EXEC sp_save_temploye_area
@aidemploye = 120,
@acodearea = 'SAV'

EXEC sp_save_temploye_area
@aidemploye = 130,
@acodearea = 'CON'

EXEC sp_save_temploye_area
@aidemploye = 140,
@acodearea = 'CON'

EXEC sp_save_temploye_area
@aidemploye = 150,
@acodearea = 'CON'

EXEC sp_save_temploye_area
@aidemploye = 160,
@acodearea = 'CON'

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM temploye
--SELECT * FROM temploye_area
--SELECT * FROM tarea

-- -----------------------------------------------------
-- 8. EXEC sp_save_tclient
-- -----------------------------------------------------

USE [bdLaBanqueNationaleduQuebec]
GO

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C1C1',
@anomdeFamille  = 'Bill',
@anom  = 'Gates',
@acourriel  = 'gates@microsoft.com',
@aimg  = 'gates.png',
@aadresse  = '3540 Masson',
@anumerodeCarte = '123456',
@anip  = 'windows',
@asexe = 'M',
@aage  = 56,
@aactive = 'A',
@aidagences  = 10,
@aidemploye = 10


EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C2C2',
@anomdeFamille = 'Steve',
@anom  = 'Jobs',
@acourriel  = 'jobs@apple.com',
@aimg  = 'jobs.png',
@aadresse  = '148 Cousineau',
@anumerodeCarte = '123457',
@anip  = 'iphone',
@asexe = 'M',
@aage  = 63,
@aactive = 'A',
@aidagences  = 10,
@aidemploye = 30

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C3C3',
@anomdeFamille = 'Oprah',
@anom  = 'Winfreh',
@acourriel  = 'oprah@google.com',
@aimg  = 'winfreh.png',
@aadresse  = '3030 Hochelaga',
@anumerodeCarte = '123458',
@anip  = 'own',
@asexe = 'F',
@aage  = 49,
@aactive = 'A',
@aidagences  = 10,
@aidemploye = 40

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C4C4',
@anomdeFamille = 'Rosa',
@anom  = 'Huerta',
@acourriel  = 'huerta@google.com',
@aimg  = 'huerta.png',
@aadresse  = '227 Belanger',
@anumerodeCarte = '123469',
@anip  = 'hidrogeno',
@asexe = 'F',
@aage  = 55,
@aactive = 'A',
@aidagences  = 20,
@aidemploye = 60

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C5C5',
@anomdeFamille = 'Salvador',
@anom  = 'Dali',
@acourriel  = 'dali@google.com',
@aimg  = 'dali.png',
@aadresse  = '1545 La Jounnesse',
@anumerodeCarte = '123459',
@anip  = 'pintor',
@asexe = 'M',
@aage  = 65,
@aactive = 'A',
@aidagences  = 20,
@aidemploye = 50

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C6C6',
@anomdeFamille = 'Wendy',
@anom  = 'Savala',
@acourriel  = 'savala@google.com',
@aimg  = 'savala.png',
@aadresse  = '3030 Hochelaga',
@anumerodeCarte = '123479',
@anip  = 'cpp',
@asexe = 'F',
@aage  = 34,
@aactive = 'A',
@aidagences  = 20,
@aidemploye = 70

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C7C7',
@anomdeFamille = 'Mark',
@anom  = 'Zurembek',
@acourriel  = 'mark@facebook.com',
@aimg  = 'zurembek.png',
@aadresse  = '616 Place Brazeau',
@anumerodeCarte = '123489',
@anip  = 'facebook',
@asexe = 'F',
@aage  = 35,
@aactive = 'A',
@aidagences  = 30,
@aidemploye = 80

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C8C8',
@anomdeFamille = 'Antonio',
@anom  = 'Maya',
@acourriel  = 'maya@facebook.com',
@aimg  = 'maya.png',
@aadresse  = '316 Chilpa',
@anumerodeCarte = '123499',
@anip  = 'alfonso13',
@asexe = 'M',
@aage  = 44,
@aactive = 'A',
@aidagences  = 30,
@aidemploye = 90

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C9C9',
@anomdeFamille = 'Itzel',
@anom  = 'Alvaro',
@acourriel  = 'itzel@facebook.com',
@aimg  = 'alvaro.png',
@aadresse  = '527 Alexander',
@anumerodeCarte = '123599',
@anip  = 'quimica',
@asexe = 'M',
@aage  = 24,
@aactive = 'A',
@aidagences  = 30,
@aidemploye = 100

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C10C10',
@anomdeFamille = 'Fanny',
@anom  = 'Santos',
@acourriel  = 'santos@facebook.com',
@aimg  = 'santos.png',
@aadresse  = '333 Saint-Croax',
@anumerodeCarte = '123699',
@anip  = 'pasteles',
@asexe = 'F',
@aage  = 54,
@aactive = 'A',
@aidagences  = 40,
@aidemploye = 110

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C11C11',
@anomdeFamille = 'Manuel',
@anom  = 'Brizuela',
@acourriel  = 'brizuela@facebook.com',
@aimg  = 'brizuela.png',
@aadresse  = '148 Cousineau',
@anumerodeCarte = '123799',
@anip  = 'construccion',
@asexe = 'M',
@aage  = 55,
@aactive = 'A',
@aidagences  = 40,
@aidemploye = 120

EXEC sp_save_tclient
@aidclient = 0,
@anumber  = 'C12C12',
@anomdeFamille = 'Pedro',
@anom  = 'Espana',
@acourriel  = 'espana@facebook.com',
@aimg  = 'espana.png',
@aadresse  = '555 Tacherau',
@anumerodeCarte = '123899',
@anip  = 'soldadura',
@asexe = 'M',
@aage  = 34,
@aactive = 'A',
@aidagences  = 40,
@aidemploye = 10

USE bdLaBanqueNationaleduQuebec
GO
SELECT * FROM tagences
SELECT * FROM temploye
SELECT * FROM tclient

-- -----------------------------------------------------
-- 9. EXEC sp_save_tcompte
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

-- C1C1 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA1UA1",
@abalance = 2300,
@adateOuverture  = '2016-08-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 10,
@aidagences  = 10

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA1PA1",
@abalance = 2999,
@adateOuverture   = '2016-08-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 10,
@aidagences  = 10

-- C2C2 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA2UA2",
@abalance = 2000,
@adateOuverture  = '2018-12-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 20,
@aidagences  = 10

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA2PA2",
@abalance = 2999,
@adateOuverture  = '2016-08-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 20,
@aidagences  = 10

-- C3C3 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA3UA3",
@abalance = 4900,
@adateOuverture  = '2011-09-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 30,
@aidagences  = 10

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA3PA3",
@abalance = 9999,
@adateOuverture  = '2012-08-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 30,
@aidagences  = 10

-- C4C4 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA4UA4",
@abalance = 19000,
@adateOuverture  = '2013-02-17 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 40,
@aidagences  = 20

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA4PA4",
@abalance = 2399,
@adateOuverture  = '2011-03-11 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 40,
@aidagences  = 20

 -- C5C5 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA5UA5",
@abalance = 20000,
@adateOuverture  = '2000-02-07 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 50,
@aidagences  = 20

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA5PA5",
@abalance = 2399,
@adateOuverture  = '2000-03-02 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 50,
@aidagences  = 20

-- C6C6 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA6UA6",
@abalance = 18000,
@adateOuverture  = '2009-02-24 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 60,
@aidagences  = 20

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA6PA6",
@abalance = 15000,
@adateOuverture  = '2009-02-24 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 60,
@aidagences  = 20

-- C7C7 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA7UA7",
@abalance = 13000,
@adateOuverture  = '2010-04-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 70,
@aidagences  = 30

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA7PA7",
@abalance = 7000,
@adateOuverture  = '2010-04-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 70,
@aidagences  = 30

-- C8C8 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA8UA8",
@abalance = 9000,
@adateOuverture  = '2013-04-26 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 80,
@aidagences  = 30

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA8PA8",
@abalance = 15000,
@adateOuverture  = '2013-04-26 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 80,
@aidagences  = 30

-- C9C9 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA9UA9",
@abalance = 18000,
@adateOuverture  = '2006-03-30 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 90,
@aidagences  = 30

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA9PA9",
@abalance = 14000,
@adateOuverture  = '2006-03-30 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 90,
@aidagences  = 30

-- C10C10 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA10UA10",
@abalance = 9000,
@adateOuverture  = '2007-03-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 100,
@aidagences  = 40

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA10PA10",
@abalance = 7000,
@adateOuverture  = '2007-03-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 100,
@aidagences  = 40

-- C11C11 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA11UA11",
@abalance = 2300,
@adateOuverture  = '1998-01-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 110,
@aidagences  = 40

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA11PA11",
@abalance = 700,
@adateOuverture  = '1998-01-21 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 110,
@aidagences  = 40

-- C12C12 ----------------------------
EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "UA12UA12",
@abalance = 21000,
@adateOuverture  = '1996-01-15 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 120,
@aidagences  = 40

EXEC sp_save_tcompte
@aidcompte  = 0,
@anumber = "PA12PA12",
@abalance = 16000,
@adateOuverture  = '1996-01-15 23:59:59',
@adateCloture = '2023-08-17 23:59:59',
@aidemploye  = 120,
@aidagences  = 40

--USE bdLaBanqueNationaleduQuebec
--GO
--SELECT * FROM temploye
--SELECT * FROM tagences
--SELECT * FROM tcompte
--delete from tcompte where idcompte=175
-- -----------------------------------------------------
-- 10. EXEC sp_save_ttypeCompte
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

 EXEC sp_save_ttypeCompte
 @aidtypeCompte = 0,
 @aaccountType = UnPaidcompte,
 @acommission = 0.12,
 @adecouvert = 2000,
 @ainteretImmediat = 0
 
 EXEC sp_save_ttypeCompte
 @aidtypeCompte = 0,
 @aaccountType = Paidcompte,
 @acommission = 0,
 @adecouvert = 0,
 @ainteretImmediat = 0.15

--USE [bdLaBanqueNationaleduQuebec]
--GO
 --SELECT * FROM ttypeCompte

-- -----------------------------------------------------
-- 11. EXEC sp_save_tclient_compte
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO
---- C1C1 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 10,
@aidcompte = 10

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 10,
@aidcompte = 20

-- C2C2 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 20,
@aidcompte = 30

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 20,
@aidcompte = 40

-- C3C3 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 30,
@aidcompte = 50

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 30,
@aidcompte = 60

-- C4C4 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 40,
@aidcompte = 70

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 40,
@aidcompte = 80

 -- C5C5 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 50,
@aidcompte = 90

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 50,
@aidcompte = 100

-- C6C6 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 60,
@aidcompte = 110

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 60,
@aidcompte = 120

-- C7C7 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 70,
@aidcompte = 130

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 70,
@aidcompte = 140

-- C8C8 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 80,
@aidcompte = 150

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 80,
@aidcompte = 160

-- C9C9 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 90,
@aidcompte = 170

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 90,
@aidcompte = 180

-- C10C10 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 100,
@aidcompte = 190

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 100,
@aidcompte = 200

-- C11C11 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 110,
@aidcompte = 210

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 110,
@aidcompte = 220

-- C12C12 ----------------------------
EXEC sp_save_tclient_compte
@aidtypeCompte = 10,
@aidclient = 120,
@aidcompte = 230

EXEC sp_save_tclient_compte
@aidtypeCompte = 20,
@aidclient = 120,
@aidcompte = 240

--USE [bdLaBanqueNationaleduQuebec]
--GO
--SELECT * FROM ttypeCompte
--SELECT * FROM tclient
--SELECT * FROM tcompte
--SELECT * FROM tclient_compte

--SELECT * FROM ttransaction

-- -----------------------------------------------------
-- 13. EXEC sp_save_admin
-- -----------------------------------------------------
USE [bdLaBanqueNationaleduQuebec]
GO

EXEC [dbo].[sp_save_tadmin] 
@aidadmin  = 0,
@anumber = 'Ad01',
@anomdeFamille = 'Andy',
@anom = 'Garcia',
@acourriel = 'garcia@teccart.qc.ca',
@aimg = 'andy.png',
@autilisateur = 'andydelRisco',
@amotdePasse = 'sql',
@asexe = 'M',
@aactive = 'A'

EXEC [dbo].[sp_save_tadmin] 
@aidadmin  = 0,
@anumber = 'Ad02',
@anomdeFamille = 'Ricardo',
@anom = 'Mendoza',
@acourriel = 'omnimtv@gmail.com',
@aimg = 'ricardo.png',
@autilisateur = 'omniMendoza',
@amotdePasse = 'omni',
@asexe = 'M',
@aactive = 'A'

EXEC [dbo].[sp_save_tadmin] 
@aidadmin  = 0,
@anumber = 'Ad03',
@anomdeFamille = 'Ricker',
@anom = 'Alcindor',
@acourriel = 'rickers@teccart.qc.ca',
@aimg = 'rickers.png',
@autilisateur = 'sqlServer',
@amotdePasse = 'dataPower',
@asexe = 'M',
@aactive = 'A'

--SELECT * FROM tadmin
