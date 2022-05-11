<?php
include_once "Produkt.php";
include_once "Kategorie.php";

// Z databáze načíst včechny kategorie (kvůli selectu)
$kategorie = Kategorie::getAll();

// Pokud je filtr form odeslán, vybrat produkty
if (isset($_GET["submit"])) {
    $produkty = Produkt::getAllFiltered($_GET["nazev"], $_GET["kategorie"]);
}
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <form method="GET">
        <!-- Název produktu -->
        <label for="nazev">Název</label>
        <input name="nazev" id="nazev" type="text" />
        <br />

        <!-- Kategorie produktu -->
        <label for="kategorie">Kategorie</label>
        <select name="kategorie" id="kategorie">
            <option value="0">Vyberte kategorii</option>
            <?php foreach ($kategorie as $k) : ?>
                <option value="<?= $k->id ?>" \"><?= $k->nazev ?></option>
            <?php endforeach; ?>
        </select>
        <br />

        <button type="submit" name="submit">Vybrat</button>
    </form>
    <div id="vysledky">
        <!-- Výsledné produky -->
        <?php
        // Zobrazit výsledky pouze pokud je filtrační formulář odeslán
        if (isset($_GET["submit"])) {
            if (count($produkty) === 0) { // Nebyly nalezeny žádné výsledky
                echo "Zadaným filtrům neodpovídají žádné výsledky...";
            } else { // Z databáze se něco vrátilo
                foreach ($produkty as $p) {
                    echo $p->renderHtml();
                }
            }
        }
        ?>
    </div>
</body>

</html>