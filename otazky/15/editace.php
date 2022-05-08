<?php
include_once "Conn.php";
include_once "Produkt.php";
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<?php
if (isset($_GET["prod"])) {
    // Najít produkt odpovídající zadanému Id
    $p = Produkt::getById($_GET["prod"]);
} else {
    exit;
}

if (isset($_POST["submit"])) {
    $p->fromObj($_POST); // přapsání původních hodnot instance na nové
    $res = $p->update(); // provedení UPDATE v databázi
    echo $res; // zobrazení výsledku operace
}
?>

<body>
    <form method="POST">
        <!-- Název -->
        <label for="nazev">Název</label>
        <input type="text" name="nazev" id="nazev" value="<?= $p->nazev ?>" required />
        <br />

        <!-- Alias -->
        <label for="alias">Alias</label>
        <input type="text" name="alias" id="alias" value="<?= $p->alias ?>" required />
        <br />

        <!-- Kategorie -->
        <label for="kategorie">Kategorie</label>
        <select name="kategorie" id="kategorie">
            <?php
            foreach (Conn::Kategorie() as $k) :
            ?>
                <option value="<?= $k->id ?>" <?php if ($p->kategorie == $k->id) echo " selected"; ?>><?= $k->nazev ?></option>
            <?php
            endforeach;
            ?>
        </select>
        <br />

        <!-- Cena -->
        <label for="cena">Cena</label>
        <input type="text" name="cena" id="cena" value="<?= $p->cena ?>" required />
        <br />

        <!-- Popis -->
        <label for="popis">Popis</label>
        <textarea name="popis" id="popis"><?= $p->popis ?></textarea>
        <br />

        <button type="submit" name="submit">Poslat</button>
    </form>

</body>

</html>