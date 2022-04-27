// Runtime proměnné
let pole = [];
let obsazene = [];
let hrajeCervena = true;

function tah() {
  let index = pole.indexOf(this);
  // Kontrola, jestli je pole už obsazené
  if (!obsazene.includes(index)) {
    // Nastavit barvu pole
    this.classList.add(hrajeCervena ? "cervena" : "modra");
    // Označit místo jako obsazené
    obsazene.push(index);
    // Předat tah druhému hráči
    hrajeCervena = !hrajeCervena;
    info.textContent = `Hraje: ${hrajeCervena ? "červená" : "modrá"}`;
  }

  // Pokud jsou všechna pole obsazena, hra je u konce
  if (obsazene.length === pole.length) {
      // pozn.: timeout je tam proto, aby se poslední označené pole stihnulo vybarvit
      setTimeout(() => alert("Hra je u konce"), 100);
      info.textContent = "Hra je u konce";
  }
}

// Definice hracího pole
let cells = document.getElementsByTagName("td");
for (let cell of cells) {
  cell.onclick = tah;
  pole.push(cell);
}

// Nastavení informace o tom, kdo na začátku hraje
let info = document.getElementsByClassName("hrac")[0];
info.textContent = "Hraje: červená";
