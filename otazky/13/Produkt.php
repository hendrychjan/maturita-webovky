<?php

include_once "DbProvider.php";

class Produkt
{
    public $id;
    public $nazev;
    public $alias;
    public $kategorie;
    public $popis;
    public $cena;

    // Nastavit hodnoty hromadně celé instanci třídy
    public function setValues($id, $nazev, $alias, $kategorie, $popis, $cena)
    {
        $this->id = $id;
        $this->nazev = $nazev;
        $this->alias = $alias;
        $this->kategorie = $kategorie;
        $this->popis = $popis;
        $this->cena = $cena;
    }

    // Detailní validace pomocí regex
    // Pozn: sama o sobě tato funkce neodpovídá zadání, slouží
    // pouze pro ilustrační účely
    public function validate()
    {
        // Validace pole "nazev"
        $nazevRegex = "/^[a-zA-Záéěíýóúůžščřďťň]+$/";
        if (!preg_match($nazevRegex, $this->nazev))
            return "\"Název\" se může skládat jedině z písmen.";

        // ...validace ostatních polí

        // Pokud kód došel až sem, celý objekt je validní
        return "ok";
    }

    // Uložit instanci třídy do databáze
    public function save()
    {
        /* Provést validaci dat - zakomentováno, jen pro ilustrační účely
        Pozn: problém by byl, že s odesláním stránky se vymaže formulář, což
        nedává smysl - jeho obsah je potřeba zachovat i po odeslání, to už
        je ale mimo zadání... */
        // $validationMessage = $this->validate();
        // if ($validationMessage !== "ok") return $validationMessage;

        $conn = DbProvider::getConnection();

        // SQL query pro přidání nového záznamu do tabulky
        $query = "INSERT INTO produkty (id,nazev,alias,kategorie,popis,cena) VALUES (NULL,:nazev,:alias,:kategorie,:popis,:cena);";
        $sql = $conn->prepare($query);

        // Bind parametrů pro INSERT query
        $sql->bindParam(':nazev', $this->nazev);
        $sql->bindParam(':alias', $this->alias);
        $sql->bindParam(':kategorie', $this->kategorie);
        $sql->bindParam(':popis', $this->popis);
        $sql->bindParam(':cena', $this->cena);

        // Provést sql příkaz + nezapomenout ošetřit proti chybám
        try {
            $sql->execute();
            $res = $conn->lastInsertId(); // Získání Id nově vytvořeného produktu
            return "Nový produkt vytvořen! (id: $res)";
        } catch (Exception $e) {
            return "Nastala chyba při vytváření nového produktu.";
        }
    }
}
