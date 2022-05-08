<?php

// Tato třída slouží ke komunikaci s databází (v rámci plain object přístupu - ne OOP)
class Conn
{
    // Vytvoření konektoru do databáze
    public static function Connect()
    {
        return new PDO("mysql:host=localhost;port=3306;dbname=shop", "root", "", [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
        ]);
    }

    // Načtení všech produktů
    public static function Produkty()
    {
        return self::Connect()->query("SELECT produkty.id, produkty.nazev, produkty.cena, kategorie.nazev kategorie FROM produkty JOIN kategorie ON produkty.kategorie = kategorie.id", PDO::FETCH_OBJ)->fetchAll();
    }

    // Načtení všech kategorií
    public static function Kategorie()
    {
        $conn = self::Connect();

        $query = "SELECT * FROM kategorie;";
        $sql = $conn->prepare($query);

        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_OBJ);

        return $sql->fetchAll();
    }

    // Načtení produktu podle jeho Id
    public static function Produkt($id)
    {
        $conn = self::Connect(); // <- self ukazuje na statické metody sebe sama (podobně jako $this na instanční)
        
        $query = "SELECT * FROM produkty WHERE produkty.id = :id;";
        $sql = $conn->prepare($query);
        $sql->bindParam(':id', $id);
        
        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_OBJ);
        
        return $sql->fetch();
    }
}
