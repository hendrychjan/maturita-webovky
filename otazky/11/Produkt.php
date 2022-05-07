<?php

include_once "DbProvider.php";

class Produkt
{
    public $id;
    public $nazev;
    public $alias;
    public $kategorie;
    public $cena;
    public $popis;

    // Výpis instance v html
    public function renderHtml() {
        $res = "<div style=\"background-color: grey; margin: 5px\">";
        $res = $res . "<p><b>$this->nazev</b></p>";
        $res = $res . "</div>";
        return $res;
    }

    // Metoda pro získání dat z databáze podle zadaných filtrů
    static function getAllFiltered($nazev, $kategorie)
    {
        // Konektor do databáze
        $conn = DbProvider::getConnection();

        // Zjistit které z parametrů metody jsou nastaveny
        $isNazev = ($nazev !== "");
        $isKategorie = ($kategorie !== "0");

        // Pokud nejsou žádní parametry, vrátit prázdné pole
        if (!$isNazev && !$isKategorie) return [];

        // je název, není kategorie - filtrovat jen podle názvu
        if ($isNazev && !$isKategorie) {
            $query = "SELECT * FROM produkty WHERE produkty.nazev LIKE CONCAT(:nazev, '%');";
            $sql = $conn->prepare($query);
            $sql->bindParam(':nazev', $nazev);
        }

        // není název, ale je kategorie - filtrovat podle kategorie
        if (!$isNazev && $isKategorie) {
            $query = "SELECT * FROM produkty WHERE produkty.kategorie = :kategorie;";
            $sql = $conn->prepare($query);
            $sql->bindParam(':kategorie', $kategorie);
        }

        // je název i kategorie - filtrovat podle obojího
        if ($isNazev && $isKategorie) {
            $query = "SELECT * FROM produkty WHERE produkty.kategorie = :kategorie AND produkty.nazev LIKE CONCAT(:nazev, '%');";
            $sql = $conn->prepare($query);
            $sql->bindParam(':kategorie', $kategorie);
            $sql->bindParam(':nazev', $nazev);
        }

        // finální část pro získání dat z databáze je pro všechny možnosti filtrů stejná
        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_CLASS, "Produkt"); // cast raw dat na instance třídy Produkt
        return $sql->fetchAll();
    }
}
