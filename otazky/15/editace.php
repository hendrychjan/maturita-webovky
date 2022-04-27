<?php
    spl_autoload_register(function ($className) {
        require_once("{$className}.class.php");
    });
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<?php
    if (isset($_GET["prod"])) {
        $p = Conn::Produkt($_GET["prod"]);
    } else {
        exit;
    }
?>
<body>
    <form>
        <input type="text" name="nazev" value="<?=$p->nazev?>" />
        <input type="text" name="alias" value="<?=$p->alias?>" />
        <select>
<?php
    foreach (Conn::Kategorie() as $k):
?>
            <option value="<?=$k->id?>"<?php if ($p->kategorie == $k->id) echo " selected"; ?>><?=$k->nazev?></option>
<?php
    endforeach;
?>
        </select>
        <input type="text" name="cena" value="<?=$p->cena?>" />
        <textarea><?=$p->popis?></textarea>
        
        <button type="submit">Poslat</button>
    </form>

</body>
</html>
