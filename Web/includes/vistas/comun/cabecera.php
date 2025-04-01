<?php 
$pagina = basename($_SERVER['PHP_SELF']);
$ocultaMenu = ["index.php"]; 
?>
<header>
    <?php if (!in_array($pagina, $ocultaMenu)): ?> 
    <div class = "logo-metro">
        <img src="./images/MetroMadridLogo.png" alt="LogoMetro" id="logoMetro">
    </div>
    <h1 class = "titulo">Good Stations</h1>
    <div class = "menu">
        <img src="./images/EmblemaCAM.png" alt="LogoMetro" id="logoMetro">
        <nav>
            <a href="./index.php">Inicio</a>
            <a href="./lineasMetro.php">Estaciones</a>
            <a href="./acerca.php">Acerca</a>
        </nav>
    </div>
    <?php endif; ?>
</header>