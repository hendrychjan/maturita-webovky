<html>
  <head>
  <meta charset="UTF-8">
	<title>WA4 - cvičné otázky</title>
	<link rel=stylesheet type="text/css" href="style/style.css">
  <style>
  article a {
    display: inline-block;
    width: 80px;
    margin: 5px ;
    color: green;
  }
  </style>
</head>
<body>
<div>
<header>
  <h1>Maturitní otázky - webové aplikace</h1>
</header>
<nav>
  <ul>
    <li><a href="index.php">HTML</a>
      <ul>
        <li><a href="#1">1</a> <a href="#2">2</a> <a href="#3">3</a> <a href="#4">4</a> <a href="#5">5</a></li>
      </ul>
    </li>
    <li><a href="index.php">JavaScript</a>
      <ul>
        <li><a href="#6">6</a> <a href="#7">7</a> <a href="#8">8</a> <a href="#9">9</a> <a href="#10">10</a></li>
      </ul>
    </li>
    <li><a href="index.php">PHP</a>
      <ul>
        <li><a href="#11">11</a> <a href="#12">12</a> <a href="#13">13</a> <a href="#14">14</a> <a href="#15">15</a></li>
        <li><a href="#16">16</a> <a href="#17">17</a> <a href="#18">18</a> <a href="#19">19</a> <a href="#20">20</a></li>
      </ul>
    </li>
    <li><a href="index.php">MySQL</a>
      <ul>
        <li><a href="#21">21</a> <a href="#22">22</a> <a href="#23">23</a> <a href="#24">24</a> <a href="#25">25</a></li>
      </ul>
    </li>
  </ul>
</nav>
<article>
<h2>Zadání otázek - pdf</h2>
<?php
  for($i=1;$i<=25;$i++){
    echo "<a href='".($i<10?"0".$i:$i)."/".($i<10?"0".$i:$i).".pdf' target='_blank'>Otázka $i</a>";
    if($i%5==0){echo "<br>";}
  }
?>

<h2>Soubory - hltml a php stránky</h2>
<?php
  $otazky=array(1=>"text.html","text.html","text.html","form.html","#","ctverce.html","tabulka.html","galerie.html","hodiny.html","formular.html","vyhledavani.php","razeni.php","vlozeni.php","editace.php","editace.php","vypis.php","vytvoreniAkce.php","editace.php","login.php","vypis.php","","","","","");
  for($i=1;$i<=20;$i++){
    echo "<a href='".($i<10?"0".$i:$i)."/{$otazky[$i]}' target='_blank'>Otázka $i</a>";
    if($i%5==0){echo "<br>";}
  }
?>


</article>
</div>
</body>
</html>
