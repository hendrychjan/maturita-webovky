<?php
    spl_autoload_register(function ($className) {
        require_once("{$className}.class.php");
    });
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>17</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <form>
        <select>
<?php
    foreach (Conn::Produkty() as $p):
?>
            <option value="<?=$p->id?>"><?=$p->nazev?> (<?=$p->kategorie?>)</option>
<?php
    endforeach;
?>
        </select>
        <input type="text" placeholder="Sleva %" />
        <input type="text" placeholder="Platí do" />
        
        <button type="submit">Poslat</button>
    </form>
    
</body>
</html>