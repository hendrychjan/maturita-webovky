-- Vytvořit databázi "priklad"
CREATE DATABASE priklad;

-- Nove vytvořenou databázi vybrat - následující příkazy
-- se budou provádět nad ní
USE priklad;

-- Vytvořit tabulku pro uživatele
CREATE TABLE Uzivatele (
    Id int NOT NULL AUTO_INCREMENT,
    Jmeno varchar(255),
    Prijmeni varchar(255),
    Skupina int NOT NULL,
    PRIMARY KEY (Id)
);

-- Vytvořit tabulku pro skupiny uživatel
CREATE TABLE Skupiny (
    Id int NOT NULL AUTO_INCREMENT,
    Nazev varchar(255),
    PRIMARY KEY (Id)
);

-- Vytvořit tabulku pro ukládání souborů
CREATE TABLE Soubory (
    Id int NOT NULL AUTO_INCREMENT,
    Nazev varchar(255),
    Obsah LONGBLOB, -- datový typ pro binárně zakódované soubory
    Skupina int NOT NULL,
    PRIMARY KEY (Id)
);

-- N:N relace pro Soubory:Skupiny
-- Jeden soubor může patřit do více skupin a zároveň
-- do jedné skupiny může patřit více souborů
CREATE TABLE Soubory_Skupiny (
    IdSouboru int NOT NULL,
    IdSkupiny int NOT NULL,
    PRIMARY KEY (IdSouboru, IdSkupiny)
);

-- N:1 relace pro Uživatelé:Skupiny
-- Každý uživatel může patřit právě do jedné skupiny, do
-- jedné skupiny pak může patřit více uživatelů
ALTER TABLE Uzivatele
ADD FOREIGN KEY (Skupina) REFERENCES Skupiny(Id);

-- Doplnění relačních klíčů do korelační tabulky Soubory:Skupiny
ALTER TABLE Soubory_Skupiny
ADD FOREIGN KEY (IdSouboru) REFERENCES Soubory(Id),
ADD FOREIGN KEY (IdSkupiny) REFERENCES Skupiny(Id);
