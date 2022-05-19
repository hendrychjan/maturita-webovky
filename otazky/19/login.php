<?php
  include_once "Conn.class.php";

  if (isset($_POST["submit"])) {
    $prihlasen = Conn::login($_POST["jmeno"], $_POST["heslo"], isset($_POST["zapamatovat"]));

    if ($prihlasen) {
      header("Location: domu.php");
    }
  }
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Přihlášení</title>
</head>

<body>
  <h1>Přihlášení</h1>
  <form method="POST">
    <label for="jmeno">Jméno</label>
    <input name="jmeno" type="text" />
    <br />

    <label for="heslo">Heslo</label>
    <input name="heslo" type="password" />
    <br />

    <input type="checkbox" name="zapamatovat" />
    <label for="zapamatovat">Zapamatovat přihlášení</label>
    <br />

    <button type="submit" name="submit">Přihlásit se</button>
  </form>

  <p>
    <?= (isset($prihlasen) && !$prihlasen) ? "Přihlášení selhalo - nesprávné jméno nebo heslo" : "" ?>
  </p>
</body>

</html>