// Pozn: začíná nedělí, protože date.getDay() pro neděli je "0"
let dny = [
  "Neděle",
  "Pondělí",
  "Úterý",
  "Středa",
  "Čtvrtek",
  "Pátek",
  "Sobora",
];

// Tabulka s hodinami v HTML stránce
let kalendar = document.getElementsByClassName("kalendar")[0];

// Datum dnes
let dnes = new Date();

// Datum za 6 měsíců
let konec = new Date();
konec.setMonth(konec.getMonth() + 6);

// Poslední 4 dny ve školním roce
let posledniDny = [];
function generovatPosledniDny() {
  let konecRoku = new Date(konec);

  // Nastavit poslední den v červnu
  konecRoku.setMonth(5);
  konecRoku.setDate(30);

  // Pokud konec školního roku vychází na pondělí až středu (do čtvrtka - 4)
  // končí v pátek ten týden před
  if ([1, 2, 3].includes(konecRoku.getDay())) {
    konecRoku.setDate(konecRoku.getDate() - konecRoku.getDay() - 2);
  }

  // Pokud je 30. sobota, konec školního roku nastavit na pátek toho týdne
  if (konecRoku.getDay() === 6) {
    konecRoku.setDate(konecRoku.getDate() - 1);
  }

  // Pokud je 30. neděle, konec školního roku nastavit na pátek toho týdne
  if (konecRoku.getDay() === 0) {
    konecRoku.setDate(konecRoku.getDate() - 2);
  }

  // Poslední 4 dny od posledního dne školního roku
  for (let i = 0; i < 4; i++) {
    posledniDny.push(konecRoku.getDate() - i);
  }
}
generovatPosledniDny();

// První 3 dny ve školním roce
let prvniDny = [];
function generovatPrvniDny() {
  let zacatekRoku = new Date(konec);

  // Nastavit první den v září (leden = 0)
  zacatekRoku.setMonth(8);
  zacatekRoku.setDate(1);

  // Pokud je 1. čtvrtek, pátek, nebo sobota, začátek školního roku nastavit na pondělí příštího týdne
  if ([4, 5, 6].includes(zacatekRoku.getDay())) {
    zacatekRoku.setDate(9 - zacatekRoku.getDay());
  }

  // Pokud je 1. neděle, začátek školního roku nastavit na pondělí příštího týdne
  if (zacatekRoku.getDay() === 0) {
    zacatekRoku.setDate(2);
  }

  // První 3 dny školního roku
  for (let i = 0; i < 3; i++) {
    prvniDny.push(zacatekRoku.getDate() + i);
  }
}
generovatPrvniDny();

// Do tabulky v HTML přidat datum další třídnické hodiny
function pridatDatum(datum) {
  let radek = "";
  radek += "<tr>";
  radek += `<td>${dny[datum.getDay()].slice(0, 2)}</td>`;
  radek += `<td>${datum.getDate()}.${
    datum.getMonth() + 1
  }. ${datum.getFullYear()}</td>`;
  radek += "</tr>";

  kalendar.innerHTML += radek;
}

// Projet všechny dny až do posledního datumu a pro každý zjistit, jestli se nejedná
// o třídnickou hodinu
for (let d = new Date(); d <= konec; d.setDate(d.getDate() + 1)) {
  // Jsou prázdniny
  if (d.getMonth() === 6 || d.getMonth() === 7) continue;

  // Červen - extra hodiny na konci roku
  if (d.getMonth() === 5 && posledniDny.includes(d.getDate())) {
    pridatDatum(d);
    continue; // je potřeba continue, aby se datum zároveň nezapočítal jako normální úterý
  }

  // Září - extra hodiny na začátku roku
  if (d.getMonth() === 8 && prvniDny.includes(d.getDate())) {
    pridatDatum(d);
    continue; // je potřeba continue, aby se datum zároveň nezapočítal jako normální úterý
  }

  // Je normální úterý
  if (d.getDay() === 2) pridatDatum(d);
}
