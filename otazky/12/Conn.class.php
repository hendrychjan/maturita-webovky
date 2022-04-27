<?php

class Conn {
    public static function Connect()
    {
        return new PDO("mysql:host=localhost;port=3306;dbname=shop", "root", "", [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
        ]);
    }
}