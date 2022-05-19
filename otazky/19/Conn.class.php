<?php

class Conn
{
    public static function Connect()
    {
        return new PDO("mysql:host=localhost;port=3306;dbname=shop", "root", "", [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
        ]);
    }

    public static function login(string $jmeno, string $heslo, bool $zapamatovat): bool
    {
        // Vzít uživatele z databáze
        $conn = self::Connect();
        $query = "SELECT * FROM uzivatele WHERE uzivatele.jmeno = :jmeno AND uzivatele.heslo = :heslo;";
        $sql = $conn->prepare($query);
        $sql->bindParam(":jmeno", $jmeno);
        $sql->bindParam(":heslo", $heslo);
        $sql->execute();
        $res = $sql->fetchAll();

        if (count($res) > 0) {
            // Nastavit, aby se session uložilo i po zavření stránky
            if ($zapamatovat) {
                session_set_cookie_params(108000);
            } else {
                session_set_cookie_params(0); // Session po zavření prohlížeče zmizí
            }
            session_start();

            // Nastavit přihlášeného uživatele
            $_SESSION["uzivatel"] = $res[0];
        }

        // boolean, jestli bylo přihlášení úspěšné nebo ne
        return count($res) > 0;
    }
}
