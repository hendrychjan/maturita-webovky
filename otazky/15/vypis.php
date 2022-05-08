<?php
include_once "Conn.php";
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
                <td><a href="editace.php?prod=<?= $p->id ?>"><?= $p->nazev ?></a></td>
                <td><?= $p->cena ?></td>
                <td><?= $p->kategorie ?></td>
            </tr>
        <?php
        endforeach;
        ?>
    </table>

</body>

</html>