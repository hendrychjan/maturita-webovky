<?php
include_once "Conn.php";

// Načtení všech kategorií (kvůli selectu)
$kategrie = Conn::Kategorie();

// Načtení produktu, který je specifikován pomocí Id v URL query parametru
$produkt = Conn::Produkt($_GET["id"]);

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <?php if (isset($produkt->id)) : ?>
        <form>
            <!-- Název -->
            <label for="nazev">Nazev</label>
            <input type="text" name="nazev" id="nazev" value="<?= $produkt->nazev ?>" required />
            <br />

            <!-- Alias -->
            <label for="alias">Alias</label>
            <input type="text" name="alias" id="alias" value="<?= $produkt->alias ?>" required />
            <br />

            <!-- Kategorie -->
            <label for="kategorie">Kategorie</label>
            <select name="kategorie" id="kategorie" required>
                <?php foreach (Conn::Kategorie() as $k) : ?>
                    <option value="<?= $k->id ?>" <?= $k->id === $produkt->kategorie ? "selected" : "" ?>>
                        <?= $k->nazev ?>
                    </option>
                <?php endforeach; ?>
            </select>
            <br />

            <!-- Cena -->
            <label for="cena">Cena</label>
            <input type="text" name="cena" id="cena" value="<?= $produkt->cena ?>" required />
            <br />

            <!-- Popis -->
            <label for="popis">Popis</label>
            <textarea name="popis" id="popis"><?= $produkt->popis ?></textarea>
            <br />

            <button type="submit">Poslat</button>
        </form>
    <?php else : ?>
        <p>Produkt nebyl nalezen</p>
    <?php endif; ?>

</body>

</html>