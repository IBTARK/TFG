<?php 
$pagina = basename($_SERVER['PHP_SELF']);
$ocultaMenu = ["index.php"]; 
?>
<header>
    <?php if (!in_array($pagina, $ocultaMenu)): ?>

    <div class="logo-container">
    <img src="<?= RUTA_IMGS; ?>/MetroMadridLogo.png" alt="LogoMetro" id ="LogoMetro">
    </div>  

    <div class="logo-cam">
    <img src="<?= RUTA_IMGS; ?>/EmblemaCAM.png" alt="LogoCam" id ="LogoCam">
    </div>

    <nav class="menu">
        <ul>
            <li><a href="./index.php">Inicio</a></li>
            <li><a href="./lineasMetro.php">Estaciones</a></li>
            <li><a href="./acerca.php">Acerca</a></li>
        </ul>
    </nav>
    <?php endif; ?>

    <div class="titulo">
        <h1>Good Stations</h1>
    </div>
</header>