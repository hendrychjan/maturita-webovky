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
    public static function Kategorie() {
        return self::Connect()->query("SELECT id, nazev FROM kategorie", PDO::FETCH_OBJ)->fetchAll();
    }
    public static function Produkty() {
        return self::Connect()->query("SELECT produkty.id, produkty.nazev, produkty.cena, kategorie.nazev kategorie FROM produkty JOIN kategorie ON produkty.kategorie = kategorie.id", PDO::FETCH_OBJ)->fetchAll();
    }
    public static function Produkt($id) {
        return self::Connect()->query("SELECT produkty.id, produkty.nazev, produkty.alias, produkty.cena, produkty.popis, kategorie.id kategorie FROM produkty JOIN kategorie ON produkty.kategorie = kategorie.id WHERE produkty.id = {$id}", PDO::FETCH_OBJ)->fetch();
    }
}