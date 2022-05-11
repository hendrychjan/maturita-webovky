<?php

include_once "Kategorie.php";
include_once "Produkt.php";

// Z databáze vzít všechny kategorie
$kategorie = Kategorie::getAll();

if (isset($_POST["submit"])) {
    // Vytvořit instanci nového produktu
    $produkt = new Produkt();

    // Nastavit hodnoty instance z _POST objektu
    $produkt->setValues(
        0,
        $_POST["nazev"],
        $_POST["alias"],
        $_POST["kategorie"],
        $_POST["popis"],
        $_POST["cena"],
    );

    // Uložit produkt do databáze a zkontrolovat, jestli nenastane chyba
    $res = $produkt->save();
    echo $res;
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
    <!-- Formulář na Produkt-->
    <form method="POST">
        <!-- Název -->
        <label for="nazev">Název</label>
        <input type="text" name="nazev" id="nazev" required />
        <br />

        <!-- Alias -->
        <label for="alias">Alias</label>
        <input type="text" name="alias" id="alias" required />
        <br />

        <!-- Kategorie -->
        <label for="kategorie">Kategorie</label>
        <select name="kategorie" id="kategorie">
            <?php foreach ($kategorie as $k) : ?>
                <option value="<?= $k->id ?>"><?= $k->nazev ?></option>;
            <?php endforeach; ?>
        </select>
        <br />

        <!-- Cena -->
        <label for="cena">Cena</label>
        <input type="number" name="cena" id="cena" required />
        <br />

        <!-- Popis -->
        <label for="popis">Popis</label>
        <textarea name="popis" id="popis" required></textarea>
        <br />

        <input type="submit" name="submit" value="Odeslat"></input>
    </form>

</body>

</html>