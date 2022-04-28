let tabulka = document.getElementsByTagName("tbody")[0];
let tydenPosledni = 0;
let akce = [];
let res = "";

// Vygenerovat náhodné datumy akcí
do {
  // Náhodné číslo mezi 1 a 31
  let rn = Math.floor(Math.random() * (31 - 1) + 1);

  // Pokud v tomto dni již není nějaká akce
  if (!akce.includes(rn)) akce.push(rn);
} while (akce.length < 5); // dokud akcí není 5

// Dynamicky vygenerovaná tabulka
for (let den = 1; den <= 31; den++) {
  // Číslo týdne pro daný den
  let tyden = Math.ceil(den / 7);

  // Pokud je den první (pondělí), začít nový řádek v tabulce
  if (tydenPosledni !== tyden) res += "<tr>";

  // Pokud je v tomto dni akce, zvýraznit ho
  if (akce.includes(den)) res += "<td style='color: red'>" + den + "</td>";
  else res += "<td>" + den + "</td>";

  // Pokud je den poslední (neděle), zkončit tento řádek v tabulce
  if (tyden !== Math.ceil((den + 1) / 7)) res += "</tr>";

  // Nastavit týden, pro který byl tento den
  tydenPosledni = tyden;
}

// Zakončit poslední týden (řádek) - nekončí nedělí
res += "</tr>";

// Vygenerovanou tabulku nastavit do HTML
tabulka.innerHTML = res;
