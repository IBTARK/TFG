<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>TFG</title>
    <link rel="stylesheet" type="text/css" href="<?= RUTA_CSS ?>/estiloIndex.css">
    <link rel="icon" type="image/x-icon" href="<?= RUTA_IMGS ?>/MetroMadridLogo.png" />
</head>
<body>
    <header>
        <div class="logo-cam-index">
            <img src="./images/EmblemaCAM.png" alt="LogoCam" id="LogoCamIndex">
        </div>
        <h1>Good Stations</h1>
    </header>
    <div class="logo-index">
            <img src="./images/MetroMadridLogo.png" alt="LogoMetro" id="logoIndex">
    </div>
    <form id="botonEntrar" action="elegirRuta.php" method="POST">
        <button type="submit">Entrar</button>
    </form>
</body>
</html>