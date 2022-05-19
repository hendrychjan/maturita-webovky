// Informační pole
let editace = document.getElementsByClassName("editace")[0];
let zobrazeni = document.getElementsByClassName("zobrazeni")[0];
let vysledekValidace = document.getElementsByClassName("vysledek-validace")[0];

// Tlačítka pro ovlání
let modeSwitchButton = (document.getElementById("editovat").onclick =
  switchMode);
let formSubmitButton = (document.getElementById("validovat").onclick =
  handleValidateForm);

// Pole formuláře
let nazevInput = document.getElementsByName("nazev")[0];
let ipInput = document.getElementsByName("ip")[0];
let urlInput = document.getElementsByName("url")[0];

function switchMode() {
  // Prohodit zobrazení a formulář
  editace.classList.toggle("hide");
  zobrazeni.classList.toggle("hide");

  // Pokud je editace zrušena, vrátit formuláři původní hodnoty
  if (zobrazeni.classList.contains("hide")) {
    nazevInput.value = "Název sítě";
    ipInput.value = "92.168.1.0";
    urlInput.value = "https://web.cz";
  }
}

// Provést validaci jednotlivých polí formuláře
function handleValidateForm() {
  let valid = true;
  let validationErrorMessages = [];

  // == Název webu ==
  // Odstranění přebytečných mezer
  nazevInput.value = nazevInput.value.trim();

  // Kontrola, jestli není prázdné
  if (nazevInput.value.length === 0) {
    valid = false;
    validationErrorMessages.push('Pole "Název webu" nesmí být prázdné');
  }

  // Kontrola regulárním výrazem
  let nazevRegex = /^[a-záčďéěíňóřšťúůýž0-9\s]*$/i;
  if (nazevInput.value.length > 0 && !nazevRegex.test(nazevInput.value)) {
    valid = false;
    validationErrorMessages.push(
      '"Název webu" může obsahovat pouze písmena, čísla a mezeru mezi slovy'
    );
  }

  // == IP adresa ==
  // Odstranění přebytečných mezer
  ipInput.value = ipInput.value.trim();

  // Kontrola, jestli není prázdné
  if (ipInput.value.length === 0) {
    valid = false;
    validationErrorMessages.push('Pole "Ip adresa" nesmí být prázdné');
  }

  // Kontrola regulárním výrazem
  let ipRegex = /^192\.168\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/;
  if (ipInput.value.length > 0 && !ipRegex.test(ipInput.value)) {
    valid = false;
    validationErrorMessages.push('Pole "Ip adresa" musí být validní IP adresa třídy C');
  }

  // == URL adresa ==
  // Odstranění přebytečných mezer
  
  // Kontrola, jestli není prázdné
  urlInput.value = urlInput.value.trim();
  if (urlInput.value.length === 0) {
    valid = false;
    validationErrorMessages.push('Pole "URL adresa" nesmí být prázdné');
  }

  // Kontrola regulárním výrazem
  let urlRegex = /^(https:\/\/|http:\/\/)?(www.)?([\w\d-]*\.){1,500}[\w\d]{1,10}$/i;
  if (urlInput.value.length > 0 && !urlRegex.test(urlInput.value)) {
    valid = false;
    validationErrorMessages.push('Pole "URL adresa" musí být validní URL adresa');
  }

  if (valid) {
    // Všechna pole jsou validní
    vysledekValidace.style.color = "green";
    vysledekValidace.innerHTML = "Pole jsou validní";
  } else {
    // Při validaci byly nalezeny nějaké chyby - zobrazit uživateli info
    vysledekValidace.style.color = "red";
    vysledekValidace.innerHTML = "";
    for (let message of validationErrorMessages)
      vysledekValidace.innerHTML += `<p>${message}</p>`;
  }
}
