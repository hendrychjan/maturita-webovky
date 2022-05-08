<?php

class Conn {

    // Konektor do databáze
    public static function Connect()
    {
        return new PDO("mysql:host=localhost;port=3306;dbname=shop", "root", "", [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
        ]);
    }

    // Výpis všech produktů
    public static function Produkty() {
        return self::Connect()->query("SELECT produkty.id, produkty.nazev, produkty.cena, kategorie.nazev kategorie FROM produkty JOIN kategorie ON produkty.kategorie = kategorie.id", PDO::FETCH_OBJ)->fetchAll();
    }

    // Nalezení produktu, který je specifikován pomocí id
    public static function Produkt($id) {
        $conn = self::Connect();

        $query = "SELECT produkty.nazev, produkty.cena, produkty.alias, kategorie.nazev AS 'kategorie' FROM produkty LEFT JOIN kategorie ON produkty.kategorie = kategorie.id WHERE produkty.id = :id;";
        $sql = $conn->prepare($query);
        $sql->bindParam(':id', $id);
        $sql->execute();

        $sql->setFetchMode(PDO::FETCH_OBJ);
        return $sql->fetch();
    }

    // Odstranění produktu
    public static function DeleteProdukt($id) {
        // Vytvoření instance konektoru do databáze
        $conn = self::Connect();

        // SQL příkaz pro odstranění položky z databáze
        $query = "DELETE FROM produkty WHERE produkty.id = :id;";
        $sql = $conn->prepare($query);
        $sql->bindParam(':id', $id);
        
        // Provedení příkazu + ochrana proti chybám
        try {
            $sql->execute();
            return "Položka byla odstraněna";
        } catch (Exception $e) {
            return "Při provádění nastala chyba";
        }
    }
}