<?php
session_start();
// if (!isset($_SESSION["uzivatel"])) {
//   header("Location: login.php");
// }
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Domů</title>
</head>

<body>
  <h1>Domů</h1>
  <?php if (isset($_SESSION["uzivatel"])) : ?>
    <p>Jste přihlášeni jako: <b><?= $_SESSION["uzivatel"]["jmeno"] ?></b></p>
    <a href="logout.php">Odhlásit se</a>
  <?php else : ?>
    <p>Nejste přihlášeni</p>
    <a href="login.php">Přihlásit se</a>
  <?php endif; ?>
</body>

</html>