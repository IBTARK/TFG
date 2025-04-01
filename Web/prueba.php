<?php
namespace tfg\src;
require_once __DIR__.'/includes/config.php';
?>

<!DOCTYPE html>
<html>
<head>
    <title>TFG</title>
    <link rel="stylesheet" type="text/css" href="<?= RUTA_CSS ?>/borrador.css"/>
    <link rel="icon" type="image/x-icon" href="<?= RUTA_IMGS ?>/MetroMadridLogo.png" />
</head>
<body>
    <header>
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
    </header>
</body>