<?php

include_once "Conn.php";

// Funkce pro získání celého URL na stránku s editací (dynamicky)
// Pozn: pro zjednodušení neřeší protokol (http/https)
function getUrl($id)
{
    // rozdělí URL na kusy (maturita-webovky, otazky, 14, vypis.php)
    $uri = explode("/", $_SERVER["REQUEST_URI"]);

    // z rozsekaného url do pole odebere "vypis.php"
    array_pop($uri);

    $res = "http://"; // protokol (neřeší, pro zjednodušení)
    $res .= $_SERVER["SERVER_NAME"]; // localhost
    $res .= implode("/", $uri); // spojí rozdělené url: "maturita-webovky/otazky/14"
    $res .= "/editace.php?id=" . $id; // přidá odkaz na stránku s editací, včetně Id parametru
    return $res;
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
    <table>
        <tr>
            <th>Název</th>
            <th>Cena</th>
            <th>Kategorie</th>
        </tr>
        <?php
        foreach (Conn::Produkty() as $p) :
        ?>
            <tr>
                <td><a href="<?= getUrl($p->id) ?>"><?= $p->nazev ?></a></td>
                <td><?= $p->cena ?></td>
                <td><?= $p->kategorie ?></td>
            </tr>

        <?php
        endforeach;
        ?>
    </table>

</body>

</html>