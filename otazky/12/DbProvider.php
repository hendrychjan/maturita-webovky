<?php

// Tato třída jednoduše poskytuje statickou metodu pro získání
// instance PDO konektoru
class DbProvider
{
    public static function getConnection()
    {
        $conn = new PDO(
            "mysql:host=localhost;port=3306;dbname=shop;charset=UTF8",
            "root",
            ""
        );

        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
}
