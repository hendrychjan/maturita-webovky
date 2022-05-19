<?php
  // Odhlásit uživatele - vyresetovat sesion
  session_start();
  unset($_SESSION["uzivatel"]);
  session_destroy();
  header("Location: domu.php");
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Odhlášení</title>
</head>
<body>
  <p>Probíhá odhlášení...</p>
</body>
</html>