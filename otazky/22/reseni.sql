-- ===================================================================
-- 1. Příprava na změny
-- ===================================================================

-- Pro práci vybrat databázi "skola"
USE skola;

-- Uložit původní stav tabulky zaci
RENAME TABLE zaci TO zaci_puvodni;

-- Připravit novou strukturu pro žáky
CREATE TABLE zaci (
    id int NOT NULL AUTO_INCREMENT,
    jmenoPrijmeni varchar(255) NOT NULL,
    datumNarozeni date NOT NULL,
    trida int NOT NULL,
    PRIMARY KEY (id)
);



-- ===================================================================
-- 2. Přesunout učitele do zvláštní třídy
-- ===================================================================

-- Vytvořit tabulku pro učitele
CREATE TABLE ucitele (
    id int NOT NULL AUTO_INCREMENT,
    jmenoPrijmeni varchar(255) NOT NULL,
    PRIMARY KEY (id)
);



-- ===================================================================
-- 3. přesunout třídy do samostatné tabulky
-- ===================================================================

-- Vytvořit tabulku pro třídy + navázat na učitele
CREATE TABLE tridy (
    id int NOT NULL AUTO_INCREMENT,
    nazev varchar(255) NOT NULL,
    idTridnihoUcitele int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idTridnihoUcitele) REFERENCES ucitele(id)
);

-- Napojit tridy na zaci
ALTER TABLE zaci
ADD FOREIGN KEY (trida) REFERENCES tridy(id);



-- ===================================================================
-- 4. Přesunout kontakty do zvláštní tabulky
-- ===================================================================

-- Vytvořit tabulku pro kontakty
CREATE TABLE kontakty (
    idZaka int NOT NULL,
    kontakt varchar(255) NOT NULL,
    PRIMARY KEY (idZaka, kontakt)
);



-- ===================================================================
-- 5. Naplnit nové struktury starými daty
-- ===================================================================

INSERT INTO ucitele (id, jmenoPrijmeni) VALUES
(NULL, 'Ing. Jan Novák'),
(NULL, 'Mgr. Světlana Hubáčková');

INSERT INTO tridy (id, nazev, idTridnihoUcitele) VALUES
(NULL, '1.A', 1),
(NULL, '1.B', 2);

INSERT INTO zaci (id, jmenoPrijmeni, datumNarozeni, trida) VALUES
(NULL, 'Jiří Žák', '1996-05-08', 1),
(NULL, 'Karel Šmíd', '1996-02-13', 1),
(NULL, 'Petr Hudec', '1997-07-18', 2);

INSERT INTO kontakty (idZaka, kontakt) VALUES
(1, '721987654'),
(1, '602123456'),
(1, '466741852'),
(2, '737951267'),
(2, '465123789'),
(2, '604843642'),
(3, '474148624'),
(3, '608112456'),
(3, '729927813');



-- ===================================================================
-- 6. Zkontrolovat provedené změny na některých příkladech
-- ===================================================================

-- Příklad: Zjištění třídního učitele žáka "Hudec"
SELECT ucitele.jmenoPrijmeni FROM zaci
LEFT JOIN tridy ON zaci.trida = tridy.id
LEFT JOIN ucitele ON tridy.idTridnihoUcitele = ucitele.id
WHERE zaci.jmenoPrijmeni LIKE '%Hudec%';

-- Příklad: Zjištění kontaktu na žáka "Šmíd"
SELECT kontakty.kontakt FROM zaci
LEFT JOIN kontakty ON kontakty.idZaka = zaci.id
WHERE zaci.jmenoPrijmeni LIKE '%Šmíd%';



-- ===================================================================
-- 7. Odstranit původní tabulku
-- ===================================================================
DROP TABLE zaci_puvodni;