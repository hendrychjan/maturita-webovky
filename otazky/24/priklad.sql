-- Vybrat databázi
USE WA4_skola;

-- ==== 1. Vypsat seznam skupin ve třídách ve tvaru "označení třídy - označení skupiny" ====
SELECT 
CONCAT(WA4_tridy.Oznaceni, ' - ', WA4_skupiny.Oznaceni) 
FROM WA4_skupiny
LEFT JOIN WA4_tridy ON WA4_tridy.idTridy = WA4_skupiny.idTridy;


-- ==== 2. Datum zadání známky a její hodnotu s růzými podmínkami ====
-- pozn: datum zadání známky bude ve formátu "d. m. rrrr."

-- Datumy v určitém rozmezí (známky za březen)
SELECT
DATE_FORMAT(WA4_znamky.Datum, '%d. %m. %Y') AS Datum_zadání,
WA4_znamky.hodnota AS Známka
FROM WA4_znamky
WHERE Datum >= DATE('2017-03-01')
AND Datum <=  DATE('2017-03-31')
ORDER BY WA4_znamky.Datum ASC;

-- Známky v určitém rozmezí (lepší než 3)
SELECT
DATE_FORMAT(WA4_znamky.Datum, '%d. %m. %Y') AS Datum_zadání,
WA4_znamky.Hodnota AS Známka
FROM WA4_znamky
WHERE Hodnota < 3
ORDER BY WA4_znamky.Hodnota DESC;

-- Známky konkrétní hodnoty (pětky)
SELECT
DATE_FORMAT(WA4_znamky.Datum, '%d. %m. %Y') AS Datum_zadání,
WA4_znamky.Hodnota AS Známka
FROM WA4_znamky
WHERE Hodnota = 5
ORDER BY WA4_znamky.Datum ASC;

-- Známky konkrétního žáka
SELECT
DATE_FORMAT(WA4_znamky.Datum, '%d. %m. %Y') AS Datum_zadání,
WA4_znamky.Hodnota AS Známka,
CONCAT(WA4_zaci.Jmeno, ' ', WA4_zaci.Prijmeni) AS Žák
FROM WA4_znamky
LEFT JOIN WA4_zaci ON WA4_zaci.idZaci = WA4_znamky.idZaci
WHERE WA4_zaci.Jmeno = 'Jan' AND WA4_zaci.Prijmeni = 'Palme'
ORDER BY WA4_znamky.Datum ASC;