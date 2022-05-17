<?php
spl_autoload_register(function ($className) {
    require_once("{$className}.class.php");
});

if (isset($_POST["submit"])) {
    $validace = Conn::validateAkce($_POST);
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>17</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
    <form method="POST">
        <select name="produkt">
            <?php
            foreach (Conn::Produkty() as $p) :
            ?>
                <option value="<?= $p->id ?>"><?= $p->nazev ?> (<?= $p->kategorie ?>)</option>
            <?php
            endforeach;
            ?>
        </select>
        <input type="text" name="sleva" placeholder="Sleva %" />
        <input type="text" name="datum" placeholder="Platí do" />

        <button type="submit" name="submit">Poslat</button>
    </form>

    <?php
    if (isset($validace)) {
        if (!$validace["valid"]) {
            foreach ($validace["validationErrors"] as $error) {
                echo "<p>$error</p>";
            }
        } else {
            echo "<p>Valid!</p>";
            echo "<p><b>" . Conn::fomatDatum($_POST["datum"]) . "</b></p>";
        }
    }
    ?>
</body>

</html>