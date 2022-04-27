-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Počítač: localhost:3306
-- Vytvořeno: Pon 17. pro 2018, 06:49
-- Verze serveru: 10.1.37-MariaDB-0+deb9u1
-- Verze PHP: 7.0.30-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `bajer_4`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Struktura tabulky `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `alias` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `nadrazena` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazev`, `alias`, `nadrazena`) VALUES
(10, 'Potravinové doplňky', 'potravinove-doplnky', NULL),
(11, 'Proteiny', 'proteiny', 10),
(12, 'Gainery', 'gainery', 10),
(13, 'BCAA', 'bcaa', 10),
(14, 'Vitamíny', 'vitaminy', 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `produkty`
--

CREATE TABLE `produkty` (
  `id` int(10) UNSIGNED NOT NULL,
  `nazev` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8_czech_ci NOT NULL,
  `kategorie` int(10) UNSIGNED NOT NULL,
  `cena` decimal(8,2) NOT NULL,
  `popis` varchar(1000) COLLATE utf8_czech_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `produkty`
--

INSERT INTO `produkty` (`id`, `nazev`, `alias`, `kategorie`, `cena`, `popis`) VALUES
(10, 'Whey Core 100', 'whey-core-100', 11, '700.00', 'Vítěz chuťových testů! Whey Core 100 se pyšní obsahem kvalitních a rychle vstřebatelných bílkovin (76 %), vynikající chutí a výbornou rozmíchatelností. 100 % čistý syrovátkový protein s vysokou biologickou hodnotou a rychlou vstřebatelností. Je vhodný jak pro kondičně cvičící, tak i pro začínající kulturisty, silové a fitness sportovce. Je vyrobený z těch nejlepších a 100 % čistých proteinových zdrojů, a to z WPC (syrovátkový proteinový koncentrát) a z WPI (syrovátkový proteinový izolát).'),
(11, 'Ultra Speed 80 Fair Power', 'ultra-speed-80-fair-power', 11, '1399.00', 'Ultra Speed 80 Fair Power ® je svým složením i vlastnostmi jedním z nejlepších dostupných proteinových suplementů v České republice. Je složený ze tří nejkvalitnějších zdrojů bílkovin, obsahuje plně instantní (= snadno rozpustný) syrovátkový nativní CFM mikrofiltrovaný proteinový koncentrát, dále pak instantní syrovátkový nativní CFM mikrofiltrovaný proteinový izolát a také syrovátkový enzymaticky štěpený hydrolyzovaný proteinový koncentrát s nejvyšším možným stupněm hydrolýzy DH32. Neobsahuje lepek.'),
(12, 'Whey Cream 100 Fair Power', 'whey-cream-100-fair-power', 11, '1099.00', 'Whey Cream 100 Fair Power ® vyniká prvotřídním složením, nezaměnitelnou krémovou chutí a perfektní rozpustností (je plně instantní). Whey Cream 100 Fair Power ® kombinuje kvalitní nativní mikrofiltrovaný izolát syrovátkové bílkoviny (WPI CFM) a ultrafiltrovaný syrovátkový koncentrát (WPC UF). Whey Cream 100 Fair Power ® také obsahuje unikátní trávicí enzym Tolerázu ®, který je špičkou mezi enzymy a podporuje stravitelnost mléčných proteinových suplementů. Toleráza ® se stará o bezproblémové trávení mléčného cukru – laktózy.'),
(13, 'IsoTech Whey 94', 'isotech-whey-94', 11, '949.00', 'IsoTech Whey 94 elitní německé značky All Stars obsahuje izolát z nejčistšího zdroje syrovátkového proteinu, který je na trhu. Tento špičkový výrobek obsahuje absolutní minimum laktózy, neobsahuje ani žádné méně hodnotné bílkoviny! Perfektní vstřebatelnost proteinu s absolutním minimem tuku a sacharidů předurčuje výrobek k využití téměř při všech tělesných aktivitách, silových i vytrvalostních sportech. Je nenahraditelným proteinovým koncentrátem jak při předsoutěžních dietách kulturistů a fitness kategorií, tak u kondičních cvičenců, kteří chtějí zvýšit podíl aktivní svalové hmoty a současně snížit procento podkožního tuku'),
(14, 'Hy-Pro 85', 'hy-pro-85', 11, '559.00', 'Vysoce hodnotný 85 % protein elitní německé značky All Stars. Je ideálním zdrojem k zajištění dostatečného příjmu kvalitních bílkovin potřebných k optimálnímu růstu svalové hmoty a regeneraci organismu po fyzickém výkonu. Hy-Pro 85 poskytuje 4 rozdílné hodnotné bílkovinné složky (kasein, mléčný protein, syrovátka, vaječný albumin) bez rostlinných nebo jiných méně kvalitních bílkovin.'),
(15, 'Maxx Gain 15', 'maxx-gain-15', 12, '358.00', 'Maxx Gain 15 se řadí mezi špičkové gainery s perfektním vyvážením živin. Obsahuje unikátní kombinaci mono a polysacharidů, které zajišťují rovnoměrné vylučování inzulínu, a tím dochází k maximálnímu ukládání glykogenu do svalových buněk. To řadí Maxx Gain 15 mezi nejlepší dostupné gainery na trhu. Použitím vysoce kvalitních bílkovinových zdrojů na bázi koncentrátu syrovátkové bílkoviny WPC je zaručena rychlá stravitelnost a maximální využitelnost v organismu. Obsahuje kreatin. Vhodné pro amatérské i vrcholové sportovce. Neobsahuje aspartam.'),
(16, 'Muscle Gain 15 Fair Power', 'muscle-gain-15-fair-power', 12, '549.00', 'Muscle Gain 15 Fair Power ® je sacharido-proteinovým suplementem určeným pro všechny sportovce, kteří usilují o nárůst svalové hmoty i síly, a také pro všechny sportovce, kteří kvůli vysokému energetickému výdeji potřebují doplňovat zásoby energie. Muscle Gain 15 Fair Power ® je tak vhodný jak pro sportovce silových sportů (kulturistika, silový trojboj, strongman), tak také například pro hokejisty či vytrvalostní běžce. Produkt obsahuje tři různé zdroje sacharidů s převážně rychlejším uvolňováním (velmi rychlá glukóza, středně rychlý maltodextrin a menší přídavek pomalé palatinózy) a celkem šest základních zdrojů bílkovin (od velmi rychlého syrovátkového hydrolyzátu DH32 až po nejpomalejší micelární kasein). V neposlední řadě obsahuje i komplex sedmi trávicích enzymů. Výraznou výhodou produktu je fakt, že stejně jako ostatní sacharidové i proteinové suplementy značky Survival přesně zveřejňuje procentuální zastoupení jednotlivých složek a Vy tak máte přesný přehled o složení a víte, co'),
(17, 'BeefMass', 'beefmass', 12, '424.00', 'Značkový hovězí proteinový izolát HydroBEEF® (hydrolyzované hovězí peptidy) s obsahem 97 % hovězích bílkovin tvoří proteinový základ gaineru BeefMass ®. Ten jsme doplnili kvalitním matrixem sacharidů pro maximální nárůst síly a svalové hmoty. BeefMass ® je nový gainer, který obsahuje hydrolyzovanou izolovanou hovězí bílkovinu, jejíž předností je prakticky nulový obsah tuku a cukru. Hovězí proteinový izolát HydroBEEF® je jeden z nejkvalitnějších bílkovinných zdrojů. Užívání hovězí bílkoviny má v silových sportech dlouhou tradici. BeefMass ® je určen pro všechny, kdo usilují o nárůst svalové hmoty a síly.\r\nBeefMass ® příchuti čokoláda neobsahuje laktózu.'),
(18, 'G15 Anabolic Gainer', 'g15-anabolic-gainer', 12, '959.00', 'G15 Anabolic Gainer je pokročilejší a zdokonalenou verzí populárního gaineru G 15! Jedná se o vynikající prostředek pro každého, kdo chce velmi rychle zvýšit hmotnost a objem svalstva. Proteinovou složku jsme vyladili tak, že nyní obsahuje ty nejlepší proteiny vůbec! Výhradně whey (syrovátkové) koncentráty a izoláty a 3 hydrolyzované syrovátkové proteiny s vynikající využitelností pro růst svalové hmoty. G 15 obsahuje 15 % top proteinů a 71% velmi kvalitních sacharidů s postupným nástupem účinku.'),
(19, 'Palatinose Gain 20 Fair Power', 'palatinose-gain-20-fair-power', 12, '1499.00', 'Palatinose Gain 20 Fair Power ® je sacharido-proteinovým přípravkem určeným pro silové sportovce, kteří usilují o nárůst svalové hmoty a síly, zároveň je ale vhodný i pro všechny sportovce vytrvalostního zaměření, kteří kvůli náročným tréninkovým programům trpí nedostatkem energie či úbytkem váhy. Palatinose Gain 20 Fair Power ® obsahuje směs sacharidů (z nich 40 % tvoří pomalu se uvolňující palatinóza), bílkovin (největší podíl syrovátkový koncentrát a micelární kasein), dále pak přídavek volných aminokyselin BCAA (4 % produktu) a také taurinu a L-glycinu. V neposlední řadě produkt obsahuje i komplex trávicích enzymů DigeZyme ®. Díky uvedenému složení, dobré rozpustnosti i chuti je gainer jednou z nejlepších možných voleb na současném českém trhu. Navíc, podíváte-li se na složení, najdete v něm procentuálně uvedené zastoupení všech klíčových složek sacharidů i bílkovin, díky čemuž získáváte absolutní přehled o složení. Jeho čistotu, kvalitu i maximální jakost použitých surovin garantu'),
(20, 'Mass Gain', 'mass-gain', 12, '342.00', 'Gainer s obsahem 20 % bílkovin pro nastartování regenerace a pro podporu nárůstu svalové hmoty. Bílkovinná složka je tvořená 100 % WPC (syrovátkový proteinový koncentrát). Plnohodnotný sacharidový komplex doplňuje několik druhů sacharidů - a to isomaltulóza (Palatinose ®), glukóza, maltodextrin a fruktóza. Je určen pro budování svalové hmoty, pro zlepšení regenerace, jako zdroj energie před fyzickou aktivitou.'),
(21, 'Extrifit High Whey 80', 'extrifit-high-whey-80', 11, '33.00', 'High Whey je špičkový 100 % syrovátkový proteinový koncentrát a CFM proteinový izolát.'),
(22, 'Women Line Shape Protein', 'women-line-shape-protein', 11, '30.00', 'Určen především pro aktivní ženy.'),
(23, 'Scitec 100 Whey Protein', 'scitec-100-whey-protein', 11, '731.00', 'Syrovátkový produkt s obsahem 77 % bílkovin s nízkým obsahem tuků a laktózy.'),
(24, 'Scitec Protein Pudding', 'scitec-protein-pudding', 11, '329.00', 'Proteinový pudink, který disponuje 75% obsahem syrovátkových a kaseinových bílkovin a necelými 2 gramy cukru i tuku v jedné dávce.'),
(25, 'EnergyBody Mega Protein', 'energybody-mega-protein', 11, '349.00', 'Špičkový protein od německé značky EnergyBody.'),
(26, 'TPW PROTEIN PANCAKE MIX', 'tpw-protein-pancake-mix', 11, '349.00', 'Obsahuje vysokou dávku proteinu, sacharidy s nízkým glykemickým indexem, ovesné vločky a MCT olej.'),
(27, 'Scitec 100% Cashew Butter', 'scitec-100-cashew-butter', 11, '360.00', '100% CASHEW BUTTER je zdrojem přírodních bílkovin, sacharidů a tuků.'),
(28, 'Scitec 100% Almond Butter', 'scitec-100-almond-butter', 11, '369.00', '100% ALMOND BUTTER je přírodním zdrojem zdravých tuků, mono i polynenasycených.'),
(29, 'Weider Protein 80 Plus', 'weider-protein-80-plus', 11, '448.00', 'Špičkový produkt s biologickou hodnotou 144! Obsah bílkovin 83 % ze čtyř složek!'),
(30, 'BioTech Nitro Pure Whey Gold', 'biotech-nitro-pure-whey-gold', 11, '299.00', 'Špičkový produkt s biologickou hodnotou 144! Obsah bílkovin 83 % ze čtyř složek!'),
(31, 'Czech Virus Protein Pancakes', 'czech-virus-protein-pancakes', 11, '299.00', 'Směs na palačinky s vysokým obsahem proteinu.'),
(32, 'Olimp Provit 80', 'olimp-provit-80', 11, '299.00', '80% vícesložkový protein se sójovým izolátem.'),
(33, 'Survival Hydro Peptides 8000 Fair', 'survival-hydro-peptides-8000-fair', 11, '299.00', 'Hydro Peptides 8000 Fair Power ® je novým produktem značky Survival, který zohledňuje náročnost sportovců na příjem kvalitních a rychle stravitelných bílkovin ve formě aminopeptidů.'),
(34, 'Koliba WPC 80', 'koliba-wpc-80', 11, '370.00', 'Syrovátkový proteinový koncentrát, původem ze Slovenska. Ideálně zpracovaný doplněk stravy, který je možné užívat jako náhradu stravy pro doplnění bílkovin ve stravě.'),
(35, 'All Nutrition Whey protein', 'all-nutrition-whey-protein', 11, '399.00', 'Protein určený pro sportovce se zvýšenou tělesnou aktivitou.'),
(36, 'Aminostar 100% Pure Whey Star', 'aminostar-100-pure-whey-star', 11, '407.00', 'Váš ideální pomocník pro doplnění živin.'),
(37, 'Prom-IN Women Line Shape Protein', 'prom-in-women-line-shape-protein', 11, '415.00', 'Určen především pro aktivní ženy.'),
(38, 'Essential Lean Mass 25', 'essential-lean-mass-25', 12, '600.00', 'Essential Lean Mass 25 v sobě kombinuje proteinový pro-complex s funkčními a sacharidovými složkami a tvoří tak speciálně sestavenou směs živin, kterou sportovci využívají v období, kdy usilují o maximální nárůst svalové hmoty a optimální regeneraci. Essential Lean Mass 25 je vhodný pro nejrůznější druhy sportů vytrvalostního a silově-vytrvalostního charakteru. Zajistí pokrytí zvýšené potřeby super kvalitních živin a důležitou regeneraci díky obsaženým funkčním živinám'),
(39, 'Whey Maxx Gain 30', 'whey-maxx-gain-30', 12, '555.00', 'Whey Maxx Gain 30 se řadí mezi špičkové gainery s perfektním vyvážením živin. Obsahuje unikátní kombinaci mono a polysacharidů, které zajišťují rovnoměrné vylučování inzulínu, a tím dochází k maximálnímu ukládání glykogenu do svalových buněk. Použitím vysoce kvalitního syrovátkového proteinového koncentrátu (WPC) je dosaženo komplexní pokrytí širokého spektra aminokyselin a dále pak postupné uvolňování peptidicky vázaných aminokyselin do svalů ihned po náročném tréninku. To řadí Whey Maxx Gain 30 mezi nejlepší dostupné gainery na trhu. Ve výrobku je přidaný kreatin monohydrát. Vhodné pro amatérské i vrcholové sportovce. Neobsahuje aspartam.'),
(40, 'Ultimate Mass Gain', 'ultimate-mass-gain', 12, '777.00', 'Sacharidy v kombinaci s bílkovinou jsou po tréninku nezbytné pro nastartování kvalitní regenerace. Ultimate Mass Gain elitní německé značky All Stars je obohacen o vitamíny (B1, B2, B6, niacin, B12, vitamín E, vitamín C). Ultimate Mass Gain je určen pro kondičně cvičící, ale i pro začínající kulturisty, silové a fitness sportovce. Pro všechny sportovce, kteří chtějí podpořit nástup regenerace a ochranu svalové hmoty.\r\nAll Stars je jednou z celosvětově nejuznávanějších značek na poli sportovní výživy.\r\nPrvní produkty All Stars uvedl na trh v roce 1993 původní majitel značky Arnold Schwarzenegger'),
(41, 'Enduro Gainer', 'enduro-gainer', 12, '150.00', 'Enduro Gainer je sacharidoproteinový práškový koncentrát pro přípravu koktejlu, který je určený jako potréninkový suplement. Vzájemná kombinace sacharidů, aminokyselin a dalších funkčních látek (kreatin monohydrát, L-glutamin, taurin) podporuje regeneraci a rychle dodá energii po náročném výkonu. Enduro Gainer se míchá s čistou vodou (ne minerální!).'),
(42, 'Rapid Up Mass', 'rapid-up-mass', 12, '205.00', 'Rapid Up Mass je určen pro všechny, kteří vedou aktivní životní styl a potřebují získat kvalitní sacharidy a bílkoviny. Rapid Up Mass obsahuje syrovátkový proteinový komplex, který tělu poskytuje všechny esenciální aminokyseliny, tedy základní stavební kameny bílkovin, které podporují růst svalové hmoty.\r\nRapid Up Mass je speciální kombinace ultrafiltrovaného syrovátkovýho proteinového koncentrátu, izolátu a mléčného proteinového koncentrátu. Obsahuje kvalitní komplex sacharidů a nízký obsah tuků.'),
(43, 'Jumbo Mass Gain 3600', 'jumbo-mass-gain-3600', 12, '1100.00', 'Jumbo Mass Gain 3600 je vysoce energetická formule speciálně sestavená pro tvrdě trénující jedince s vyššími energetickými nároky metabolismu. V každé dávce Jumbo Mass Gain 3600 je obsaženo celých 19 g kvalitních bílkovin tvořených CFM syrovátkovou proteinovou směsí. Vysoké procento sacharidů představuje kralitní zdroj energie. Bílkoviny napomáhají nárůstu svalové hmoty.'),
(44, 'Hyper Mass 5000', 'hyper-mass-5000', 12, '422.00', 'Hyper Mass 5000 nabízí dokonalé řešení pro kulturisty, kteří potřebují udržet rovnováhu aminokyselin. Nedostatek aminokyselin s rozvětvenými řetězci a zvýšená fyzická zátěž vedou k odbourávání svalových tkání v důsledku uspokojení potřeby dusíku v organismu. Nedostatku aminokyselin můžeme předejít s dobře sestaveným jídelníčkem, který obsahuje dostatečné množství kvalitních bílkovin a sacharidů. Kreatin zvyšuje fyzickou výkonnost při po sobě jdoucích krátkodobých intervalech intenzivního tréninku. Hyper Mass 5000 obsahuje 25 % bílkovin a 5 % kreatinu monohydrátu. Díky této kombinaci je Hyper Mass 5000 ideálním přípravkem pro kulturisty začátečníky.'),
(45, 'Protein Ice Cream', 'protein-ice-cream', 12, '513.00', 'Chutná zmrzlina obsahující kvalitní syrovátkové bílkoviny. Nová generace fitness dezertů je zde. Fanatici sportu dosud nemohli ani jen pomyslet na to, že si do přísného jídelníčku budou moci zařadit klasickou zmrzlinu. Ale je tu čas změnit návyky, Protein Ice Cream lze konzumovat i mimo \"cheating\" dny. Z fantastických chutí se budete cítit jako v nebi, přičemž tělo podpoříte vyváženým poměrem sacharidů a bílkovin. Tento produkt obsahuje 28 % kvalitních bílkovin, hlavně syrovátkovou bílkovinu, která je jedním z nejdůležitějších zdrojů elementů pro tvorbu svalové hmoty. Bílkoviny přispívají k růstu svalové hmoty a k jejímu zachování, stejně jako k udržování normálního stavu kostí.\r\n(fakt sacharid)'),
(46, 'Jumbo', 'jumbo', 12, '918.00', 'Jumbo znamená velký, Jumbo znamená silný! Je známým faktem, že lidé podceňují svůj kalorický příjem ve fázi diety, ale také přeceňují přijaté množství kalorií v objemové fázi, kdy se snaží nabírat svalovou hmotu. Jinými slovy v objemu jejich příjem živin není dostatečně velký na to, aby zajistil stabilní a znatelné zlepšování. Každý hledá zázračný postup, aniž by si uvědomil zásadní předpoklad svalového růstu - dostatek kvalitních sacharidů jako zdroje energie a proteinů jako stavebních látek. Jumbo je praktickým řešením pro ty, kteří chtějí tento nedostatek kalorií velmi efektivním způsobem eliminovat.'),
(47, 'Muscle Gainer Mass', 'muscle-gainer-mass', 12, '1600.00', 'Výrobek Muscle Gainer Mass je určen začínajícím a středně pokročilým pěstitelům těla, kteří potřebují zvýšit svůj energetický příjem. Bílkovinnou část přípravku Muscle Gainer Mass tvoří nový druh zdroje bílkovin s názvem Promax Plus - kombinace koncentrátu bílkoviny z mléčné syrovátky a izolátu pšeničné bílkoviny.'),
(48, 'Essential BCAA Synergy', 'essential-bcaa-synergy', 13, '619.00', 'Využijte specifickou kombinaci klíčových aminokyselin, které sportovci využívají v případech, kdy si kladou za cíl zlepšení výkonu, ochranu svalové hmoty před odbouráváním a podporu zotavení. Essential BCAA Synergy obsahuje optimální dávku aminokyselin obohacenou o vitamín B6 pro podporu metabolismu.'),
(49, 'Amino 2500', 'amino-2500', 13, '1172.00', 'Tablety elitní německé značky All Stars s vysokou koncentrací peptidicky vázaných aminokyselin, jejichž zdrojem je enzymaticky rozštěpená syrovátková bílkovina. Syrovátková bílkovina je nejbohatším zdrojem větvených aminokyselin L-leucinu, L-isoleucinu a L-valinu a aminokyseliny L-glutaminu.\r\nAll Stars je jednou z celosvětově nejuznávanějších značek na poli sportovní výživy.\r\nPrvní produkty All Stars uvedl na trh v roce 1993 původní majitel značky Arnold Schwarzenegger.'),
(50, 'Hydro Peptides 8000 Fair Power ®', 'hydro-peptides-8000-fair-power', 13, '300.00', 'Hydro Peptides 8000 Fair Power ® je novým produktem značky Survival, který zohledňuje náročnost sportovců na příjem kvalitních a rychle stravitelných bílkovin ve formě aminopeptidů. Každá tableta Hydro Peptides 8000 Fair Power ® obsahuje 96 % enzymaticky hydrolyzovaného syrovátkového koncentrátu se stupněm hydrolýzy DH12! Přítomnost takto zpracované nejkvalitnější syrovátkové bílkoviny vám zaručuje, že s každou denní dávkou přijmete nezanedbatelné množství peptidicky vázaných aminokyselin (tzv. aminopeptidů). Aminopeptidy se společně s jednotlivými aminokyselinami na základě své přirozené biochemické struktury vstřebávají rovnou do krve a nemusí tak podléhat procesu trávení, tím je zaručena velmi rychlá dostupnost stavebních látek pro vaše svaly.'),
(51, 'Amino Tropin', 'amino-tropin', 13, '1250.00', 'Amino Tropin elitní německé značky All Stars je první tabletovou formou s neuvěřitelně rychlým nástupem účinku. Již během prvních několika minut se tableta rozkládá a dochází tak k postupnému využití. Amino Tropin, to je 100 % volná forma aminokyselin. Svaly jsou po náročném tréninku ohroženy katabolismem, abyste tomuto jevu zabránili, užívejte Amino Tropin před a těsně po tréninku.\r\nAll Stars je jednou z celosvětově nejuznávanějších značek na poli sportovní výživy.\r\nPrvní produkty All Stars uvedl na trh v roce 1993 původní majitel značky Arnold Schwarzenegger.'),
(52, 'BCAA 2:1:1 + Nitric Oxide', 'bcaa-2-1-1-nitric-oxide', 13, '305.00', 'Ojedinělé u tohoto výrobku je zkombinování větvených aminokyselin s nitric oxidem - oxidem dusnatým (arginin alfa ketoglutarát). Tato sůl argininu má zcela výjimečnou vlastnost: v buňkách endotelu cév vytváří oxid dusnatý, látku, která v organismu má tolik pozitivních zdravotních účinků, že za její objevení byla udělena Nobelova cena za medicínu. Nás především zajímá skutečnost, že jejím působením se rozšiřují cévy a zlepšuje se prokrvení pracujících svalů. Tím se k nim dostává mnohem více kyslíku, výživných látek a samozřejmě větvených aminokyselin. Kombinace BCAA a arginin alfa ketoglutarátu je tedy unikátní a podstatně zvyšuje efekt a využití přijímaných větvených aminokyselin.'),
(53, 'Aminogel ®', 'aminogel', 13, '40.00', 'Aminogel ® je světová novinka na trhu aminokyselin od firmy Extrifit. Jedná se o unikátní aminokyselinový produkt, který v jednom balení chutného gelu obsahuje velmi silnou dávku 11 030 mg výhradně volných aminokyselin. Gelová forma zajišťuje ideální stravitelnost a vstřebatelnost a pečlivě vyvážený poměr volných aminokyselin pro maximální anabolický, regenerační a antikatabolický účinek. Žádná pojiva jako v tabletách, žádné slisované proteiny, tento produkt obsahuje výhradně ty nejkvalitnější volné aminokyseliny ve formě gelu, a to ve čtyřech skvělých příchutích.'),
(54, 'Leucin Fair Power ®', 'leucin-fair-power', 13, '275.00', 'Leucin Fair Power ® je farmaceuticky čistá aminokyselina s rozvětveným řetězcem bez jakýchkoliv dalších přísad. Je nesporným faktem, že aminokyseliny BCAA jsou základním doplňkem výživy pro všechny sportovce zaměřené na sílu, svalový objem, ale i vytrvalostní výkony. BCAA jsou tvořeny třemi aminokyselinami - leucinem, isoleucinem a valinem. Potřeba lidského těla je největší právě u leucinu, proto jej mnoho pokročilých sportovců vyhledává a obohacuje jím svůj denní příjem živin. Čistý krystalický leucin je chuťově nahořklý, používá se tedy pro přimíchání do jídla nebo proteinových, sacharidových či jiných nápojů. Kvalitu a čistotu Leucin Fair Power ® garantuje majitel trenérské školy Ronnie.cz a vyhledávaný osobní trenér vrcholových sportovců Pavel Provázek.'),
(55, 'Amino Maxx 6000', 'amino-maxx-6000', 13, '480.00', 'Amino Maxx 6000 je vyroben dle nejnovějších technologií za použití enzymaticky hydrolyzovaného hovězího proteinu vysoké biologické hodnoty. Vzhledem k jeho „předtrávené “ formě putují aminokyseliny rovnou do svalů, kde dochází k okamžitému využití a dále již nezatěžují trávicí systém. Amino Maxx 6000 neobsahuje žádný tuk, a proto je vhodný i do redukčních diet. Aminokyseliny jsou základem bílkovin, které přispívají k udržení a nárůstu svalové hmoty.'),
(56, 'BCAA Promaxx 2:1:1', 'bcaa-promaxx-2-1-1', 13, '340.00', 'BCAA Promaxx 2:1:1 je vynikající doplněk pro všechny sportovce, kteří intenzivně trénují. BCAA Promaxx 2:1:1 by neměly chybět v suplementaci žádného sportovce. Aminokyseliny jsou základem bílkovin, které přispívají k udržení a nárůstu svalové hmoty.'),
(57, 'Amino 5000 Liquid', 'amino-5000-liquid', 13, '770.00', 'Amino 5000 Liquid podobně jako Megabolic Fuel obsahuje tekuté aminokyseliny. Aminokyseliny jsou základním stavebním prvkem bílkovin. Bílkoviny mají anabolický efekt – přispívají k růstu svalové hmoty. Mají také antikatabolický efekt - přispívají k udržení svalové hmoty v situacích, kdy hrozí její katabolizace, jako je intenzivní trénink či redukční dieta.');

-- --------------------------------------------------------

--
-- Struktura tabulky `akce`
--

CREATE TABLE `akce` (
  `produkt` int(10) UNSIGNED NOT NULL,
  `platiDo` date NOT NULL,
  `sleva` int(2) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `kategorie`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatele`
--

CREATE TABLE `uzivatele` (
  `id` int(10) UNSIGNED NOT NULL,
  `jmeno` varchar(20) NOT NULL,
  `heslo` char(60) BINARY NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatele`
--

INSERT INTO `uzivatele` (`id`, `jmeno`, `heslo`) VALUES
(1, 'admin', '$2y$10$XzUBSOhr4AMaDbjE3HBPReHzP8tZ9.iLGmthvTvvugWvGeeU01jXO');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Klíče pro tabulku `produkty`
--
ALTER TABLE `produkty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- Klíče pro tabulku `uzivatele`
--
ALTER TABLE `uzivatele`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jmeno` (`jmeno`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pro tabulku `produkty`
--
ALTER TABLE `produkty`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
