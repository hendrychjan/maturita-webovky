<?php

class DbProvider {
    public static function getConnection() {
        $conn = new PDO(
            "mysql:host=localhost;dbname=shop;charset=UTF8",
            "root",
            ""
        );

        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $conn;
    }
}