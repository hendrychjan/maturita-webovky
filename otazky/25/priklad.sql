-- Vybrat databázi
USE WA4_skola;

-- ==== 1. Jména a příjmení žáků a jim příslušné třídy
SELECT
CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák,
WA4_tridy.Oznaceni AS Třída
FROM WA4_zaci
LEFT JOIN WA4_tridy ON WA4_tridy.idTridy = WA4_zaci.idTridy;


-- ==== 2. Vypsat známky - datum zadání, hodnotu, jméno a příjmení žáka, předmět ====
SELECT
DATE_FORMAT(WA4_znamky.Datum, '%d. %m. %Y') AS Datum_zadání,
WA4_znamky.Hodnota,
CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák,
WA4_predmety.Nazev AS Předmět
FROM WA4_znamky
LEFT JOIN WA4_zaci ON WA4_zaci.idZaci = WA4_znamky.idZaci
LEFT JOIN WA4_vyucovaneskupiny ON WA4_vyucovaneskupiny.idVyucovaneSkupiny = WA4_znamky.idVyucovaneSkupiny
LEFT JOIN WA4_predmety ON WA4_predmety.idPredmety = WA4_vyucovaneskupiny.idPredmety
ORDER BY WA4_znamky.Datum ASC;


-- ==== 3. Všechny žáky, kteří nemají žádný záznam o známce ====
SELECT CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák
FROM WA4_zaci
LEFT JOIN WA4_znamky ON WA4_znamky.idZaci = WA4_zaci.idZaci
WHERE WA4_znamky.Hodnota IS NULL
ORDER BY WA4_zaci.Prijmeni;


-- ==== 4. Celkové množství známek jednotlivých žáků ====
SELECT
CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák,
COUNT(WA4_znamky.Hodnota) AS Počet_známek
FROM WA4_zaci
LEFT JOIN WA4_znamky ON WA4_zaci.idZaci = WA4_znamky.idZaci
GROUP BY WA4_zaci.Prijmeni
ORDER BY WA4_zaci.Prijmeni;


-- ==== 5. Seznam žáků jedné třídy (1.E) s výpisem skupin, do kterých jsou jednotlivci zařazeni ====
SELECT
CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák,
GROUP_CONCAT(
    DISTINCT WA4_skupiny.Oznaceni
    ORDER BY WA4_skupiny.Oznaceni
    SEPARATOR ';'
) AS Skupiny
FROM WA4_skupinyzaku
LEFT JOIN WA4_zaci ON WA4_zaci.idZaci = WA4_skupinyzaku.idZaci
LEFT JOIN WA4_skupiny ON WA4_skupiny.idSkupiny = WA4_skupinyzaku.idSkupiny
LEFT JOIN WA4_tridy ON WA4_tridy.idTridy = WA4_zaci.idTridy
WHERE WA4_tridy.Oznaceni LIKE '1.E'
GROUP BY WA4_zaci.idZaci
ORDER BY WA4_zaci.idZaci;