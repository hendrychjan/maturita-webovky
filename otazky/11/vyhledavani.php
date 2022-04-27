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
<body>
    <form >
        <input type="text" />
        <select>
        </select>
    </form>
    <div id="vysledky">
        
    </div>
</body>
</html>