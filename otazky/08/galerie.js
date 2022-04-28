let images = [
  { title: "#JAKOLEV", source: "img/art501.jpg", author: "Chary" },
  { title: "263 005-1", source: "img/263090.jpg", author: "Martin Mačanga" },
  { title: "556.0506", source: "img/556305.jpg", author: "Jiří Navrátil" },
  { title: "240 061-2", source: "img/240515.jpg", author: "Richard Sadloň" },
  { title: "754 031-3", source: "img/7542009.jpg", author: "Adam Hasoň" },
  { title: "Km 30,2", source: "img/zkz187.jpg", author: "Jiří Navrátil" },
  { title: "E 698.002", source: "img/ostel036.jpg", author: "Standa Lopata" },
];

// Index aktuálního obrázku
let aktualni = 0;

let navigacePopis = document.getElementsByClassName("popis")[0];
let navigacePredchozi =
  document.getElementsByClassName("navigace")[0].children[0];
let navigaceDalsi = document.getElementsByClassName("navigace")[0].children[2];
let main = document.getElementsByClassName("main")[0];
let nahledy = document.getElementsByClassName("nahledy")[0];

// Render UI - zavolá se vždy, když se změní vybraný obrázek
let render = () => {
  // Titulek v navigaci
  navigacePopis.innerHTML = `${images[aktualni].title} (${images[aktualni].author})`;

  // Hlavní zobrazený obrázek
  main.children[0].src = images[aktualni].source;

  // Vygenerovat náhledy
  nahledy.innerHTML = "";
  for (let i in images) {
    // Nový náhled
    let nahled = document.createElement("img");

    // Nastavit zdroj obrázku a alt atribut
    nahled.src = images[i].source;
    nahled.alt = `${images[aktualni].title} (${images[aktualni].author})`;

    // Bonus: na kliknutí nastavit náhled do "view"
    nahled.onclick = () => {
      aktualni = i;
      render();
    };

    // Zvýraznit jako aktuální
    if (i == aktualni) nahled.classList.add("aktualni");

    // Přidat náhled do sekce "náhledy"
    nahledy.appendChild(nahled);
  }
};

// Při kliknutí na "Následující" posunout o 1 dopředu a přerendrovat
navigacePredchozi.onclick = () => {
  // Zkontrolovat přetečení
  if (aktualni === 0) aktualni = images.length - 1;
  else aktualni--;
  render();
};

// Při kliknutí na "Následující" posunout o 1 dopředu a přerendrovat
navigaceDalsi.onclick = () => {
  // Zkontrolovat přetečení
  if (aktualni + 1 === images.length) aktualni = 0;
  else aktualni++;

  // Přerendrovat UI
  render();
};

// Každých 10 sekund posunout obrázek o 1 dopředu
// POZN: lze použít již existující metodu onclick z navigace
setInterval(navigaceDalsi.onclick, 10000);

// Vyrendrovat při prvím načtení stránky
render();
