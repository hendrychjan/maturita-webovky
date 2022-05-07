<?php

// Tato třída jednoduše poskytuje statickou metodu pro získání
// instance PDO konektoru
class DbProvider
{
    static function getConnection()
    {
        $conn = new PDO(
            "mysql:dbname=shop;charset=UTF8;host=localhost",
            "root",
            "",
        );
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
}
