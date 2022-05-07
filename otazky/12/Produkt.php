<?php

include_once "DbProvider.php";

class Produkt {
    public $nazev;
    public $kategorie;
    public $cena;

    // Formátování ceny
    public function cenaToString() {
        return $this->cena . " Kč";
    }

    public static function getAllAndPopulate($sort = "nazev") {
        // Sloupce, podle kterých lze řadit
        $sortColumns = array("nazev", "kategorie", "cena");
        
        // Ošetření proti nedovoleným parametrům
        if (!in_array($sort, $sortColumns)) {
            $sort = "nazev"; // >> nastavit na defaultní "nazev"
        }

        // Instance konektoru do databáze
        $conn = DbProvider::getConnection();

        // Získání a cast dat z DB
        $query = "SELECT produkty.nazev, produkty.cena, kategorie.nazev AS 'kategorie' FROM produkty LEFT JOIN kategorie ON produkty.kategorie = kategorie.id ORDER BY $sort;";
        $sql = $conn->prepare($query);
        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_CLASS, "Produkt");
        return $sql->fetchAll();
    }
}