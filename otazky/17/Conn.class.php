<?php

class Conn
{
    public static function Connect()
    {
        return new PDO("mysql:host=localhost;port=3306;dbname=shop", "root", "", [
            PDO::ATTR_PERSISTENT => true,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
        ]);
    }
    public static function Produkty()
    {
        return self::Connect()->query("SELECT produkty.id, produkty.nazev, produkty.cena, kategorie.nazev kategorie FROM produkty JOIN kategorie ON produkty.kategorie = kategorie.id", PDO::FETCH_OBJ)->fetchAll();
    }

    // Formátovat datum tak, aby šel uložit do databáze
    public static function fomatDatum($datum) {
        $d = date("Y-m-d", strtotime($datum));
        return $d;
    }

    // Validovat akci
    public static function validateAkce($payload)
    {
        // Výsledek validace - obsahuje informaci o výsledku, pokud validace
        // selže, vrátí i hlášení o chybách
        $validationResult = array(
            "valid" => true,
            "validationErrors" => array(),
        );

        // Produkt - musí být validní id existujícího produktu
        $produkty = self::Produkty();
        if (!in_array($payload["produkt"], array_column($produkty, "id"))) {
            $validationResult["valid"] = false;
            array_push($validationResult["validationErrors"], "\"Produkt\" musí existovat");
        }
        
        // Sleva (%) - rozsah v procentech od 0 do 100
        $slevaRegex = '/^([0-9]{1,2}|100)$/';
        if (!preg_match($slevaRegex, $payload["sleva"]) || $payload["sleva"] == 0) {
            $validationResult["valid"] = false;
            array_push($validationResult["validationErrors"], "\"Sleva\" musí být v rozsahu 1-100");
        }

        // Datum - platný datum ve formátu d.m.rrrr
        $datumRegex = '/^([1-9]|[1-2][0-9]|3[0-1])\.([1-9]|1[0-2])\.[2-9][0-9]{3}$/';
        if (!preg_match($datumRegex, $payload["datum"])) {
            $validationResult["valid"] = false;
            array_push($validationResult["validationErrors"], "\"Datum do\" musí být datum ve formátu d.m.rrrr");
            return $validationResult; // nemá cenu dál pokračovat
        }

        // Datum - platé datum
        $datum = explode(".", $payload["datum"]);
        if (!checkdate($datum[1], $datum[0], $datum[2])) {
            $validationResult["valid"] = false;
            array_push($validationResult["validationErrors"], "\"Datum do\" není platné datum");
            return $validationResult; // nemá cenu dál pokračovat
        }
    
        // Datum - datum v budoucnosti
        $dnes = date("Y-m-d");
        $do = strtotime($datum[2] . "-" . $datum[1] . "-" . $datum[0]);
        if ($do <= strtotime($dnes)) {
            $validationResult["valid"] = false;
            array_push($validationResult["validationErrors"], "\"Datum do\" musí být datum v budoucnosti");
        }

        return $validationResult;
    }
}
