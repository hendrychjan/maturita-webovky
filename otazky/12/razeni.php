<?php
include_once "Produkt.php";

$produkty = Produkt::getAllAndPopulate($_GET["sort"]);

function getCssClass($name)
{
    // výsledek z ternárního operátoru - pokud se parametr sort v url rovná $name,
    // je vybraný link "selected"
    return ($_GET["sort"] === $name) ? "selected" : "";
}

?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        .selected {
            color: red;
            font-weight: 900;
        }

        a {
            color: black;
            font-weight: 400;
        }
    </style>
</head>

<body>
    <form method="get" id="razeni"></form>
    <table>

        <!-- Odkazy pro řazení - záhlaví tabulky -->
        <tr>
            <th>
                <a href="razeni.php?sort=nazev" class="<?= getCssClass("nazev") ?>">
                    Název
                </a>
            </th>
            <th>
                <a href="razeni.php?sort=cena" class="<?= getCssClass("cena") ?>">
                    Cena
                </a>
            </th>
            <th>
                <a href="razeni.php?sort=kategorie" class="<?= getCssClass("kategorie") ?>">
                    Kategorie
                </a>
            </th>
        </tr>

        <!-- Výsledné produkty -->
        <?php foreach ($produkty as $produkt) : ?>
            <tr>
                <td><?= $produkt->nazev ?></td>
                <td><?= $produkt->cenaToString() ?></td>
                <td><?= $produkt->kategorie ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</body>

</html>