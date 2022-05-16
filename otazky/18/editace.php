<?php
include_once "Conn.class.php";
include_once "Produkty.php";

if (isset($_POST["submit"])) {
    $alias = Produkty::genAlias($_POST["nazev"]);
}

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
    <form method="POST">
        <label>Název</label>
        <input type="text" placeholder="Název" name="nazev" />
        <br />

        <label>Kategorie</label>
        <select>
        </select>
        <br />

        <label>Cena</label>
        <input type="text" placeholder="Cena" />
        <br />

        <label>Název</label>
        <textarea></textarea>
        <br />

        <button type="submit" name="submit">Odeslat</button>
    </form>

    <?= (isset($alias)) ? $alias : "Pro vytvoření aliasu odešlete formulář" ?>

</body>

</html>