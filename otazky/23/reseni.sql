-- Pozn: POZOR!! při prohlížení nespouštět celé sql najednou,
-- příklady na sebe nenavazují, ale vzájemně se mohou ovlivnit,
-- takže zkoušet jedno po druhém (zkopírovat a spustit)

-- Vybrat databázi
USE wa4_skola;

-- Přidat položku do tabulky predmety
INSERT INTO predmety (idPredmety, Zkratka, Nazev) VALUES
(NULL, 'AJ', 'Angličtina');

-- Změnit váhu známky ze zkoušení na hodnotu 1
UPDATE kategorieznamek
SET Vaha = 1
WHERE Nazev = 'Zkoušení';

-- Odstranit položku z tabulky zaci
DELETE FROM zaci
WHERE idZaci = 1;

-- Odstranit ty učitele z tabulky 'vyucujici', kteří nevyučují žádný předmět
DELETE FROM vyucujici
WHERE vyucujici.idVyucujici NOT IN (SELECT vyucovaneskupiny.idVyucujici FROM vyucovaneskupiny);

-- Vyprázdnit celou tabulku
TRUNCATE TABLE znamky;

-- Odstranit celou tabulku
DROP TABLE znamky;