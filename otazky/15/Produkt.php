<?php

include_once "Conn.php";

class Produkt {
    public $id;
    public $nazev;
    public $alias;
    public $kategorie;
    public $cena;
    public $popis;

    // Hromadné načtení hodnot instance třídy z objektu (id je naschvál vynecháno - mělo by být immutable)
    public function fromObj($obj) {
        $this->nazev = $obj['nazev'];
        $this->alias = $obj['alias'];
        $this->kategorie = $obj['kategorie'];
        $this->cena = $obj['cena'];
        $this->popis = $obj['popis'];
    }

    // Získání produktu z databáze podle jeho Id
    public static function getById($id)
    {
        $conn = Conn::Connect();

        $query = "SELECT * FROM produkty WHERE produkty.id = :id;";
        $sql = $conn->prepare($query);
        $sql->bindParam(':id', $id);

        $sql->execute();
        $sql->setFetchMode(PDO::FETCH_CLASS, "Produkt");
        return $sql->fetch();
    }

    // Aktualizace hodnot instance
    public function update() {
        // Vytvření instance konektoru do databáze
        $conn = Conn::Connect();

        // SQL příkaz pro provedení úprav + nastavení parametrů
        $query = "UPDATE produkty SET nazev = :nazev, alias = :alias, kategorie = :kategorie, cena = :cena, popis = :popis WHERE produkty.id = :id;";
        $sql = $conn->prepare($query);
        $sql->bindParam(':id', $this->id);
        $sql->bindParam(':nazev', $this->nazev);
        $sql->bindParam(':alias', $this->alias);
        $sql->bindParam(':kategorie', $this->kategorie);
        $sql->bindParam(':cena', $this->cena);
        $sql->bindParam(':popis', $this->popis);

        // Provedení SQL příazu + zabezpečení proti chybám
        try {
            $sql->execute();
            return "Položka byla upravena!";
        } catch (Exception $e) {
            return "Při provádění nastala chyba.";
        }
    }
}