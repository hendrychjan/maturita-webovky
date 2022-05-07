<?php
include_once "Produkt.php";

$produkty = Produkt::getAllAndPopulate($_GET["sort"]);

// Extrahování base url (odstranění URL parametrů)
function getUrl() {
    $url = "http://" . $_SERVER['SERVER_NAME'] . ":" . $_SERVER['REQUEST_URI'];
    return explode("?", $url)[0];
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
    <form method="get" id="razeni"></form>
    <table>
        <tr>
            <th><a href="<?php echo getUrl() ?>?sort=nazev">Název</a></th>
            <th><a href="<?php echo getUrl() ?>?sort=cena">Cena</a></th>
            <th><a href="<?php echo getUrl() ?>?sort=kategorie">Kategorie</a></th>
        </tr>
        <?php
        // Render jednotlivých produktů
        foreach ($produkty as $produkt) {
            echo "<tr><td>$produkt->nazev</td><td>" . $produkt->cenaToString() . "</td><td>$produkt->kategorie</td></tr>";
        }
        ?>
    </table>
</body>

</html>