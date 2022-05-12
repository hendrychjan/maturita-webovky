<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fotogalerie</title>
</head>

<body>
    <h1><?= "Produkt ID: " . $_GET["prod"] ?></h1>
    <?php if ($handle = opendir('./' . $_GET['prod'])) : ?>
        <?php while (false !== ($file = readdir($handle))) : ?>
            <?php if ($file !== "." && $file !== "..") : ?>
                <img width="100px" src="./<?= $_GET['prod'] . '/' . $file ?>" alt="Soubor" />
            <?php endif; ?>
        <?php endwhile; ?>
    <?php else : ?>
        <p>K tomuto produktu nebyly nalezeny žádné fotografie
        <?php endif; ?>
</body>

</html>