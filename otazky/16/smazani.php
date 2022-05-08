<?php
include_once "Conn.php";

// Z databáze načíst produkt specifikovaný pomocí Id v URL parametru
$p = Conn::Produkt($_GET["prod"]);

// Při prvním načtení stánky zatím k odstranění nedojde
$deleted = false;

if (isset($_POST["submit"])) {
    if ($_POST["submit"] === "ne") {
        header("Location: vypis.php"); // vrátit se zpět na výpis
        die(); // uzavřít tuto stránku
    }

    if ($_POST["submit"] === "ano") {
        $res = Conn::DeleteProdukt($_GET["prod"]); // odstranit produkt
        $deleted = true; // označit, že odstranění bylo provedeno
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <div>
        <!-- Po odstranění zobrazit informační hlášku -->
        <?php if (!$deleted) : ?>
            <!-- Kontrola, jestli pod zadaným id vůbec existuje nějaký produkt -->
            <?php if (isset($p->nazev)) : ?>
                <h1><?= $p->nazev ?></h1>
                <p><b>Alias: </b><?= $p->alias ?></p>
                <p><b>Cena: </b><?= $p->cena ?> Kč</p>
                <p><b>Kategorie: </b><?= $p->kategorie ?></p>
                <hr />
                <p><i>Opravdu chcete produkt odstranit?</i></p>
                <form method="post">
                    <input type="submit" name="submit" value="ano" />
                    <input type="submit" name="submit" value="ne" />
                </form>
            <?php else : ?>
                <p>Produkt nebyl nalezen</p>
            <?php endif; ?>
        <?php else : ?>
            <p><?= $res ?></p>
            <a href="vypis.php">Zpět</a>
        <?php endif; ?>
    </div>
</body>

</html>