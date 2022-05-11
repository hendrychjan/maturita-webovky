<?php

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
