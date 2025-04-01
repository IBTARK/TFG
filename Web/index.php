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
        <div class="header-container">
            <img src="./images/EmblemaCAM.png" alt="LogoCam" id="logo-cam-index">
            <h1>Good Stations</h1>
        </div>
    </header>
    
    <img src="./images/MetroMadridLogo.png" alt="LogoMetro" id="logo-index">
    
    <form id="botonEntrar" action="elegirRuta.php" method="POST">
        <button type="submit">Entrar</button>
    </form>
</body>
</html>