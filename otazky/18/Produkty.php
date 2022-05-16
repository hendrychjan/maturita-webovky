<?php

class Produkty
{
  // Vygenerovat alias z názvu produktu
  // pozn: parametry a návratovou hodnotu funkce lze
  // označit pomocí anotace
  static function genAlias(string $nazev): string
  {
    // Celý název změnit na malá písmena
    // pozn: je potřeba použít mb ("multi-byte"), aby se na
    // malá přeměnila všechna písmena
    $alias = mb_strtolower($nazev);

    // Odstranění mezer na začátku a na konci
    $alias = trim($alias);

    // Pole znaků, které je potřeba změnit pro odstranění
    // diakritiky
    $diakritika = array(
      "á" => "a",
      "č" => "c",
      "ď" => "d",
      "é" => "e",
      "ě" => "e",
      "í" => "i",
      "ň" => "n",
      "ř" => "r",
      "š" => "s",
      "ť" => "t",
      "ú" => "u",
      "ů" => "u",
      "ý" => "y",
      "ž" => "z",
      " " => "-",
    );

    // Nahradit jednotlivé znaky
    // foreach ($pole as $key => $value)
    foreach ($diakritika as $znak => $nahrada) {
      $alias = str_replace($znak, $nahrada, $alias);
    }

    return $alias;
  }
}
