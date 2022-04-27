// Hledání elementů
let elementById = document.getElementById("some_id");
console.log("Elementy podle ID:");
console.log(elementById);

let elementsByTagName = document.getElementsByTagName("li");
console.log("Elementy podle tagu:");
console.log(elementsByTagName);

let elementsByClassName = document.getElementsByClassName("nadpis");
console.log("Elementy podle css třídy:");
console.log(elementsByClassName);

// Měnění prvků - pomocí innerHTML
let div = document.getElementsByTagName("div")[0];
div.innerHTML += "<a class='odkaz' href='#'>Test - změna innerHTML</a>";

let a = document.getElementsByClassName("odkaz")[0];
a.href = "https://nechapu.to";
div.innerHTML += "<br/>";

// Měnění prvků - pomocí HTML nodů
let a2ElementNode = document.createElement("a"); // html element
let a2TextNode = document.createTextNode("Odkaz 2"); // jen text
a2ElementNode.appendChild(a2TextNode);
div.appendChild(a2ElementNode);
div.lastChild.setAttribute("href", "https://spse.cz");

// Manipulace s elementy
// div.removeChild(a2ElementNode);
let a2UpdateNode = document.createElement("a");
a2UpdateNode.innerHTML = "asdasd";
a2UpdateNode.href = "https://nechapu.to";
div.replaceChild(a2UpdateNode, a2ElementNode);
console.log(a2UpdateNode.href);

// // Event handlery (...eventy viz intellisense)
let img = document.getElementsByTagName("img")[0];
let btn = document.getElementsByTagName("button")[0];
let ta = document.getElementsByTagName("textarea")[0];
btn.onclick = () => {
  a2UpdateNode.classList.toggle("red-color");
  img.src = "img1.gif";
  console.log(ta.value);
};
// btn.onclick = function () {
//   console.log(this);
// };
// // btn.onmouseover = () => alert("pagman");

// console.log(this);
