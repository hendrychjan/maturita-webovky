<?php

include_once "DbProvider.php";

class Kategorie
{
    public $id;
    public $nazev;
    public $alias;
    public $nadrazena;

    // Z databáze vybrat všechny kategorie
    public static function getAll()
    {
        $conn = DbProvider::getConnection();

        $query = "SELECT * FROM kategorie";
        $sql = $conn->prepare($query);

        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_CLASS, "Kategorie");

        return $sql->fetchAll();
    }
}
